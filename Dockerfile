FROM golang:1.12-alpine as build-env

ENV GO111MODULE=on 
RUN mkdir /app
WORKDIR /app

COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -mod=vendor -a -installsuffix cgo -ldflags '-extldflags "-static"' -o carbtographer

FROM scratch
COPY --from=build-env /app/carbtographer /app/

ENV PATH "$PATH:/app"
CMD ["carbtographer", "-run"]