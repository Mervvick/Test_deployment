
FROM python:3.9-slim

WORKDIR /app

RUN apt-get update && apt-get install -y     build-essential     curl     software-properties-common     git     && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip3 install -r requirements.txt

ARG PORT
ENV PORT=$PORT

EXPOSE $PORT

COPY . .
ENTRYPOINT ["streamlit", "run", "app.py", "--server.port=$PORT", "--server.address=0.0.0.0"]
