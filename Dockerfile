FROM debian:bookworm-slim

RUN <<EOF
    groupadd -r fpocket
    useradd -r -g fpocket fpocket
EOF
RUN <<EOF
    apt update -y
    apt install -y gcc g++ make libnetcdf-dev
    rm -rf /var/lib/apt/lists/*
EOF

WORKDIR /opt/fpocket
COPY . .
RUN make -f Makefile fpocket

USER fpocket
ENTRYPOINT [ "bin/fpocket" ]