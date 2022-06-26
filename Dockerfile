FROM python:slim

WORKDIR /root

COPY . .

# RUN set -ex && \
#     apt-get update -y && \
#     apt-get upgrade -y && \
#     apt-get install -y python-virtualenv python-pip --no-install-recommends && \
#     apt-get clean && \
#     rm -rf /var/lib/apt/lists/*

# RUN virtualenv wormhole-venv

# RUN wormhole-venv/bin/pip install magic-wormhole-mailbox-server magic-wormhole-transit-relay

RUN pip install magic-wormhole-mailbox-server magic-wormhole-transit-relay

EXPOSE 4000
EXPOSE 4001

VOLUME [/root/]

# CMD [ "twist", "wormhole-mailbox","--usage-db=usage.sqlite" ]
# CMD [ "twist", "transitrelay", "--port=tcp:4001"]

CMD ["/bin/bash", "/root/start_wormhole.sh"]
