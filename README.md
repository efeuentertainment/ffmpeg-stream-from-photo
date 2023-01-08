## ffmpeg-stream-from-photo

ffmpeg command to create a stream from a single photo and overlay metadata as text.

### drawtext file metadata:
``ffmpeg-stream-from-photo.sh`  
get available metadata Tags:
```
ffprobe -i capt0000.jpg -show_entries frames
```
find the TAG you want, eg Capture / Creation Date and Time:
```
TAG:DateTime=2023:01:02 15:20:18
```
add them to ffmpeg drawtext using:
```
%{metadata\:DateTime}
```
may look like this:
```
-filter_complex "[0:v]drawtext=text='%{metadata\:DateTime}
ExposureTime\:%{metadata\:ExposureTime}s
FNumber\:%{metadata\:FNumber}
ISO\:%{metadata\:ISOSpeedRatings}
FocalLength\:%{metadata\:FocalLength}mm':x=(w-text_w)/2:y=10:font='Noto mono':fontsize=40:alpha=0.5:box=1:boxborderw=4"
```
ffmpeg loop by Jacob Greenbow: https://stackoverflow.com/questions/25891342/creating-a-video-from-a-single-image-for-a-specific-duration-in-ffmpeg  
timestamp https://stackoverflow.com/questions/71633262/ffmpeg-create-timestamp-based-on-actual-creation-time  
metadata docs https://ffmpeg.org/ffmpeg-filters.html#Syntax  
metadata https://stackoverflow.com/questions/24744608/ffmpeg-and-timecode-from-movie-metadata  

### script
bash traps https://cnr.sh/essays/kill-subprocesses-linux-bash  
bash "& wait" https://unix.stackexchange.com/questions/562109/bash-trap-of-sigterm-fails  
shell binary https://www.geeksforgeeks.org/shell-scripting-creating-a-binary-file/  

### multiple lines:
add a `newline` into the command

multiple lines https://stackoverflow.com/questions/8213865/ffmpeg-drawtext-over-multiple-lines  

### histogram
`ffmpeg-histogram.sh`  
doc https://trac.ffmpeg.org/wiki/Histogram  
overlay https://hhsprings.bitbucket.io/docs/programming/examples/ffmpeg/video_data_visualization/histogram.html  

### ignore: workflow notes for future self:
- modify code on NiCornD7000
- compile using 
  ```
  sudo shc -f /usr/local/ffmpeg-stream-from-photo/ffmpeg-stream-from-photo.sh -o /usr/local/ffmpeg-stream-from-photo/ffmpeg-stream-from-photo
  ```
  else it wont properly exit when changing COMMAND in Vigibot

