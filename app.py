

import streamlit as st
from PIL import Image
from segment import process

st.title('Распознование цифр')

image_file = st.file_uploader('Load an image', type = ['png', 'jpg'])

if not image_file is None:
  image = Image.open(image_file)
  result = process(image_file)
  st.image(image)
  st.write('Предсказание:', result)

