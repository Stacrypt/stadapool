#!/usr/bin/env bash

set -e

docker build -t cardano-my-stake .

docker image rm cardano-tools-builder

echo "Done!"
