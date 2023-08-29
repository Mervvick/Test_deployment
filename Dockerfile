
FROM python:3.8

RUN useradd -ms /bin/bash user
USER user
WORKDIR /home/user

COPY requirements.txt .
RUN pip install -r requirements.txt && rm requirements.txt

COPY . .
ENTRYPOINT [ "streamlit", "run", "./app.py"]
