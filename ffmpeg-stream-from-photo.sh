#!/bin/bash
#written on NiCornD7000 by firened

trap 'echo terminating $(jobs -p); kill $(jobs -p)' TERM

/usr/bin/ffmpeg -loglevel warning -loop 1 -i "/home/pi/capt0000.jpg" -filter_complex "[0:v]drawtext=text='%{metadata\:DateTime}
ExposureTime\:%{metadata\:ExposureTime}s
FNumber\:%{metadata\:FNumber}
ISO\:%{metadata\:ISOSpeedRatings}
FocalLength\:%{metadata\:FocalLength}mm':x=(w-text_w)/2:y=10:font='Noto mono':fontsize=40:alpha=0.75:box=1:boxborderw=4" -r 15 -c:v h264_omx -profile:v baseline -b:v 1500000 -flags:v +global_header -bsf:v dump_extra -s:v 640x480 -f rawvideo tcp://127.0.0.1:8043 &
wait
