# instructions to the docker

# select a image 
FROM python:3.7-slim
# copy my archives to the app dock file
COPY . /app

WORKDIR /app

# install packs
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        cmake \
        build-essential \
        gcc \
        g++ 
# install the list of libraries in the file requirements.txt
RUN pip install -r requirements.txt
RUN python db_starter.py

# Run the app.  CMD is required to run on Heroku
# $PORT is set by Heroku			
CMD gunicorn --bind 0.0.0.0:$PORT wsgi 
#CMD gunicorn --bind 0.0.0.0:80 wsgi # alternativa para rodar localmente
