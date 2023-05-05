# Bee Trails

## Useful links along the way
* https://trac.ffmpeg.org/wiki/Slideshow
* http://johnriselvato.com/ffmpeg-how-to-blend-two-videos-together/
* https://www.youtube.com/watch?v=y5DLapRH554
  * $ ffmpeg -i input.mp4 -vf tmix=frames=8:weights="1 1 1 1 1 1 1 1" output.mp4

## Steps
1. Capture video - 4k at 30 or 60fps
2. Transfer to your computer (obviously) as a .MOV file

### Make a direct set of trails
This is the easiest approach that gives the full color image, plus white trails.  Vary the `decay=` value for longer/shorter tails, but 0.990-0.995 is pretty good.  The `planes=7` option only picks up differences in the white channel.

`ffmpeg -i ORIGINAL.MOV -an -vf "format=yuv420p,lagfun=decay=0.995:planes=7" trails.mp4`

to remove audio, include the `-an` flag

### Extract difference frames from original
If you just want black background with white trails

`ffmpeg -i ORIGINAL.MOV -an -pix_fmt yuv420p -filter_complex "format=gbrp,tblend=all_mode=difference:all_opacity=1,format=yuv420p,lagfun=decay=0.995:planes=7" diff-trails.mp4`

Or, if you want the steps, first create the diffs video

`ffmpeg -i ORIGINAL.MOV -an -pix_fmt yuv420p -filter_complex "format=gbrp,tblend=all_mode=difference:all_opacity=1" diffs.mp4`

then make trails from them

`ffmpeg -i diffs.mp4 -vf "format=yuv420p,lagfun=decay=0.99:planes=7" diff-trails.mp4`

## Scaling the results

* `ffmpeg -i diff-trails.mp4 -s 1920x1080 -c:a copy diff-trails`
* OR `ffmpeg -i diff-trails.mp4 -filter:v scale=1920:1080 -c:a copy diff-trails-1080.mp4`
* OR just pick the width
  * `ffmpeg -i diff-trails.mp4 -filter:v scale=1920:-1 -c:a copy diff-trails-1080.mp4`

## OLD METHODS, Don't Bother

3. Extract frame differences from the original
   * `ffmpeg -i IMG_1329.MOV -filter_complex "format=gbrp,tblend=all_mode=difference" output.mp4`
   * Note that this makes a broken video, so we extract the frames from this, then put them back together
4. Extract frames from the diff video
   * `ffmpeg -i output.mp4 diffs/frame-%04d.jpg`
5. Put them back together
   * `ffmpeg -framerate 30 -i diffs/frame-%04d.jpg -c:v libx264 -vf "fps=30,format=yuv420p" output3.mp4`
   * Ignore the deprecated pixel format used warning
   * Supported pixel formats: yuv420p yuvj420p yuv422p yuvj422p yuv444p yuvj444p nv12 nv16 nv21 yuv420p10le yuv422p10le yuv444p10le nv20le gray gray10le

6. Make longer trails
   *  ffmpeg -i output3.mp4 -vf "format=yuv420p,lagfun=decay=1:planes=7" planes=trails.mp4
   * the planes option is color, see https://jiras.se/ffmpeg/lagfun/index.html


6. Make trails (slower but can be used to accumulate over a very long time with all trails)
   * THIS DOESN'T REALLY WORK - USE StarStax
   * `ffmpeg -i output3.mp4 -vf tmix=frames=30:weights="1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1" trails.mp4`
   * **STARSTAX settings**
   * drag/drop all of the images in `diffs/` into StarStax sidebar 
   * YES gap Filling  
   * NO comet mode
   * NO Subtrack Dark Images
   * YES Save after each step into a separate directory 
     * `cumulative/{template}.jpg`
     * Use a simpler template than the default, or modify the next step accordingly
7. Merge cumulative photos into movie
   * this makes a move of the trails,  you have to decide the final framerate and pic the frame range  
   * `ffmpeg -framerate 30 -i cumulative/StarStaX_frame-0001-frame-0800_gap_filling_%08d.jpg cumulative.mp4`
   * `ffmpeg -framerate 60 -i cumulative/StarStaX_frame-0001-frame-0800_gap_filling_%08d.jpg cumulative.mp4`
8. 
