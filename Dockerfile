FROM golang:bullseye as builder

ENV PATH=$PATH:/usr/local/go/bin
WORKDIR /usr/local/go/

# Compila arquivo hello.go
COPY hello.go .
RUN go build hello.go

# Inicia imagem usando multistage
FROM scratch
COPY --from=builder /usr/local/go/hello /usr/local/go/hello
WORKDIR /usr/local/go
CMD ["./hello"]
