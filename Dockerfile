FROM python:3.8-buster
WORKDIR /app
RUN pip install Flask
COPY . /app
EXPOSE 5000
CMD ["python", "app.py"]
