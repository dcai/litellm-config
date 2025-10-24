#!/bin/bash

uv venv venv --clear
source venv/bin/activate
uv pip install -r requirements.txt
