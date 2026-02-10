/*
Router configuration for the Go REST API.

Define your routes and middleware here.
*/
package router

import (
	"net/http"

	"github.com/go-chi/chi/v5"
	"github.com/go-chi/chi/v5/middleware"

	"go-skeleton/internal/handlers"
)

// New creates and configures a new chi router with default middleware.
func New() http.Handler {
	r := chi.NewRouter()

	// Default middleware stack
	r.Use(middleware.Logger)
	r.Use(middleware.Recoverer)
	r.Use(middleware.RequestID)
	r.Use(middleware.RealIP)

	// Health check endpoint
	r.Get("/health", handlers.HealthCheck)

	// TODO: Add your routes here
	// Example:
	// r.Route("/api/v1", func(r chi.Router) {
	//     r.Get("/items", handlers.ListItems)
	//     r.Post("/items", handlers.CreateItem)
	// })

	return r
}
