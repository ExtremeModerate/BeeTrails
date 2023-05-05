#!/bin/bash

tmpfile=tmpfile.png
digits=%08d
tmpl=frame_${digits}.png

pushd $(dirname $1)

prev=1
prevfile=$(printf $tmpl $prev)
cp $prevfile $tmpfile

counter=2
curfile=$(printf $tmpl $counter)
rm out_*.png

# do it all at once - memory intensive
magick frame_*.png -background black -threshold '15%' -compose Lighten -layers Flatten out.png

while [ -e "$curfile" ]; do
  output=$(printf out_${digits}.png $counter)
  echo $prevfile $curfile $output

  convert -threshold '10%' $curfile threshold.png
  ffmpeg -y -i $tmpfile -i threshold.png -filter_complex "blend=screen" $output
  tmpfile=$output

  prev=$counter
  prevfile=$curfile
  let counter=counter+1
  curfile=$(printf $tmpl $counter)
done

popd

#cp capture000000.jpg out000000.jpg
#prevfile=0
#prevfileious=0
#counter=1
#curfilerent=1
#until [ $counter -gt 309 ]; do
#  curfilerent=$(echo 0000000$counter | tail -c 7) &&
#    prevfile=$((counter - 1)) &&
#    prevfileious=$(echo 0000000$prevfile | tail -c 7) &&
#    prevfileious=$(echo 0000000$prevfile | tail -c 7) &&
#    gmic capture$(echo $curfilerent).jpg out$(echo $prevfileious).jpg blend lighten -o out$(echo $curfilerent).jpg &&
#    ((counter++))
#done &&
#  ffmpeg -framerate 48 -i out%06d.jpg -vcodec libx264 -s 1280x720 -preset slow -crf 5 -pix_fmt yuv420p ~/Desktop/startrails1d.mkv
