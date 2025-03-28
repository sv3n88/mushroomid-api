from transformers import pipeline

# Load the pipeline from local model directory
pipe = pipeline("image-classification", model="./model")

def predict_mushroom(img):
    # Run prediction
    results = pipe(img)
    # Return top prediction
    top_result = results[0]  # Highest confidence
    return top_result["label"], top_result["score"]