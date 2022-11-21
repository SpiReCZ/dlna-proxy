FROM scratch AS builder

COPY src /

FROM python:3.9

EXPOSE 8000
WORKDIR /app

ENV PYTHONUNBUFFERED=1 \
    TERM=xterm \
    REMOTE_URL=http://127.0.0.1:50001/desc/device.xml

COPY --from=builder / ./

CMD python3 ./troll.py ${REMOTE_URL}
