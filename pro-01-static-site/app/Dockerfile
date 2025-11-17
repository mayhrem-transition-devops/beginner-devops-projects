FROM python:3.10-slim-buster 
ENV APP_VERSION=1.0.0

WORKDIR /app    

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 5000

CMD [ "python", "app.py" ]