FROM ubuntu:18.04
LABEL maintainer="Trey Turner <mail@treyturner.info>"

RUN apt-get update \
  && apt-get install -y libpcap0.8-dev libuv1-dev curl \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN mkdir /app
COPY ./app /app
WORKDIR /app
RUN curl -L -o lan-play-linux https://github.com/spacemeowx2/switch-lan-play/releases/download/v0.2.3/lan-play-linux
RUN chmod +x lan-play-linux
RUN chmod +x start.sh

CMD ["./start.sh"]
