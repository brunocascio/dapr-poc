FROM ubuntu:20.04

RUN apt update && apt install curl net-tools -yq \
    && curl -sL https://deb.nodesource.com/setup_14.x | bash \
    && apt install -yq nodejs \
    && rm -rf /var/lib/apt/lists/*

# install dapr cli
RUN curl -s https://raw.githubusercontent.com/dapr/cli/master/install/install.sh | bash -s 1.0.0-rc.2 \
    && dapr init --slim --runtime-version 1.0.0-rc.2 \
    && touch ~/.dapr/config.yaml

# install app
WORKDIR /app
COPY src/package*.json ./src/
RUN cd src && npm install
COPY . .
EXPOSE 3000 3500 50002
ENTRYPOINT ["/app/startup.sh"]
