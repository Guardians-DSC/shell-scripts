FROM ubuntu:16.04
WORKDIR /scripts

RUN apt-get update && apt-get install -y \
    vim \
    wget \
 && rm -rf /var/lib/apt/lists/*

# Definindo localtime e timezone do sistema
RUN ln -sf /usr/share/zoneinfo/America/Recife /etc/localtime \
	&& echo "America/Recife" > /etc/timezone \
	&& export TZ=America/Recife

CMD ["/bin/sh"]
