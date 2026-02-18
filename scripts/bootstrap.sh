#!/usr/bin/env bash
# =============================================================================
# bootstrap.sh — AI Workshop Project Bootstrapper
#
# Walks you through creating a new application project from the workshop
# skeleton templates.  Copies your chosen backend and/or frontend skeleton
# to a destination directory outside this repo, substitutes your app name
# into key project files, and initialises a git repository with an initial
# commit so you can start coding right away.
# =============================================================================
set -euo pipefail

# ---------------------------------------------------------------------------
# Colour helpers
# ---------------------------------------------------------------------------
CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BOLD='\033[1m'
NC='\033[0m' # No Colour

info()    { echo -e "${CYAN}ℹ  $*${NC}"; }
success() { echo -e "${GREEN}✔  $*${NC}"; }
warn()    { echo -e "${YELLOW}⚠  WARNING: $*${NC}"; }
error()   { echo -e "${RED}✖  ERROR: $*${NC}" >&2; }
header()  { echo -e "\n${BOLD}${CYAN}$*${NC}"; echo -e "${CYAN}$(printf '%.0s─' {1..60})${NC}"; }
die()     { error "$*"; exit 1; }

# ---------------------------------------------------------------------------
# Paths — all relative to this script so the repo can live anywhere
# ---------------------------------------------------------------------------
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WORKSHOP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
SKELETONS_DIR="$WORKSHOP_DIR/skeletons"

# ---------------------------------------------------------------------------
# Discover available skeletons directly from the filesystem
# ---------------------------------------------------------------------------
mapfile -t BACKEND_SKELETONS < <(
  find "$SKELETONS_DIR/backend" -mindepth 1 -maxdepth 1 -type d \
    -exec basename {} \; | sort
)
mapfile -t FRONTEND_SKELETONS < <(
  find "$SKELETONS_DIR/frontend" -mindepth 1 -maxdepth 1 -type d \
    -exec basename {} \; | sort
)

