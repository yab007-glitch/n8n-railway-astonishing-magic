FROM n8nio/n8n:1.123.56

USER root

# Install community node for LINKUP API
RUN mkdir -p /home/node/.n8n/nodes && \\
    cd /home/node/.n8n/nodes && \\
    npm install n8n-nodes-linkupapi@4.0.65 && \\
    chown -R node:node /home/node/.n8n

USER node

# Default n8n start command
CMD ["n8n", "start"]
