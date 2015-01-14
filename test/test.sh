#! /bin/sh

#Test PNG output
../bin/hpi2png.pl 000203_4335_1011_oslp.hpi 000203_4335_1011_oslp.png && echo "PNG TEST O.K." || echo "PNG TEST FAILED."

#Test GIF output
../bin/hpi2png.pl 000203_4335_1011_oslp.hpi 000203_4335_1011_oslp.gif && echo "GIF TEST O.K." || echo "GIF TEST FAILED."

#Test HPI output, file overwrite protection
../bin/hpi2png.pl 000203_4335_1011_oslp.hpi 000203_4335_1011_oslp.hpi && echo "HPI TEST FAILED." || echo  "HPI TEST O.K."
