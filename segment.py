

from tensorflow.keras.models import load_model
from tensorflow.keras.optimizers import Adam
import numpy as np
from PIL import Image

MODEL_NAME = 'model_fmr_all.h5'
model = load_model(MODEL_NAME, compile = False)
INPUT_SHAPE = (28, 28, 1)

def process(image_file):
  image = Image.open(image_file).convert('L')
  resized_image = image.resize((28, 28))
  array = np.array(resized_image)
  array = array.reshape(-1, 28, 28, 1)
  prediction = model.predict(array)
  cls = np.argmax(prediction)
  return cls

