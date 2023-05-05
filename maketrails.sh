#!/bin/bash
set -x

# maketrails.sh originalvideo.ext

FIRSTDIFF=bad_diff_output.mp4
FIXEDDIFF=diff_output.mp4
DIFFDIR=diffs
DIFFSNAME=frame_%08d.png
THRESHNAME=thresh_%08d.png
TRAXDIR=trax
TRAXNAME=trax_%08d.png

# shellcheck disable=SC1068
fullfile="$1"

dirname=$(dirname -- "$fullfile")
filename=$(basename -- "$fullfile")
extension="${filename##*.}"
basename="${filename%.*}"
fulldir="$dirname/$basename"

echo fullfile $fullfile
echo filename $filename
echo basename $basename
echo extension $extension
echo fulldir $fulldir

if [ -e $fulldir ]; then
  echo $fulldir already exists - continuing
#  exit
else
  mkdir -p "$fulldir"
fi

pushd $fulldir
mkdir $DIFFDIR
mkdir $TRAXDIR

echo PWD is $PWD
#if [ ! -d $directory ]; then
#  echo
#fi

fps=$(ffmpeg -i $fullfile 2>&1 | grep -o '[0-9]\{1,3\}\sfps' | sed 's/fps//')
echo FPS $fps

echo Extracting Differences from $fullfile
#ffmpeg -i "$fullfile" -filter_complex "format=gbrp,tblend=all_mode=difference" "$FIRSTDIFF"
echo Fixing the output into $FIXEDDIFF
#ffmpeg -i "$FIRSTDIFF" -vf format=yuv420p  "$FIXEDDIFF"

echo Extracting frames into $DIFFDIR/$DIFFSNAME
#ffmpeg -i "$FIXEDDIFF" "$DIFFDIR/$DIFFSNAME"

echo Threshhold reduction to $DIFFDIR/$THRESHNAME
magick "$DIFFDIR/$DIFFSNAME" -threshold '15%' "$DIFFDIR/$THRESHNAME"

#ffmpeg -i "$DIFFDIR/$DIFFSNAME" -filter_complex "blend=all_mode='screen'" combined.jpg

# doesn't work
# ffmpeg -i "$DIFFDIR/$DIFFSNAME" -filter_complex "overlay=0:0" combined.png


popd
