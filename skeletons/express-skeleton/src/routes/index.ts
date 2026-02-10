/**
 * Router configuration for the Express.js REST API.
 *
 * Define your routes and middleware here.
 */

import { Router } from "express";
import { healthCheck } from "../handlers/health";

const router = Router();

// Health check endpoint
router.get("/health", healthCheck);

// TODO: Add your routes here

export { router };
