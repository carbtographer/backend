# build stage
FROM golang:1.12-alpine

ENV GO111MODULE=on

WORKDIR /app
COPY . .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -mod vendor -a -installsuffix cgo -ldflags '-extldflags "-static"' -o carbtographer
ENV PATH "$PATH:/app"

# EXPOSE 9001
# ENTRYPOINT ["/app/carbtographer"]