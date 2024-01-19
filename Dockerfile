FROM python:3.10

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /code

COPY requirements.txt /code/

RUN pip install --no-cache-dir -r requirements.txt

COPY . /code/


# FROM python:3.8

# RUN python3 -m pip install --upgrade pip

# COPY requirements.txt requirements.txt
# RUN python3 -m pip install --no-cache-dir -r requirements.txt

# COPY . .
