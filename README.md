# MushroomID API

A FastAPI-based API to identify mushroom species from images using a pre-trained model from Hugging Face (`dima806/mushrooms_image_detection`). The model is bundled into the Docker image for instant use.

## Features

- Upload an image of a mushroom and get the predicted species with a confidence score.
- Built with Python 3.12, FastAPI, and Transformers.
- Runs via Docker Compose with the model pre-downloaded.

## Prerequisites

- Docker and Docker Compose installed.

## Usage

Build and run:
```bash
docker-compose up -d
curl -X POST -F "image=@D:/Images/mushroom.jpg" http://localhost:8000/identify
```