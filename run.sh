#!/bin/bash
cmd="uv run litellm --telemetry False --port $LITELLM_PROXY_PORT --config ./config.yaml"
echo "Starting LiteLLM Proxy with command: $cmd"
eval $cmd
