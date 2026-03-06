# Use official Python runtime as base image
FROM python:3.13-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
	PYTHONUNBUFFERED=1

# Set working directory in container
WORKDIR /app

# Copy requirements file
COPY requirements.txt .

# Install Python dependencies
RUN python -m pip install --upgrade pip \
	&& pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

# Expose port 5000 for the application
EXPOSE 5000

# Command to run the application
CMD ["gunicorn", "app.main:create_app()", "--bind", "0.0.0.0:5000"]
