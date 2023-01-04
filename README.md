## ffmpeg-stream-from-photo

ffmpeg command to create a stream from a single photo and overlay metadata as text.

### drawtext file metadata:
get available metadata Tags:
```ffprobe -i capt0000.jpg -show_entries frames```
find the TAG you want, eg Capture / Creation Date and Time:
```TAG:DateTime=2023:01:02 15:20:18```
add them to ffmpeg drawtext using:
```%{metadata\:DateTime}```
may look like this:
```
-filter_complex "[0:v]drawtext=text='%{metadata\:DateTime}
ExposureTime\:%{metadata\:ExposureTime}s
FNumber\:%{metadata\:FNumber}
ISO\:%{metadata\:ISOSpeedRatings}
FocalLength\:%{metadata\:FocalLength}mm':x=(w-text_w)/2:y=10:font='Noto mono':fontsize=40:alpha=0.5:box=1:boxborderw=4"
```
### multiple lines:
add a `newline` into the command

### ignore: workflow notes for future self:
- modify code on NiCornD7000
- compile using 
  ```sudo shc -f /usr/local/ffmpeg-stream-from-photo/ffmpeg-stream-from-photo.sh -o /usr/local/ffmpeg-stream-from-photo/ffmpeg-stream-from-photo```
  else it wont properly exit when changing COMMAND in Vigibot

