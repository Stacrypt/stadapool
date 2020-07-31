#!/usr/bin/env bash

set -e

docker run --rm cardano-my-stake cardano-cli shelley address key-gen \
  --verification-key-file /etc/cardano/secrets/payment.vkey \
  --signing-key-file /etc/cardano/secrets/payment.skey

docker run --rm cardano-my-stake cardano-cli shelley stake-address key-gen \
  --verification-key-file /etc/cardano/secrets/stake.vkey \
  --signing-key-file /etc/cardano/secrets/stake.skey

docker run --rm cardano-my-stake cardano-cli shelley stake-address build \
  --stake-verification-key-file /etc/cardano/secrets/stake.vkey \
  --out-file /etc/cardano/secrets/stake.addr \
  --mainnet

docker run --rm cardano-my-stake cardano-cli shelley stake-address registration-certificate \
  --stake-verification-key-file /etc/cardano/secrets/stake.vkey \
  --out-file /etc/cardano/secrets/stake.cert

docker image rm cardano-tools-builder

echo "Done!"
