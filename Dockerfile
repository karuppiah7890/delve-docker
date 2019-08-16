FROM golang:alpine as build
RUN apk add --no-cache ca-certificates socat git make
WORKDIR /delve
RUN git clone https://github.com/go-delve/delve.git .
RUN make install

FROM golang:alpine
COPY --from=build /go/bin/dlv /go/bin/dlv
CMD [ "dlv" ]