FROM runpod/worker-comfyui:6.0.0-base

RUN comfy-node-install ComfyUI-LTXVideo

COPY src/handler.py /handler.py

COPY requirements.txt /requirements.txt
RUN uv pip install -r /requirements.txt --break-system-packages