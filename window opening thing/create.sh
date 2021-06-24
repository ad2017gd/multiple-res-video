

#!/bin/bash

rm empty*
rm lol.h264

ffmpeg -t 0.3 -s 1920x1080 -pix_fmt rgb24  -r 60 -i hcwjzd.png -pix_fmt yuv420p empty1-0$i.h264
cat empty1-0$i.h264 >> lol.h264

for i in {200..1}
do
  RND1=$((1 + $RANDOM % 2))
  RND2=$((1 + $RANDOM % 2))
  ffmpeg -s $((10*$RND1))x$((12*$RND2)) -f rawvideo -pix_fmt rgb24 -i /dev/zero -vframes 1 -pix_fmt yuv420p empty1-$i.h264
  cat empty1-$i.h264 >> lol.h264
done

rm empty*

ffmpeg -r 50 -i lol.h264 -c copy -pix_fmt yuv420p -metadata title="ad2017.xyz" da-spawning.mp4

rm lol.h264
