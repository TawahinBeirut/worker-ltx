FROM runpod/worker-comfyui:5.1.0-base

# Node custom LTX-2.3 de Lightricks
RUN comfy-node-install ComfyUI-LTXVideo

# Ton handler modifié (support vidéo)
COPY src/handler.py /handler.py

COPY requirements.txt /requirements.txt
RUN uv pip install -r /requirements.txt --break-system-packages