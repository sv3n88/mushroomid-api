# Use Python 3.12 slim base image
FROM python:3.12-slim

# Set working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
# Install FastAPI with all extras for CLI support
RUN pip install --no-cache-dir "fastapi[all]"

# Download the model during build
RUN python -c "from transformers import pipeline; pipeline('image-classification', model='dima806/mushrooms_image_detection', model_kwargs={'local_files_only': False}).save_pretrained('./model')"

# Copy application code
COPY app/ ./app/

# Command to run the app with FastAPI CLI
CMD ["fastapi", "run", "app/main.py", "--host", "0.0.0.0", "--port", "8000"]