#!/bin/bash

SCENE=bicycle
EXPERIMENT=360_v2/"$SCENE"
DATA_ROOT=../workspace/data
DATA_DIR="$DATA_ROOT"/"$SCENE"

rm exp/"$EXPERIMENT"/*
accelerate launch train.py --gin_configs=configs/360.gin \
  --gin_bindings="Config.data_dir = '${DATA_DIR}'" \
  --gin_bindings="Config.exp_name = '${EXPERIMENT}'" \
  --gin_bindings="Config.factor = 4" \
  --gin_bindings="Config.batch_size = 4096" \
  --gin_bindings="Config.render_chunk_size = 4096"
