# syntax=docker/dockerfile:1

FROM golang:1.22 AS builder

WORKDIR /app
COPY . .
RUN go mod tidy
RUN CGO_ENABLED=0 GOOS=linux go build -o rest-api ./cmd/rest-api

FROM alpine:3.19
WORKDIR /root/
COPY --from=builder /app/rest-api .
CMD ["./rest-api"]