if [[ ${#BACKEND_SKELETONS[@]} -eq 0 && ${#FRONTEND_SKELETONS[@]} -eq 0 ]]; then
  die "No skeletons found under $SKELETONS_DIR — is this the right repo?"
fi

# ---------------------------------------------------------------------------
# Port / dev-command lookup table (skeleton-name → port)
# ---------------------------------------------------------------------------
declare -A SKELETON_PORT
SKELETON_PORT["express-skeleton"]="3000"
SKELETON_PORT["fastapi-skeleton"]="8000"
SKELETON_PORT["flask-skeleton"]="5000"
SKELETON_PORT["go-skeleton"]="8080"
SKELETON_PORT["micronaut-skeleton"]="8080"
SKELETON_PORT["quarkus-skeleton"]="8080"
SKELETON_PORT["rust-skeleton"]="8080"
SKELETON_PORT["spring-boot-skeleton"]="8080"
SKELETON_PORT["angular-skeleton"]="4200"
SKELETON_PORT["react-skeleton"]="5173"
SKELETON_PORT["vue-skeleton"]="5174"
SKELETON_PORT["svelte-skeleton"]="5173"

# ---------------------------------------------------------------------------
# Helper: prompt the user to pick from a numbered list
#   Usage:  pick_from_list "prompt" "RESULT_VAR" item1 item2 ...
#   Sets:   RESULT_VAR to the chosen item (or empty string for "None")
# ---------------------------------------------------------------------------
pick_from_list() {
  local prompt="$1"
  local result_var="$2"
  shift 2
  local items=("$@")

  echo ""
  echo -e "${BOLD}$prompt${NC}"
  echo "  0) None"
  local i=1
  for item in "${items[@]}"; do
    printf "  %d) %s\n" "$i" "$item"
    (( i++ ))
  done

  local choice
  while true; do
    printf "\nEnter number [0-%d]: " "${#items[@]}"
    read -r choice
    if [[ "$choice" =~ ^[0-9]+$ ]] && \
       [[ "$choice" -ge 0 ]] && \
       [[ "$choice" -le "${#items[@]}" ]]; then
      break
    fi
    warn "Please enter a number between 0 and ${#items[@]}"
  done

  if [[ "$choice" -eq 0 ]]; then
    printf -v "$result_var" ""
  else
    printf -v "$result_var" "%s" "${items[$((choice - 1))]}"
  fi
}

# ---------------------------------------------------------------------------
# Helper: check that a command exists; warn if not
#   Usage: check_cmd "git" "git" "https://git-scm.com"
# ---------------------------------------------------------------------------
check_cmd() {
  local display_name="$1"
  local cmd="$2"
  local url="${3:-}"
  if ! command -v "$cmd" &>/dev/null; then
    if [[ -n "$url" ]]; then
      warn "$display_name not found — install it from $url"
    else
      warn "$display_name ($cmd) not found in PATH"
    fi
  fi
}

# ---------------------------------------------------------------------------
# Helper: apply app-name substitutions to a skeleton copy
#   Usage: substitute_names "<dest_dir>" "<app_name>" "<skeleton_name>"
# ---------------------------------------------------------------------------
substitute_names() {
  local dir="$1"
  local app_name="$2"
  local skeleton_name="$3"

  # README.md — replace first # heading
  local readme="$dir/README.md"
  if [[ -f "$readme" ]]; then
    sed -i "0,/^# .*/s||# $app_name|" "$readme"
  fi

  # package.json — "name" field (Node/frontend skeletons)
  local pkg="$dir/package.json"
  if [[ -f "$pkg" ]]; then
    sed -i "s|\"name\": \"[^\"]*\"|\"name\": \"$app_name\"|" "$pkg"
  fi

  # go.mod — module line
  local gomod="$dir/go.mod"
  if [[ -f "$gomod" ]]; then
    sed -i "s|^module .*|module $app_name|" "$gomod"
  fi

  # Cargo.toml — name field under [package]
  local cargo="$dir/Cargo.toml"
  if [[ -f "$cargo" ]]; then
    # Only replace within the [package] section
    awk -v name="$app_name" '
      /^\[package\]/ { in_pkg=1 }
      /^\[/ && !/^\[package\]/ { in_pkg=0 }
      in_pkg && /^name = / { $0 = "name = \"" name "\"" }
      { print }
    ' "$cargo" > "$cargo.tmp" && mv "$cargo.tmp" "$cargo"
  fi

  # pom.xml — project artifactId + display name (Java skeletons)
  local pom="$dir/pom.xml"
  if [[ -f "$pom" ]]; then
    # Replace the project's own artifactId (the one that follows
    # <groupId>com.example</groupId>) — uses awk to find the right occurrence
    awk -v name="$app_name" '
      /<groupId>com\.example<\/groupId>/ { found=1 }
      found && /<artifactId>/ {
        sub(/<artifactId>[^<]*<\/artifactId>/, "<artifactId>" name "<\/artifactId>")
        found=0
      }
      { print }
    ' "$pom" > "$pom.tmp" && mv "$pom.tmp" "$pom"

    # Replace top-level <name> tag (e.g. "Spring Boot Skeleton")
    sed -i "s|<name>[^<]*Skeleton[^<]*</name>|<name>$app_name</name>|Ig" "$pom"
  fi

  # application.yml (Spring Boot) — spring.application.name
  local app_yml="$dir/src/main/resources/application.yml"
  if [[ -f "$app_yml" ]]; then
    sed -i "s|^\( *name: \).*|\1$app_name|" "$app_yml"
  fi
}

# ---------------------------------------------------------------------------
# Helper: remove build artefacts & dependency dirs from a copied skeleton
# ---------------------------------------------------------------------------
clean_copy() {
  local dir="$1"
  rm -rf \
    "$dir/node_modules" \
    "$dir/target" \
    "$dir/dist" \
    "$dir/.venv" \
    "$dir/venv" \
    "$dir/__pycache__" \
    "$dir/.mypy_cache" \
    2>/dev/null || true
  find "$dir" -name "*.pyc" -delete 2>/dev/null || true
  find "$dir" -name "__pycache__" -type d -exec rm -rf {} + 2>/dev/null || true
}

# ---------------------------------------------------------------------------
# Helper: validate an app name (lowercase letters, digits, hyphens, 1-64 chars)
# ---------------------------------------------------------------------------
validate_app_name() {
  local name="$1"
  if [[ -z "$name" ]]; then
    return 1
  fi
  if [[ ! "$name" =~ ^[a-z0-9][a-z0-9-]{0,62}[a-z0-9]$|^[a-z0-9]$ ]]; then
    return 1
  fi
  return 0
}

# ---------------------------------------------------------------------------
# Helper: check that a destination directory is safe to use
#   - Must not already exist (or be empty if it does)
#   - Must not be inside the workshop repo
# ---------------------------------------------------------------------------
validate_dest() {
  local dest="$1"
  # Reject paths inside the workshop
  if [[ "$dest" == "$WORKSHOP_DIR"* ]]; then
    error "Destination must be outside this workshop directory."
    return 1
  fi
  if [[ -e "$dest" ]]; then
    if [[ -d "$dest" ]] && [[ -z "$(ls -A "$dest" 2>/dev/null)" ]]; then
      # Empty directory is fine
      return 0
    fi
    error "Destination already exists and is not empty: $dest"
    return 1
  fi
  # Check the parent directory exists and is writable
  local parent
  parent="$(dirname "$dest")"
  if [[ ! -d "$parent" ]]; then
    error "Parent directory does not exist: $parent"
    return 1
  fi
  if [[ ! -w "$parent" ]]; then
    error "Parent directory is not writable: $parent"
    return 1
  fi
  return 0
}

# ===========================================================================
# MAIN
# ===========================================================================

clear
echo -e "${BOLD}${CYAN}"
echo "  ╔══════════════════════════════════════════════════════╗"
echo "  ║       🚀  AI Workshop — Project Bootstrapper         ║"
echo "  ║                                                      ║"
echo "  ║  Scaffold a new app from workshop skeleton templates ║"
echo "  ╚══════════════════════════════════════════════════════╝"
echo -e "${NC}"
echo "This script will guide you through creating a new project."
echo "Press Ctrl-C at any time to cancel."

# ---------------------------------------------------------------------------
# Step 1 — Choose backend
# ---------------------------------------------------------------------------
header "Step 1 of 4 — Choose a backend skeleton"
echo "(Choose 0 / None for a frontend-only project)"

CHOSEN_BACKEND=""
pick_from_list "Available backend skeletons:" CHOSEN_BACKEND "${BACKEND_SKELETONS[@]}"

if [[ -n "$CHOSEN_BACKEND" ]]; then
  success "Backend: $CHOSEN_BACKEND"
else
  info "No backend selected"
fi

# ---------------------------------------------------------------------------
# Step 2 — Choose frontend
# ---------------------------------------------------------------------------
header "Step 2 of 4 — Choose a frontend skeleton"
echo "(Choose 0 / None for a backend-only project)"

CHOSEN_FRONTEND=""
pick_from_list "Available frontend skeletons:" CHOSEN_FRONTEND "${FRONTEND_SKELETONS[@]}"

if [[ -n "$CHOSEN_FRONTEND" ]]; then
  success "Frontend: $CHOSEN_FRONTEND"
else
  info "No frontend selected"
fi

# Guard: must choose at least one
if [[ -z "$CHOSEN_BACKEND" && -z "$CHOSEN_FRONTEND" ]]; then
  die "You must choose at least one skeleton (backend and/or frontend)."
fi

# ---------------------------------------------------------------------------
# Step 3 — App name + destination
# ---------------------------------------------------------------------------
header "Step 3 of 4 — Name your project"

APP_NAME=""
while true; do
  printf "\nApp name (lowercase letters, digits, hyphens — e.g. my-app): "
  read -r APP_NAME
  if validate_app_name "$APP_NAME"; then
    break
  fi
  warn "Invalid name. Use only lowercase letters, digits, and hyphens (a-z0-9-)."
  warn "Must start and end with a letter or digit, up to 64 characters."
done
success "App name: $APP_NAME"

DEST_DIR=""
while true; do
  printf "\nDestination directory (absolute path — e.g. ~/projects/%s): " "$APP_NAME"
  read -r DEST_DIR
  # Expand ~ manually
  DEST_DIR="${DEST_DIR/#\~/$HOME}"
  if validate_dest "$DEST_DIR"; then
    break
  fi
done
success "Destination: $DEST_DIR"

# ---------------------------------------------------------------------------
# Step 4 — Prerequisite checks (warn only — Docker also works for everything)
# ---------------------------------------------------------------------------
header "Step 4 of 4 — Checking prerequisites"

# git is always needed
check_cmd "git" "git" "https://git-scm.com"

# Backend-specific checks
if [[ -n "$CHOSEN_BACKEND" ]]; then
  case "$CHOSEN_BACKEND" in
    express-skeleton)
      check_cmd "Node.js" "node" "https://nodejs.org"
      check_cmd "npm" "npm" "https://nodejs.org"
      ;;
    fastapi-skeleton|flask-skeleton)
      check_cmd "Python 3" "python3" "https://www.python.org"
      check_cmd "pip" "pip3" "https://pip.pypa.io"
      ;;
    go-skeleton)
      check_cmd "Go" "go" "https://go.dev"
      ;;
    spring-boot-skeleton|quarkus-skeleton|micronaut-skeleton)
      check_cmd "Java (JDK 21+)" "java" "https://adoptium.net"
      if command -v java &>/dev/null; then
        JAVA_VER=$(java -version 2>&1 | awk -F '"' '/version/ {print $2}' | cut -d'.' -f1)
        if [[ -n "$JAVA_VER" && "$JAVA_VER" -lt 21 ]]; then
          warn "Java 21+ is recommended; detected version $JAVA_VER"
        fi
      fi
      ;;
    rust-skeleton)
      check_cmd "Rust / cargo" "cargo" "https://rustup.rs"
      ;;
  esac
