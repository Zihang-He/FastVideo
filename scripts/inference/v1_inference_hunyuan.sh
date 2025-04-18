#!/bin/bash

num_gpus=2
export FASTVIDEO_ATTENTION_BACKEND=
export MODEL_BASE=FastVideo/FastHunyuan-diffusers
# export MODEL_BASE=hunyuanvideo-community/HunyuanVideo
# Note that the tp_size and sp_size should be the same and equal to the number
# of GPUs. They are used for different parallel groups. sp_size is used for
# dit model and tp_size is used for encoder models.
torchrun --nnodes=1 --nproc_per_node=$num_gpus --master_port 29503 \
    fastvideo/v1/sample/v1_fastvideo_inference.py \
    --sp_size 2 \
    --tp_size 2 \
    --height 256 \
    --width 512 \
    --num_frames 21 \
    --num_inference_steps 6 \
    --guidance_scale 1 \
    --embedded_cfg_scale 6 \
    --flow_shift 17 \
    --prompt_path ./assets/prompt.txt \
    --seed 1024 \
    --output_path outputs_video/ \
    --model_path $MODEL_BASE \
    --vae-sp
