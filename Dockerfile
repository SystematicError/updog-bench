FROM python:alpine

RUN apk update && apk add --no-cache \
    git \
    make \
    g++ \
    cargo

WORKDIR /app

COPY ./Client /app

RUN pip install --break-system-packages --no-cache-dir -r requirements.txt

CMD python client.py -T "$OPENBENCH_THREADS" -I "$OPENBENCH_MACHINE_NAME" -N 1
