#!/bin/bash

ffmpeg -framerate 30 -pattern_type glob -i '*.jpg' -c:v libx264 output.mp4
