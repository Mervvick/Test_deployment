
FROM python:3.8

WORKDIR /app

EXPOSE 8501

COPY requirements.txt .
RUN pip install -r requirements.txt && rm requirements.txt

COPY . .
ENTRYPOINT ["streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]
