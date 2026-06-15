FROM n8nio/n8n:1.123.56

USER root

RUN mkdir -p /home/node/.n8n/nodes && chown -R node:node /home/node/.n8n

USER node

RUN cd /home/node/.n8n/nodes && npm install --omit=dev --no-audit --no-fund n8n-nodes-linkupapi@4.0.65

ENV N8N_COMMUNITY_PACKAGES_ENABLED=true

CMD ["n8n", "start"]
