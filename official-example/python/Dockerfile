FROM ubuntu:20.04

RUN apt update && apt install -yq \
    curl \
    python3 \
    python3-pip \
    net-tools \
    iputils-ping \
&& rm -rf /var/lib/apt/lists/*

# install dapr cli
RUN curl -s https://raw.githubusercontent.com/dapr/cli/master/install/install.sh | bash
RUN dapr init --slim

# install daprd
ENV PATH="/root/.dapr/bin/:${PATH}"

# install app
WORKDIR /app
RUN pip3 install requests
COPY . .

#EXPOSE 50004
ENTRYPOINT ["/app/startup.sh"]