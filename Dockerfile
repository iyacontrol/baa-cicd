FROM alpine
RUN apk add -U tzdata
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai  /etc/localtime
COPY baa-cicd  /usr/local/bin/baa-cicd

EXPOSE 13123

ENTRYPOINT  ["/usr/local/bin/baa-cicd"]