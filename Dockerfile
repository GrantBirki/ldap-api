FROM ruby:3.3-slim

WORKDIR /app

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get install -y make gcc curl build-essential g++ libgmp-dev curl git

# create nonroot user
RUN useradd -m nonroot

COPY --chown=nonroot:nonroot . .
RUN script/bootstrap

# switch to the nonroot user
USER nonroot

CMD ["script/server"]
