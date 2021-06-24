#!/bin/bash

rm empty*
rm lol.h264

ffmpeg -t 0.2 -r 50 -i john.png -s 800x800 -vframes 1 -pix_fmt yuv420p empty.h264
cat empty.h264 >> lol.h264


for i in {160..2}
do
  RND1=$((($i+$i%2)*5))
  RND2=$((($i+$i%2)*5))
  ffmpeg -t 0.01 -s $(($RND1))x$(($RND2)) -r 420 -i john.png -s $(($RND1))x$(($RND2)) -vframes 1 -pix_fmt yuv420p empty1-$i.h264
  cat empty1-$i.h264 >> lol.h264
done 

for i in {2..160}
do
  RND1=$((($i+$i%2)*5))
  RND2=$((($i+$i%2)*5))
  ffmpeg -t 0.01 -s $(($RND1))x$(($RND2)) -r 420 -i john.png -s $(($RND1))x$(($RND2)) -vframes 1 -pix_fmt yuv420p empty2-$i.h264
  cat empty2-$i.h264 >> lol.h264
done


rm empty*

ffmpeg -r 50 -i lol.h264 -c copy -pix_fmt yuv420p -metadata title="ad2017.xyz" da-moving.mp4

rm lol.h264
