FROM alpine:3.20 AS ffmpeg-fetch
RUN apk add --no-cache curl xz
RUN curl -L https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz -o /tmp/ffmpeg.tar.xz && \
    mkdir /tmp/ffmpeg-extract && \
    tar -xf /tmp/ffmpeg.tar.xz -C /tmp/ffmpeg-extract --strip-components=1

FROM n8nio/n8n:2.10.4
USER root
COPY --from=ffmpeg-fetch /tmp/ffmpeg-extract/ffmpeg /usr/local/bin/ffmpeg
COPY --from=ffmpeg-fetch /tmp/ffmpeg-extract/ffprobe /usr/local/bin/ffprobe
USER node
