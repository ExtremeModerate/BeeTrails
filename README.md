# Bee Trails

## Useful links along the way
* https://trac.ffmpeg.org/wiki/Slideshow
* http://johnriselvato.com/ffmpeg-how-to-blend-two-videos-together/
* https://www.youtube.com/watch?v=y5DLapRH554
  * $ ffmpeg -i input.mp4 -vf tmix=frames=8:weights="1 1 1 1 1 1 1 1" output.mp4

## Steps
1. Capture video - 4k at 30 or 60fps
2. Transfer to your computer (obviously)
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
