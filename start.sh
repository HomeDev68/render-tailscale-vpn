#!/bin/bash

# Install Tailscale
curl -fsSL https://tailscale.com/install.sh | sh

# Start Tailscaled
sudo tailscaled --state=/var/lib/tailscale/tailscaled.state --socket=/var/run/tailscale/tailscaled.sock --tun=userspace-networking --socks5-server=localhost:1055 --outbound-http-proxy-listen=localhost:1055 &

# Start Tailscale
sudo tailscale up --ssh --auth-key=${TAILSCALE_AUTHKEY} --hostname=${TAILSCALE_HOSTNAME} --advertise-exit-node ${TAILSCALE_ADDITIONAL_ARGS} || sudo tailscale up --ssh --auth-key=${TAILSCALE_AUTHKEY} --hostname=render-vpn
--advertise-exit-node  ${TAILSCALE_ADDITIONAL_ARGS}

# Enable SSH
# sudo tailscale up --ssh

# Keep the container running
exec sleep infinity
