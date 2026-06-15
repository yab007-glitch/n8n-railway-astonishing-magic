FROM n8nio/n8n:1.123.56

USER root

# Fix LinkedIn API version that LinkedIn has deactivated (20250401 is not active)
RUN sed -i "s/'LinkedIn-Version': '202504'/'LinkedIn-Version': '202411'/g" \
    /usr/local/lib/node_modules/n8n/node_modules/n8n-nodes-base/dist/nodes/LinkedIn/GenericFunctions.js

# Install LINKUP API community node as alternative LinkedIn option
RUN mkdir -p /home/node/.n8n/nodes && \
    cd /home/node/.n8n/nodes && \
    npm install --omit=dev --no-audit --no-fund n8n-nodes-linkupapi@4.0.65 && \
    chown -R node:node /home/node/.n8n

ENV N8N_COMMUNITY_PACKAGES_ENABLED=true

USER node

CMD ["n8n", "start"]
