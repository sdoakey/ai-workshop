package handlers

import (
	"encoding/json"
	"net/http"
)

// HealthResponse represents the health check response body.
type HealthResponse struct {
	Status  string `json:"status"`
	Message string `json:"message"`
}

// HealthCheck returns the current health status of the application.
func HealthCheck(w http.ResponseWriter, r *http.Request) {
	resp := HealthResponse{
		Status:  "healthy",
		Message: "Go REST API application is running",
	}

	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(http.StatusOK)
	json.NewEncoder(w).Encode(resp)
}
