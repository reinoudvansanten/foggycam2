FROM python:3.8-slim

# Install
RUN apt update \
 && apt upgrade -y \
 && apt install -y ffmpeg gsfonts imagemagick \
 && apt install -y  build-essential libssl-dev libffi-dev python-dev-is-python3 python3-dev \
 && rm -rf /var/lib/apt/lists/*

# Setup working directory
RUN mkdir -p /usr/local/app/foggycam2/capture
COPY src/ /usr/local/app/foggycam2
WORKDIR /usr/local/app/foggycam2

RUN pip install --no-cache-dir --upgrade pip \
 && pip install --no-cache-dir -r requirements.txt

# Prepaire volumes
VOLUME ["/usr/local/app/foggycam2/capture"]
VOLUME ["/usr/local/app/config.json"]

# Start
CMD ["/usr/local/app/foggycam2/foggycam2.py"]