fi

# Frontend-specific checks
if [[ -n "$CHOSEN_FRONTEND" ]]; then
  check_cmd "Node.js" "node" "https://nodejs.org"
  check_cmd "npm" "npm" "https://nodejs.org"
fi

info "All checks complete — any warnings above are non-blocking."
info "All skeletons include a Dockerfile and docker-compose.yml if you prefer Docker."

# ---------------------------------------------------------------------------
# Confirm before proceeding
# ---------------------------------------------------------------------------
echo ""
echo -e "${BOLD}Summary of what will be created:${NC}"
echo "  App name  : $APP_NAME"
echo "  Dest      : $DEST_DIR"
[[ -n "$CHOSEN_BACKEND" ]]  && echo "  Backend   : $CHOSEN_BACKEND"
[[ -n "$CHOSEN_FRONTEND" ]] && echo "  Frontend  : $CHOSEN_FRONTEND"
if [[ -n "$CHOSEN_BACKEND" && -n "$CHOSEN_FRONTEND" ]]; then
  echo "  Layout    : $DEST_DIR/backend/  +  $DEST_DIR/frontend/"
else
  echo "  Layout    : $DEST_DIR/ (flat — skeleton at root)"
fi
echo "  VCS       : git init + initial commit"
echo ""
printf "Proceed? [y/N] "
read -r CONFIRM
if [[ ! "$CONFIRM" =~ ^[Yy]$ ]]; then
  echo "Cancelled."
  exit 0
