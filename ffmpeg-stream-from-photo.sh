#!/bin/bash
#written on NiCornD7000 by firened

trap 'echo terminating $(jobs -p); kill $(jobs -p)' TERM

#/usr/bin/ffmpeg -s:v 640x480 -loglevel warning -loop 1 -i "/home/pi/capt0000.jpg" -filter_complex "[0:v]drawtext=text='%{metadata\:DateTime}
#ExposureTime\:%{metadata\:ExposureTime}s
#FNumber\:%{metadata\:FNumber}
#ISO\:%{metadata\:ISOSpeedRatings}
#FocalLength\:%{metadata\:FocalLength}mm':x=(w-text_w)/2:y=10:font='Noto mono':fontsize=100:alpha=0.75:box=1:boxborderw=4" -r 60 -c:v h264_omx -profile:v baseline -b:v 1500000 -flags:v +global_header -bsf:v dump_extra -s:v 640x480 -f rawvideo tcp://127.0.0.1:8043 &

# -stream_loop -1\
# loop=loop=-1:size=1:start=0;
# -vf "scale=3840:2160,loop=-1:1"

/usr/bin/ffmpeg\
 -r 1 -loglevel warning\
 -i "/home/pi/capt0000.jpg"\
 -vf "[0:v]drawtext=text='%{metadata\:DateTime}
ExposureTime\:%{metadata\:ExposureTime}s
FNumber\:%{metadata\:FNumber}
ISO\:%{metadata\:ISOSpeedRatings}
FocalLength\:%{metadata\:FocalLength}mm':x=(w-text_w)/2:y=10:font='Noto mono':fontsize=100:box=1:boxborderw=4\
,loop=loop=-1:size=1:start=0,fps=fps=10"\
 -c:v h264_omx -profile:v baseline -pix_fmt yuv420p\
 -s:v 640x480\
 -flags:v +global_header -bsf:v dump_extra\
 -f rawvideo tcp://127.0.0.1:8043 &
wait
