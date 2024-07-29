# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the rest of the application code
COPY . /app/

# Set the path to the pre-installed dependencies
ENV PIP_TARGET=/app/deps
ENV PYTHONPATH=$PIP_TARGET

# Make port 8501 available to the world outside this container
EXPOSE 8501

# Define environment variable
ENV NAME World

# Run Streamlit when the container launches
CMD ["python", "-m", "streamlit", "run", "app.py"]
