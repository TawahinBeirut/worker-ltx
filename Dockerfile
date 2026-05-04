FROM runpod/worker-comfyui:5.8.5-base

RUN comfy-node-install ComfyUI-LTXVideo

COPY src/handler.py /handler.py

COPY requirements.txt /requirements.txt
RUN uv pip install -r /requirements.txt --break-system-packages

RUN rm -rf /comfyui/models/checkpoints && \
    rm -rf /comfyui/models/loras && \
    rm -rf /comfyui/models/text_encoders && \
    rm -rf /comfyui/models/latent_upscale_models && \
    ln -s /runpod-volume/models/checkpoints /comfyui/models/checkpoints && \
    ln -s /runpod-volume/models/loras /comfyui/models/loras && \
    ln -s /runpod-volume/models/text_encoders /comfyui/models/text_encoders && \
    ln -s /runpod-volume/models/latent_upscale_models /comfyui/models/latent_upscale_models