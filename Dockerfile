FROM golang:1.17-alpine AS build
RUN go install tailscale.com/cmd/derper@main

FROM alpine:3.14
COPY --from=build /go/bin/derper /usr/local/bin/derper

EXPOSE 80

CMD ["/usr/local/bin/derper", "-a", ":80"]
