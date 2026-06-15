FROM n8nio/n8n:1.123.56

USER root

# Install LINKUP API community node where n8n expects community packages
RUN mkdir -p /home/node/.n8n/nodes && \\
    cd /home/node/.n8n/nodes && \\
    npm install --omit=dev --no-audit --no-fund n8n-nodes-linkupapi@4.0.65 && \\
    chown -R node:node /home/node/.n8n

USER node

ENV N8N_COMMUNITY_PACKAGES_ENABLED=true

CMD ["n8n", "start"]
