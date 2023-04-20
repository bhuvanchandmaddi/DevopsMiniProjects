# Backend application image
FROM python:3.8-slim-buster

WORKDIR /app

COPY ./utility_files/requirements.txt .

RUN pip install -r requirements.txt

COPY ./utility_files/app.py .

CMD [ "python", "app.py" ]
