# Use the official Python 3.9 image as the base image
FROM python:3.9

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file to the container
COPY requirements.txt .

# Install the Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code to the container
COPY . .

# Set the entrypoint command to run the application using Gunicorn
CMD ["gunicorn", "-b", ":$PORT", "main:app"]