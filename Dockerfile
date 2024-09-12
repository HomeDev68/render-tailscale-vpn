FROM debian:bullseye-slim

# Setup tailscale
WORKDIR /tailscale.d
COPY start.sh /tailscale.d/start.sh

ENV TAILSCALE_VERSION "latest"
ENV TAILSCALE_HOSTNAME "render-app"
ENV TAILSCALE_ADDITIONAL_ARGS ""

RUN apt-get update && apt-get install -y \
    ca-certificates \
    curl \
    wget \
    iptables \
    sudo \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/tailscale /var/cache/tailscale /var/lib/tailscale

RUN chmod +x ./start.sh

CMD ["./start.sh"]
