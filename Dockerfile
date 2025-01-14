# Use Python base image
FROM python:3.10-slim

# Set the working directory
WORKDIR /app

# Copy the necessary files into the container
COPY sharp.py /app/sharp.py
COPY sharp /app/sharp
COPY keep_alive.py /app/keep_alive.py
COPY requirements.txt /app/requirements.txt

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Ensure the sharp binary is executable
RUN chmod +x /app/sharp

# Expose the ports (Flask uses port 8080)
EXPOSE 8080

# Command to run both sharp.py and keep_alive.py
CMD ["sh", "-c", "python /app/keep_alive.py & python /app/sharp.py"]
