# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

uv doc: https://docs.astral.sh/uv/llms.txt
litellm doc: https://docs.litellm.ai/llms.txt

## Project Overview

This is a LiteLLM proxy configuration project that provides a unified API interface for multiple language models. The project sets up a proxy server that routes requests to various LLM providers (currently configured for GitHub Copilot models).

## Development Commands

### Environment Setup

```bash
uv sync
```

### Running the Proxy Server

```bash
# Start the LiteLLM proxy server
./run.sh
# Or manually:
uv run litellm --telemetry False --port 7001 --config ./config.yaml
```

The proxy server runs on port 7001 and serves the Swagger UI at the root path.

## Architecture

### Core Components

- **config.yaml**: Main configuration file defining model mappings and parameters
- **main.py**: Entry point (currently minimal, just contains a hello world function)
- **requirements.txt**: Python dependencies (uses litellm[proxy] >= 1.78.7)
- **pyproject.toml**: Modern Python project configuration using uv

### Configuration Structure

The `config.yaml` file defines:

- `model_list`: Array of model configurations
- Each model entry includes:
  - `model_name`: Public-facing model name
  - `litellm_params.model`: Actual provider/model identifier
  - `litellm_params.extra_headers`: Provider-specific headers (e.g., VSCode/Copilot integration headers)

### Current Model Configuration

The proxy is configured to serve:

- `gpt-4.1` → routes to `github_copilot/gpt-4.1`
- `claude-sonnet-4.5` → routes to `github_copilot/claude-sonnet-4.5`

Both models include VSCode integration headers for Copilot compatibility.

## Key Development Notes

- The project uses `uv` for package management and virtual environment creation
- LiteLLM proxy provides Swagger UI automatically for API documentation
- Telemetry is disabled for privacy
- Server runs on port 7001 by default
- The virtual environment is located in `./venv/` and is managed by uv