fi

# ---------------------------------------------------------------------------
# Copy skeleton(s) into the destination
# ---------------------------------------------------------------------------
echo ""
info "Creating project directory..."

mkdir -p "$DEST_DIR"

if [[ -n "$CHOSEN_BACKEND" && -n "$CHOSEN_FRONTEND" ]]; then
  # Both selected → backend/ and frontend/ sub-directories
  info "Copying backend skeleton ($CHOSEN_BACKEND) → $DEST_DIR/backend/"
  cp -r "$SKELETONS_DIR/backend/$CHOSEN_BACKEND" "$DEST_DIR/backend"

  info "Copying frontend skeleton ($CHOSEN_FRONTEND) → $DEST_DIR/frontend/"
  cp -r "$SKELETONS_DIR/frontend/$CHOSEN_FRONTEND" "$DEST_DIR/frontend"

  info "Cleaning up build artefacts..."
  clean_copy "$DEST_DIR/backend"
  clean_copy "$DEST_DIR/frontend"

  info "Substituting app name..."
  substitute_names "$DEST_DIR/backend"  "$APP_NAME" "$CHOSEN_BACKEND"
  substitute_names "$DEST_DIR/frontend" "$APP_NAME" "$CHOSEN_FRONTEND"

  # Make Maven wrapper executable if present
  for mvnw in "$DEST_DIR/backend/mvnw" "$DEST_DIR/frontend/mvnw"; do
    [[ -f "$mvnw" ]] && chmod +x "$mvnw"
  done

