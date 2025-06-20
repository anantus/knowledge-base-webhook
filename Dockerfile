# Use the official Python image.
FROM python:3.12-slim

# Set environment variables
ENV PYTHONUNBUFFERED=1 \
    PORT=8080

# Install system dependencies (if needed)
RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# Set work directory
WORKDIR /app

# Copy requirements
COPY requirements.txt ./

# Install Python dependencies
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copy the rest of the code
COPY . .

# Expose the port
EXPOSE 8080

# Run the Functions Framework for Python
CMD ["functions-framework", "--target=on_cloud_event", "--port=8080"]