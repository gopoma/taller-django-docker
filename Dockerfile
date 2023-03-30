FROM python:3.10-alpine
 
ENV PYTHONUNBUFFERED 1
 
WORKDIR /app

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY ./src .

RUN python manage.py collectstatic --no-input

EXPOSE 8000

CMD ["gunicorn", "config.wsgi", "--bind", "0.0.0.0:8000", "--preload"]