elif [[ -n "$CHOSEN_BACKEND" ]]; then
  # Backend only → flat at root
  info "Copying backend skeleton ($CHOSEN_BACKEND) → $DEST_DIR/"
  cp -r "$SKELETONS_DIR/backend/$CHOSEN_BACKEND/." "$DEST_DIR/"

  info "Cleaning up build artefacts..."
  clean_copy "$DEST_DIR"

  info "Substituting app name..."
  substitute_names "$DEST_DIR" "$APP_NAME" "$CHOSEN_BACKEND"

  [[ -f "$DEST_DIR/mvnw" ]] && chmod +x "$DEST_DIR/mvnw"

else
  # Frontend only → flat at root
  info "Copying frontend skeleton ($CHOSEN_FRONTEND) → $DEST_DIR/"
  cp -r "$SKELETONS_DIR/frontend/$CHOSEN_FRONTEND/." "$DEST_DIR/"

  info "Cleaning up build artefacts..."
  clean_copy "$DEST_DIR"

  info "Substituting app name..."
  substitute_names "$DEST_DIR" "$APP_NAME" "$CHOSEN_FRONTEND"
fi

success "Files copied and configured."

# ---------------------------------------------------------------------------
# Git initialisation
# ---------------------------------------------------------------------------
info "Initialising git repository..."
git -C "$DEST_DIR" init -q
git -C "$DEST_DIR" add .
git -C "$DEST_DIR" commit -q -m "chore: bootstrap $APP_NAME from ai-workshop skeleton"

success "Git repository initialised with initial commit."

# ---------------------------------------------------------------------------
# Success summary
# ---------------------------------------------------------------------------
echo ""
echo -e "${BOLD}${GREEN}╔══════════════════════════════════════════════════════╗"
echo -e "║          ✅  Your project is ready!                  ║"
echo -e "╚══════════════════════════════════════════════════════╝${NC}"
echo ""
echo -e "${BOLD}  Location:${NC}  $DEST_DIR"
echo ""
echo -e "${BOLD}  Getting started:${NC}"
echo ""

print_skeleton_info() {
  local label="$1"
  local subdir="$2"
  local skeleton="$3"
  local port="${SKELETON_PORT[$skeleton]:-unknown}"

  echo -e "  ${BOLD}$label${NC} (${skeleton})"
  if [[ -n "$subdir" ]]; then
    echo "    cd $DEST_DIR/$subdir"
  else
    echo "    cd $DEST_DIR"
  fi
  echo "    make install   # install dependencies"
  echo "    make dev       # start dev server"
  if [[ "$port" != "unknown" ]]; then
    echo "    → listening on http://localhost:$port"
  fi
  echo ""
}

if [[ -n "$CHOSEN_BACKEND" && -n "$CHOSEN_FRONTEND" ]]; then
  print_skeleton_info "Backend"  "backend"  "$CHOSEN_BACKEND"
  print_skeleton_info "Frontend" "frontend" "$CHOSEN_FRONTEND"
elif [[ -n "$CHOSEN_BACKEND" ]]; then
  print_skeleton_info "Backend" "" "$CHOSEN_BACKEND"
else
  print_skeleton_info "Frontend" "" "$CHOSEN_FRONTEND"
fi

echo -e "  Run ${BOLD}make help${NC} inside any skeleton directory to see all available targets."
echo ""
echo -e "  ${CYAN}Happy coding! 🎉${NC}"
echo ""
