from fastapi import FastAPI, UploadFile, File
from .inference import predict_mushroom
from PIL import Image
import io

app = FastAPI()

@app.post("/identify")
async def identify_mushroom(image: UploadFile = File(...)):
    # Read image
    img = Image.open(io.BytesIO(await image.read())).convert("RGB")
    # Predict
    species, confidence = predict_mushroom(img)
    return {"species": species, "confidence": float(confidence)}