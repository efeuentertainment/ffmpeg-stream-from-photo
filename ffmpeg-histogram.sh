#!/bin/bash
#written on NiCornD7000 by firened

trap 'echo terminating $(jobs -p); kill $(jobs -p)' TERM

/usr/bin/ffmpeg\
 -loop 1\
 -r 1 -loglevel warning\
 -i "/home/pi/capt0000.jpg"\
 -vf "histogram"\
 -c:v h264_omx -profile:v baseline -pix_fmt yuv420p\
 -r 10 -s:v 640x480\
 -flags:v +global_header -bsf:v dump_extra\
 -f rawvideo tcp://127.0.0.1:8043 &
wait

#-vf "loop=loop=-1:size=1:start=0,fps=fps=10"\

# -vf "[0:v]split=2[v0][v1];                                       # [v0]format=rgb24,histogram=display_mode=stack,scale=1280:720,setsar=1,format=yuv420p[v2];                                           # [v1]scale=1280/6:720/6,setsar=1[v3];                             # [v2][v3]overlay=x=50:y=H-h-50[v]"\
