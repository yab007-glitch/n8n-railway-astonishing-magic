FROM n8nio/n8n:1.123.56

USER root

# Patch LinkedIn API version to currently active version
RUN sed -i "s/'LinkedIn-Version': '202504'/'LinkedIn-Version': '202506'/g" \
    /usr/local/lib/node_modules/n8n/node_modules/n8n-nodes-base/dist/nodes/LinkedIn/GenericFunctions.js

USER node

CMD ["n8n", "start"]
