import { Request, Response } from "express";

interface HealthResponse {
  status: string;
  message: string;
}

/**
 * Returns the current health status of the application.
 */
export function healthCheck(_req: Request, res: Response): void {
  const response: HealthResponse = {
    status: "healthy",
    message: "Express.js REST API application is running",
  };

  res.status(200).json(response);
}
