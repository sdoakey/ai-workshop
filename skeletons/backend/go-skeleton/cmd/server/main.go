/*
Go REST API Application Entry Point

This is a minimal Go REST API application with no endpoints defined.
Use this as a starting point to add your own endpoints and functionality.
*/
package main

import (
	"fmt"
	"log"
	"net/http"
	"os"

	"go-skeleton/internal/router"
)

func main() {
	port := os.Getenv("PORT")
	if port == "" {
		port = "8080"
	}

	r := router.New()

	fmt.Printf("🚀 Go REST API server starting on port %s...\n", port)
	log.Fatal(http.ListenAndServe(":"+port, r))
}
