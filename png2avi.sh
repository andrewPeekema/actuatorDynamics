#!/bin/bash
# convert a bunch of pngs into an avi movie

# If mencoder doesn't exist
if ! hash mencoder 2>/dev/null; then
    echo "ERROR: Install mencoder"
    echo "Exiting..."
    exit 1
fi

# If a video exists
if [ -e "video/output.avi" ]; then
    echo "ERROR: \"video/output.avi\" already exists"
    echo "Move or rename the file to run this program"
    echo "Exiting..."
    exit 1
fi

# Without compression
#mencoder "mf://*.png" -mf fps=30:type=png -ovc copy -oac copy -o output.avi

# With compression
mencoder "mf://video/*.png" \
    -mf fps=60:type=png \
    -ovc x264 \
    -x264encopts pass=1:threads=auto:bitrate=900:bframes=0:me=umh:partitions=all:trellis=1:qp_step=4:qcomp=0.7:direct_pred=auto:keyint=300 \
    -oac copy \
    -o /dev/null

mencoder "mf://video/*.png" \
    -mf fps=60:type=png \
    -ovc x264 \
    -x264encopts pass=2:threads=auto:bitrate=900:bframes=0:me=umh:partitions=all:trellis=1:qp_step=4:qcomp=0.7:direct_pred=auto:keyint=300 \
    -oac copy \
    -o video/output.avi

# Cleanup temp files
rm divx2pass.log divx2pass.log.mbtree
