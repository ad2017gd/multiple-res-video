
#!/bin/bash

rm part*/*
rm lol.h264

mkdir part1
mkdir part1.5
mkdir part2
mkdir part3
mkdir part4

cd part1

ffmpeg -i ../part1.mp4 part1%04d.jpg 

for i in *.jpg
do
  ffmpeg -i $i -vframes 1 -s 150x150 -pix_fmt yuv420p $i.h264
  cat $i.h264 >> ../lol.h264
done

cd ..

# part1 done

part1_5w=150
part1_5h=150

cd part1.5

ffmpeg -i ../part1.5.mp4 part1.5%04d.jpg

for i in *.jpg
do
  ((part1_5w+=16))
  ((part1_5h+=10))
  ffmpeg -i $i -vframes 1 -s $(($part1_5w))x$(($part1_5h)) -pix_fmt yuv420p $i.h264
  cat $i.h264 >> ../lol.h264
done

cd ..

# part1.5 done

part2w=$part1_5w
part2h=$part1_5h

cd part2

ffmpeg -i ../part2.mp4 part2%04d.jpg

for i in *.jpg
do
  ((part2w-=2))
  ((part2h+=4))
  ffmpeg -i $i -vframes 1 -s $(($part2w))x$(($part2h)) -pix_fmt yuv420p $i.h264
  cat $i.h264 >> ../lol.h264
done

cd ..


# part 2 done


part3w=$part2w
part3h=$part2h

cd part3

ffmpeg -i ../part3.mp4 part3%04d.jpg

for i in *.jpg
do
  ((part3w+=40))
  ((part3h+=40))
  ffmpeg -i $i -vframes 1 -s $(($part3w))x$(($part3h)) -pix_fmt yuv420p $i.h264
  cat $i.h264 >> ../lol.h264
done

cd ..

# part 3 done

cd part4

ffmpeg -i ../part4.mp4 part4%04d.jpg

for i in *.jpg
do
  ffmpeg -i $i -vframes 1 -s $(($part3w))x$(($part3h)) -pix_fmt yuv420p $i.h264
  cat $i.h264 >> ../lol.h264
done

cd ..

# part 4 done


ffmpeg -r 21 -i lol.h264 -c copy -pix_fmt yuv420p -metadata title="ad2017.xyz" da-licking.mp4


# done
