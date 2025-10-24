#!/bin/bash
source ./venv/bin/activate
litellm --telemetry False --port 7001 --config ./config.yaml
