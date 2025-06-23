FROM node:latest

# Create a new user
RUN useradd -m appuser

# Create the directory and file directly in the image
RUN mkdir -p /app && echo "This is Joe's user file" > /app/newuser.txt

# Set working directory
WORKDIR /app

# Switch to the appuser (optional if you want non-root)
USER appuser

# Dummy command (optional, example)
CMD ["node"]

