FROM alpine:latest as builder
RUN apk update && apk add --no-cache gcc make musl-dev

COPY . .
RUN make && make install

FROM alpine:latest as runner

COPY --from=builder /usr/local/bin/jdupes /usr/local/bin/jdupes
# COPY --from=builder /usr/local/share/man/man1/jdupes.1 /usr/local/share/man/man1/jdupes.1 

ENTRYPOINT [ "/usr/local/bin/jdupes" ]
