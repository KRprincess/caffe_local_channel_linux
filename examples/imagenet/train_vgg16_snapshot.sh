#!/usr/bin/env sh
#set -e
LOG=log/train-`date +%Y-%m-%d-%H-%M-%S`.log
CAFFE=./build/tools/caffe

#LOG="experiments/logs/faster_rcnn_end2end_${NET}_${EXTRA_ARGS_SLUG}.txt.`date +'%Y-%m-%d_%H-%M-%S'`"
exec &> >(tee -a "$LOG")
echo Logging output to "$LOG"

 $CAFFE train \
       -solver models/local_channel_vgg16/solver.prototxt \
       -gpu 1,2,3 \
       -snapshot=models/local_channel_vgg16/caffe_vgg16_train_iter_360000.solverstate | tee $LOG

#./build/tools/caffe train \
#    -solver models/local_channel_vgg16/solver.prototxt \
#    -gpu all \
#    -weights=models/local_channel_vgg16/VGG16.v2.caffemodel
