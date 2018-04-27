#!/usr/bin/env sh
set -e

./build/tools/caffe train \
    --solver=models/local_channel_vgg16/solver.prototxt \
	--gpu 1,2,3 \
	-weights=models/local_channel_vgg16/VGG16.v2.caffemodel$@
