#!/bin/bash

ffmpeg -framerate 25 -pattern_type glob -i '*.jpg' -c:v libx264 -profile:v high -crf 20 -pix_fmt yuv420p output.mp4
