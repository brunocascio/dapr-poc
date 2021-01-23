FROM ubuntu:20.04

ARG DAPR_VERSION

RUN apt update && apt install -yq \
    curl \
    python3 \
    python3-pip \
    net-tools \
&& rm -rf /var/lib/apt/lists/*

# install dapr cli
RUN curl -s https://raw.githubusercontent.com/dapr/cli/master/install/install.sh | bash -s ${DAPR_VERSION} \
    && dapr init --slim --runtime-version ${DAPR_VERSION} \
    && touch ~/.dapr/config.yaml

# install daprd
ENV PATH="/root/.dapr/bin/:${PATH}"

# install app
WORKDIR /app
RUN pip3 install requests
COPY . .

ENTRYPOINT ["/app/startup.sh"]