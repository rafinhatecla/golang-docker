FROM golang:1.19.4-alpine3.17 as builder

WORKDIR /apps

COPY main.go .

RUN go build -v -o ./app main.go


FROM scratch

WORKDIR /usr/local/bin/

COPY --from=builder /apps/app .

ENTRYPOINT [ "app" ]
