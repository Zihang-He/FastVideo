#!/bin/bash
# You better have two terminal, one for the remote server, and one for DiT
# CUDA_VISIBLE_DEVICES=0,1 python fastvideo/sample/call_remote_server_stepvideo.py --model_dir data/stepvideo-t2v/ &
CUDA_VISIBLE_DEVICES=0
parallel=1
url='127.0.0.1'
model_dir=data/stepvideo-t2v
torchrun --nproc_per_node $parallel fastvideo/sample/sample_t2v_stepvideo.py \
    --model_dir $model_dir \
    --vae_url $url \
    --caption_url $url  \
    --prompt assets/prompt.txt \
    --infer_steps 50  \
    --width 128 \
    --height 128 \
    --num_frames 50 \
    --cfg_scale 9.0 \
    --save_path outputs/ \
    --time_shift 13.0 