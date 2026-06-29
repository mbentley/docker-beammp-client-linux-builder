FROM mbentley/debian:trixie
LABEL maintainer="Matt Bentley <mbentley@mbentley.net>"

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update &&\
  apt-get install -y build-essential cmake curl git pkg-config tar unzip zip &&\
  rm -rf /var/lib/apt/lists/*

COPY build.sh /

CMD ["/build.sh"]
