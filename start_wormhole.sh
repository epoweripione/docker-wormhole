#!/usr/bin/env bash

# twist --log-file=mailbox.log wormhole-mailbox --usage-db=usage.sqlite
# twist --log-file=transitrelay.log transitrelay --port=tcp:4001

# Daemonization
twistd --pidfile=mailbox.pid --logfile=mailbox.log wormhole-mailbox --usage-db=usage.sqlite
twistd --pidfile=transitrelay.pid --logfile=transitrelay.log transitrelay --port=tcp:4001

tail -F mailbox.log transitrelay.log

# kill "$(cat mailbox.pid)"
# kill "$(cat transitrelay.pid)"
