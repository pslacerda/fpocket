FROM debian:bookworm

RUN <<EOF
    apt-get update -y
    apt-get install -y gcc g++ make
    rm -rf /var/lib/apt/lists/*
EOF
WORKDIR /workdir
COPY . .

RUN make && make install && rm -rf /workdir

CMD ["fpocket"]
