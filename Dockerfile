
FROM python:3.9-slim

ARG PORT
ENV PORT=$PORT

WORKDIR /app

COPY requirements.txt .
RUN pip3 install -r requirements.txt

EXPOSE $PORT

COPY . .
ENTRYPOINT streamlit run app.py --server.port=$PORT --server.address=0.0.0.0
