# Todo List Application

## Run Locally (with live reload)

```bash
cd examples/todo-app-python

# Create and source virtual environment
python3 -m venv .venv
source .venv/bin/activate

# Install dependencies
pip install -r requirements.txt

# Start the database only
docker-compose up  -d

# Run the app
python app.py
```

Open http://localhost:5000. Changes to the code will auto-reload.

## Stop

```bash
docker-compose down
```
