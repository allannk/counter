# Use a suitable base image. Python:slim is a good choice for size
FROM python:3.9-slim

# Install Git
RUN apt-get update && apt-get install -y git

# Set the working directory inside the container
WORKDIR /app

# Clone the Git repository
RUN git clone https://github.com/allannk/counter.git .

# Install any dependencies (if you have a requirements.txt)
COPY requirements.txt .  # Copy requirements file *before* installing
RUN pip install --no-cache-dir -r requirements.txt

# Create a directory for persistent static files
RUN mkdir /data

# Copy a static file (example)
COPY static/current_count /data/current_count

# Expose the port your web server listens on. 80 is common, but can be anything.
EXPOSE 4114

# Specify the command to run when the container starts. Replace with your app's entry point.
CMD ["python", "counter.py"]