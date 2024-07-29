# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the rest of the application code
COPY . /app/

# Copy the Streamlit config file
COPY streamlit.config.toml /root/.streamlit/config.toml

# Install dependencies in /app/deps
RUN pip install --no-cache-dir --target=/app/deps -r requirements.txt

# Set environment variables for the dependencies
ENV PYTHONPATH=/app/deps

# Make port 8501 available to the world outside this container
EXPOSE 8501

# Define environment variable
ENV NAME World

# Run Streamlit when the container launches
CMD ["streamlit", "run", "app.py", "--server.port=8501"]
