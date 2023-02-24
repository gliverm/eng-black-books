# --------------------
# Initialling intended for dev purposes
# No 3rd party dependencies required
# docker build --file Dockerfile --tag eng-black-books:latest .
# --------------------
FROM python:3.11.2
ARG PROJECT_DIR=/development
ENV PYTHONDONOTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
RUN echo "===> Installing pipenv..." \
    && pip install pipenv
RUN echo "===> Creating project directory..." \
    && mkdir -p $PROJECT_DIR
WORKDIR $PROJECT_DIR