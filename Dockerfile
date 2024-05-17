# Use the official Python 3.9 image from the Docker Hub
FROM python:3.9-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Install MySQL client and other necessary dependencies
RUN apt-get update \
    && apt-get install -y default-libmysqlclient-dev gcc \
    && apt-get install -y default-mysql-client pkg-config \
    && rm -rf /var/lib/apt/lists/*

# Create and set the working directory
WORKDIR /app

# Copy the requirements file if it exists
COPY requirements.txt /app/

# Install Python dependencies if requirements.txt is present
RUN pip install --upgrade pip \
    && if [ -f requirements.txt ]; then pip install -r requirements.txt; fi

# Copy the application code
COPY . /app

# Set the entrypoint or command to run the application
# For example, if your main application file is `app.py`, you can use:
# CMD ["python", "app.py"]

# Example of setting an entrypoint (uncomment the line below if needed)
 ENTRYPOINT ["python", "main.py"]

# If you use a specific command to run your application, use CMD
# CMD ["your-command"]

# Example command to keep the container running (useful for development)
CMD ["tail", "-f", "/dev/null"]

