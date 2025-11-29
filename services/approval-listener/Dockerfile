# syntax=docker/dockerfile:1

FROM cgr.dev/chainguard/go:latest AS builder
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download || true
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -o approval-listener ./cmd/approval-listener

FROM cgr.dev/chainguard/static:latest
WORKDIR /app
COPY --from=builder /app/approval-listener .
ENTRYPOINT ["./approval-listener"]
