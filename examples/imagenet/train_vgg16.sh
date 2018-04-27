#!/usr/bin/env sh
#set -e
LOG=log/train-`date +%Y-%m-%d-%H-%M-%S`.log
CAFFE=./build/tools/caffe

exec &> >(tee -a "$LOG")
echo Logging output to "$LOG"

 $CAFFE train \
       -solver models/local_channel_vgg16/solver.prototxt \
       -gpu 1,2,3 \
       -weights=models/local_channel_vgg16/VGG16.v2.caffemodel | tee $LOG

#./build/tools/caffe train \
#    -solver models/local_channel_vgg16/solver.prototxt \
#    -gpu all \
#    -weights=models/local_channel_vgg16/VGG16.v2.caffemodel
