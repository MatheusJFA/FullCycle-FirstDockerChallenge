FROM golang AS builder

WORKDIR /src

COPY . .

RUN go build -ldflags '-s -w' main.go

FROM scratch

COPY --from=builder /src /

CMD ["./main"]