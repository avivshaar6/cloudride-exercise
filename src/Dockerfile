FROM python:3.13.1

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY app.py .

ENTRYPOINT ["python", "app.py"]

EXPOSE 8000