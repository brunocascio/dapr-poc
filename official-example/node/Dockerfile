FROM ubuntu:20.04

RUN apt update && apt install curl -yq \
    && curl -sL https://deb.nodesource.com/setup_14.x | bash \
    && apt install -y nodejs net-tools iputils-ping -yq \
    && rm -rf /var/lib/apt/lists/*

# install dapr cli
RUN curl -s https://raw.githubusercontent.com/dapr/cli/master/install/install.sh | bash \
    && dapr init --slim

# install daprd
ENV PATH="/root/.dapr/bin/:${PATH}"

# install app
WORKDIR /app
COPY package*.json .
RUN npm install
COPY . .
EXPOSE 3000 3500 50002
ENTRYPOINT ["/app/startup.sh"]
