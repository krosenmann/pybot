FROM python:3.6
LABEL maintainer="Aleksei Kioller <avkioller@gmail.com>"
ENV PYTHONUNBUFFERED 0
RUN apt-get update -y &&\
    apt-get install -y tzdata \
 && cp /usr/share/zoneinfo/Europe/Moscow /etc/localtime
COPY ./requirements /pybot/requirements
WORKDIR /pybot
RUN pip install -r requirements
COPY ./bot /pybot
ENTRYPOINT [ "python", "main.py" ]
