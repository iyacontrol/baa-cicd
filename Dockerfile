FROM golang:latest AS build-env
ADD ./  /go/src/github.com/test/baa-cicd
WORKDIR /go/src/github.com/test/baa-cicd
RUN CGO_ENABLED=0  go build -i -o baa-cicd

FROM alpine
RUN apk add -U tzdata
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai  /etc/localtime
COPY --from=build-env /go/src/github.com/test/baa-cicd/baa-cicd /usr/local/bin/baa-cicd
RUN chmod +x /usr/local/bin/baa-cicd
EXPOSE 13123
ENTRYPOINT ["baa-cicd"]
