/**
 * Express.js Application Entry Point
 *
 * This is a minimal Express.js application with no endpoints defined.
 * Use this as a starting point to add your own endpoints and functionality.
 */

import express from "express";
import { router } from "./routes";

const app = express();
const port = process.env.PORT || 3000;

// Middleware
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Routes
app.use(router);

// Start server
app.listen(port, () => {
  console.log(`🚀 Express server starting on port ${port}...`);
  console.log(`   Health check: http://localhost:${port}/health`);
});

export default app;
