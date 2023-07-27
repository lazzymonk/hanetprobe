FROM python:3-alpine

WORKDIR /app

COPY src .
COPY LICENSE .
COPY requirements.txt requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt
RUN apt-get update
RUN apt-get install -y iputils-ping
RUN echo "0 2147483647" > /proc/sys/net/ipv4/ping_group_range

CMD [ "python", "probe_app.py", "config/probe.yaml" ]
