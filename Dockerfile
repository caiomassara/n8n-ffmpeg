FROM n8nio/n8n:2.10.4
USER root
RUN apk add --no-cache ffmpeg
USER node
