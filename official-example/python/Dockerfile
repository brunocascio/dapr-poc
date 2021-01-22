FROM ubuntu:20.04

RUN apt update && apt install -yq \
    curl \
    python3 \
    python3-pip \
    net-tools \
&& rm -rf /var/lib/apt/lists/*

# install dapr cli
RUN curl -s https://raw.githubusercontent.com/dapr/cli/master/install/install.sh | bash -s 1.0.0-rc.2 \
    && dapr init --slim --runtime-version 1.0.0-rc.2 \
    && touch ~/.dapr/config.yaml

# install daprd
ENV PATH="/root/.dapr/bin/:${PATH}"

# install app
WORKDIR /app
RUN pip3 install requests
COPY . .

ENTRYPOINT ["/app/startup.sh"]