#!/bin/bash

baseDir=~/HDD/ImageCompressor

#move pictures to location
bash baseDir/mediashare.sh

#normalize files
bash baseDir/normalize.sh

#convert to video
bash baseDir/imagesToVideo.sh