FROM golang:alpine3.17 AS builder

WORKDIR /usr/src

COPY . .

RUN go build -buildvcs=false -o app

FROM scratch

COPY --from=builder /usr/src/app .

ENTRYPOINT ["./app"]