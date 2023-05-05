  508  ffmpeg
  517  ffmpeg -i IMG_1329.MOV frame-%04d.jpg -hide-banner
  518  ffmpeg -i IMG_1329.MOV frame-%04d.jpg
  519  ffmpeg -i IMG_1329.MOV -filter_complex "tblend=all_mode=difference" output.mp4
  520  ffmpeg -i IMG_1329.MOV -filter_complex "format=gbrp,tblend=all_mode=difference" output.mp4
  521  ffmpeg -i IMG_1329.MOV -filter_complex "format=gbrp,tblend=all_mode=difference" output2.mp4
  523  ffmpeg -i output2.mp4 diffs/frame-%04d.jpg
  525  ffmpeg -i IMG_1329.MOV -filter_complex "format=gbrp,tblend=all_mode=difference" output2.mov
  527  ffmpeg -framerate 30 -i cumulative/StarStaX_frame-0001-frame-0800_gap_filling_00000%03d.jpg cumulative.mp4
  528  man ffmpeg
  531  man ffmpeg
  532  man ffmpeg-filters
  533  ffmpeg -i original/frame-0001.jpg -filter "screen" filt.mp4
  534  ffmpeg -i original/frame-0001.jpg -filter "blend=screen" filt.mp4
  535  ffmpeg -i original/frame-0001.jpg -i cumulative.mp4 -filter_complex "blend=screen" filt.mp4
  536  ffmpeg -i cumulative.mp4 -vf tmix=frames=8:weights="1 1 1 1 1 1 1 1" trails.mp4
  537  ffmpeg -i output2.mp4 -vf tmix=frames=8:weights="1 1 1 1 1 1 1 1" trails.mp4
  538  ffmpeg -i output.mp4 -vf tmix=frames=8:weights="1 1 1 1 1 1 1 1" trails.mp4
  539  history | grep ffmpeg
  540  history | grep ffmpeg > steps.sh
  541  ffmpeg -i diffs/* -vf tmix=frames=30:weights="1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1" trails.mp4
  542  ffmpeg -framerate 30 -pattern_type glob -i diffs/* -vf tmix=frames=30:weights="1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1" trails.mp4
  543  ffmpeg -framerate 30 -pattern_type glob -i diffs/* output3.mp4
  544  ffmpeg -framerate 30 -pattern_type glob -i 'diffs/*' -vf tmix=frames=30:weights="1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1" trails.mp4
  545  ffmpeg -framerate 30 -pattern_type glob -i 'diffs/*.jpg' -vf tmix=frames=30:weights="1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1" trails.mp4
  546  ffmpeg -framerate 30 -pattern_type glob -i 'diffs/*.jpg' output3.mp4
  547  history | grep ffmpeg > steps.sh
  549  ffmpeg -framerate 30 -i diffs/frame-%04d.jpg output3.mp4
  550  ffmpeg -framerate 30 -i cumulative/StarStaX_frame-0001-frame-0800_gap_filling_00000%03d.jpg output3.mp4
  553  ffmpeg -framerate 30 -i diffs/frame-%04d.jpg  output3.mp4
  554  ffmpeg -i diffs/frame-%04d.jpg -c:v libx264 -vf "fps=30,format=yuv420p"  output3.mp4
  555  ffmpeg -framerate 30 -i diffs/frame-%04d.jpg -c:v libx264 -vf "fps=30,format=yuv420p"  output3.mp4
  556  ffmpeg -framerate 30 -i diffs/frame-%04d.jpg -c:v libx264 -vf "fps=30"  output3.mp4
  557  ffmpeg -h encoder=libx264
  558  ffmpeg -framerate 30 -i diffs/frame-%04d.jpg -c:v libx264 -vf "fps=30,format=yuv420jp"  output3.mp4
  559  ffmpeg -framerate 30 -i diffs/frame-%04d.jpg -c:v libx264 -vf "fps=30,format=yuvj420p"  output3.mp4
  560  ffmpeg -framerate 30 -i diffs/frame-%04d.jpg -c:v libx264 -vf "fps=30,format=yuv422p"  output3.mp4
  561  ffmpeg -framerate 30 -i diffs/frame-%04d.jpg -c:v libx264 -vf "fps=30,format=yuv420p"  output3.mp4
  563  ffmpeg -i output3.mp4 -vf tmix=frames=30:weights="1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1" trails.mp4
  564  ffmpeg -i output3.mp4 -vf tmix=frames=10:weights="1 1 1 1 1 1 1 1 1 1" trails.mp4
  565  ffmpeg -i output3.mp4 -vf tmix=frames=8:weights="1 1 1 1 1 1 1 1" trails.mp4
  566  history | grep ffmpeg
  567  ffmpeg -i original/frame-0001.jpg -i cumulative.mp4 -filter_complex "blend=all_expr='A*0.5+B'=screen" filt2.mp4
  568  ffmpeg -i original/frame-0001.jpg -i cumulative.mp4 -filter_complex "blend=all_expr='A*0.5+B';blend=screen" filt2.mp4
  569  ffmpeg -i original/frame-0001.jpg -i cumulative.mp4 -filter_complex "blend=all_expr='A*0.5';blend=screen" filt2.mp4
  570  ffmpeg -i original/frame-0001.jpg -i cumulative.mp4 -filter_complex "blend=all_expr='A*0.5':all_mode='screen'" filt2.mp4
ffmpeg -i original/frame-0001.jpg -i cumulative.mp4 -filter_complex "blend=all_expr='A*0.5+B':all_mode='screen'" filt2.mp4
  572  ffmpeg -i original/frame-0001.jpg -i cumulative.mp4 -filter_complex "colorchannelmixer=aa=0.5[ol];[b][ol]screen" filt2.mp4
  573  ffmpeg -i original/frame-0001.jpg -i cumulative.mp4 -filter_complex "colorchannelmixer=aa=0.5[ol];[b][ol]overlay" filt2.mp4
  574  ffmpeg -i original/frame-0001.jpg -i cumulative.mp4 -filter_complex "colorchannelmixer=a=0.5[ol];[b][ol]overlay" filt2.mp4
  575  ffmpeg -i original/frame-0001.jpg -i cumulative.mp4 -filter_complex "format=argb,colorchannelmixer=aa=0.5[ol];[b][ol]overlay" filt2.mp4
  576  ffmpeg -i original/frame-0001.jpg -i cumulative.mp4 -filter_complex "blend=all_opacity=0.5:all_mode='screen'" filt2.mp4
  577  ffmpeg -i original/frame-0001.jpg -i cumulative.mp4 -filter_complex "blend=c0_opacity=0.5:all_mode='screen'" filt2.mp4
  578  ffmpeg -i original/frame-0001.jpg -i cumulative.mp4 -filter_complex "blend=c1_opacity=0.5:all_mode='screen'" filt2.mp4
  579  ffmpeg -i original/frame-0001.jpg -i cumulative.mp4 -filter_complex "blend=all_opacity=0.5[v]:all_mode='screen'" filt2.mp4
  580  ffmpeg -i original/frame-0001.jpg -i cumulative.mp4 -filter_complex "blend=all_opacity=0.5[a]:all_mode='screen'" filt2.mp4
  581  ffmpeg -i original/frame-0001.jpg -i cumulative.mp4 -filter_complex "blend=all_opacity=0.9:all_mode='screen'" filt2.mp4
  590  ffmpeg -i a.MOV -filter_complex "format=gbrp,tblend=all_mode=difference" | ffmpeg -i - output.mp4
  591  ffmpeg -i a.MOV -filter_complex "format=gbrp,tblend=all_mode=difference" - | ffmpeg -i - output.mp4
  592  ffmpeg -i a.MOV -filter_complex "format=gbrp,tblend=all_mode=difference" - | ffmpeg  output.mp4
  593  ffmpeg -i a.MOV -filter_complex "format=gbrp,tblend=all_mode=difference"  -vf format=yuv420p pipe:1 | ffmpeg -i pipe:1 output.mp4
  594  ffmpeg -i a.MOV -filter_complex "format=gbrp,tblend=all_mode=difference"  -vf format=yuv420p pipe:1 | cat > output.mp4
  595  ffmpeg -i a.MOV -filter_complex "format=gbrp,tblend=all_mode=difference"  -f mp4 pipe:1 | cat > output.mp4
  596  ffmpeg -i a.MOV -filter_complex "format=gbrp,tblend=all_mode=difference"  -f mp4 pipe:1 | ffmpeg -i pipe:1 output.wav
  597  ffmpeg -i a.MOV -filter_complex "format=gbrp,tblend=all_mode=difference"  -vf format=yuv420p output1.mp4
  598  ffmpeg -i a.MOV -filter_complex "format=gbrp,tblend=all_mode=difference"  -f mp4 | cat /dev/null
  599  ffmpeg -i a.MOV -filter_complex "format=gbrp,tblend=all_mode=difference"  -f mp4 | ffmpeg -i - -vf format=yuv420p output1.mp4
  600  ffmpeg -i a.MOV -filter_complex "format=gbrp,tblend=all_mode=difference"  -f mp4 - | ffmpeg -i - -vf format=yuv420p output1.mp4
  601  ffmpeg -i a.MOV -filter_complex "format=gbrp,tblend=all_mode=difference"  -f mp4 -ftp-write-seekable 1  - | ffmpeg -i - -vf format=yuv420p output1.mp4
  602* ffmpeg -i a.MOV -filter_complex "format=gbrp,tblend=all_mode=difference"
  603  ffmpeg -i a.MOV -filter_complex "format=gbrp,tblend=all_mode=difference" -movflags frag_keyframe - | ffmpeg -i -  -vf format=yuv420p output2.mp4
  604  ffmpeg -i output1.mp4  -vf format=yuv420p output2.mp4
  607  ffmpeg -i output2.mp4 diffs/frame-%05d.jpg
  610  history | grep ffmpeg > ../bees/steps.sh


  503  ffmpeg -i file.mp4 2>&1 | grep -o '[0-9]\{1,3\}\sfps'
  504  ffmpeg -i a.mov 2>&1 | grep -o '[0-9]\{1,3\}\sfps'
  505  ffmpeg -i a.MOV 2>&1 | grep -o '[0-9]\{1,3\}\sfps'
  506  ffmpeg -i b.MOV 2>&1 | grep -o '[0-9]\{1,3\}\sfps'
  507  ffmpeg -i e.MOV 2>&1 | grep -o '[0-9]\{1,3\}\sfps'
  508  ffmpeg -i d.MOV 2>&1 | grep -o '[0-9]\{1,3\}\sfps'
  509  ffmpeg -i d.MOV 2>&1 | grep -o '[0-9]\{1,3\}\sfps' | sed 's/\sfps//'
  510  ffmpeg -i d.MOV 2>&1 | grep -o '[0-9]\{1,3\}\sfps' | sed 's/\sfps//'
  511  ffmpeg -i d.MOV 2>&1 | grep -o '[0-9]\{1,3\}\sfps' | sed 's/fps//'
  512  ffmpeg -i d.MOV 2>&1 | grep -o '([0-9]\{1,3\})\sfps'
  513  ffmpeg -i d.MOV 2>&1 | grep -o '[0-9]\{1,3\}\sfps' | sed 's/fps//'
  523  ffmpeg -i diff_output.mp4 -qscale:v 4 -frames:v 1 -filter_complex "blend=all_mode='screen'" combined.jpg
  524  ffmpeg -i diff_output.mp4 -qscale:v 4 -frames:v 1  combined.jpg
  525  ffmpeg -i diff_output.mp4 -qscale:v 4 -frames:v 1 -ss 30  combined.jpg
  526  ffmpeg -i d.MOV 2>&1 | grep -o '([0-9]\{1,3\})\sfps'
  531  ffmpeg -i frame_00000001.png -i frame_00000002.png -filter_complex "screen" a.png
  532  ffmpeg -i frame_00000001.png -i frame_00000002.png -filter_complex "blend=screen" a.png
  534  ffmpeg -i frame_%08d.png -filter_complex "blend=screen" a.png
  535  ffmpeg -i frame_%08d.png -filter_complex "blend=screen" a.mp4
  536  ffmpeg -i frame_%08d.png a.mp4
  559  convert
  561  convert
  564  convert --help
  566  convert -threshold 50 frame_00000502.png out.png
  567  convert -threshold 150 frame_00000502.png out.png
  568  convert -threshold 150 --help frame_00000502.png out.png
  569  convert -threshold 50% frame_00000502.png out.png
  570  convert -threshold '50%' frame_00000502.png out.png
  571  convert -threshold '10%' frame_00000502.png out.png
  572  convert -threshold '15%' frame_00000502.png out.png
  573  magick -threshold '15%' frame_00000502.png out.png
  574  magick frame_00000001.png -threshold '15%' out.png
  575  magick frame_0000001*.png -threshold '15%' out.png
  579  magick frame_0000001*.png -threshold '15%' out.png
  584  magick frame_0000001*.png -threshold '15%' out.png
  585  magick frame_0000001*.png -threshold '15%' out-%08d.png
  586  magick frame_0000001*.png -threshold '15%' -compose Screen -Layers Flatten out.png
  587  magick frame_0000001*.png -threshold '15%' -compose Screen -layers Flatten out.png
  588  magick frame_0000001*.png -threshold '15%' -compose Screen out.png
  589  magick frame_*.png -threshold '15%' -compose Screen out.png
  590  magick f threshold '15%' -compose Screen out.png
  592  magick frame_000000*.png threshold '15%' -compose Screen out.png
  593  magick frame_000000*.png -threshold '15%' -compose Screen out.png
  595  magick frame_000000*.png -threshold '15%' -compose Screen -layers Flatten out.png
  596  magick frame_000000*.png -threshold '15%' -compose Lighten -layers Flatten out.png
  597  magick frame_000000*.png -threshold '15%' -compose Multiply -layers Flatten out.png
  598  magick frame_000000*.png -threshold '10%' -compose Multiply -layers Flatten out.png
  599  magick frame_000000*.png -threshold '15%' thresh_%08d.png
  600  magick thresh_000000*.png -compose Lighten -layers Flatten out.png
  601  magick thresh_000000*.png -compose Multiply -layers Flatten out.png
  602  magick thresh_000000*.png -compose Screen -layers Flatten out.png
  604  magick thresh_*.png -compose Lighten -layers Flatten out.png
  605  magick thresh_*.png -compose Lighten -composite -layers Flatten out.png
  606  magick -list evaluate
  607  magick -list compose
  608  magick thresh_*.png -compose Overlay -layers Flatten out.png
  609  magick thresh_*.png -compose Darken -layers Flatten out.png
  610  magick thresh_*.png -background black -compose Lighten -composite -layers Flatten out.png
  611  magick frame_*.png -background black -threshold '15%' -compose Lighten -layers Flatten out.png
  612  magick frame_00000*.png -background black -threshold '15%' -compose Lighten out_%08d.png
  613  magick out_00000*.png -background black  -compose Lighten out.png
  615  magick -size 320x90 canvas:none -stroke snow4 -size 1x90 -tile gradient:white-snow4   -draw 'roundrectangle 16, 5, 304, 85 20,40' +tile -fill snow   -draw 'roundrectangle 264, 5, 304, 85  20,40' -tile gradient:chartreuse-green   -draw 'roundrectangle 16,  5, 180, 85  20,40' -tile gradient:chartreuse1-chartreuse3   -draw 'roundrectangle 140, 5, 180, 85  20,40' +tile -fill none   -draw 'roundrectangle 264, 5, 304, 85 20,40' -strokewidth 2   -draw 'roundrectangle 16, 5, 304, 85 20,40' \( +clone -background snow4   -shadow 80x3+3+3 \) +swap -background none -layers merge \( +size -pointsize 90   -strokewidth 1 -fill red label:'50 %' -trim +repage \( +clone -background firebrick3   -shadow 80x3+3+3 \) +swap -background none -layers merge \) -insert 0 -gravity center   -append -background white -gravity center -extent 320x200 cylinder_shaded.png

  532  man ffmpeg
  557    527  man convert
  558    529  history | egrep 'ffmpeg|convert|magick' | pbcopy
  560  history | egrep 'ffmpeg|convert|magick' | pbcopy

  527  man convert
  529  history | egrep 'ffmpeg|convert|magick' | pbcopy
  530    532  man ffmpeg
  531    557    527  man convert
  532    558    529  history | egrep 'ffmpeg|convert|magick' | pbcopy
  533    560  history | egrep 'ffmpeg|convert|magick' | pbcopy
  534   history | egrep 'ffmpeg|convert|magick' | pbcopy

