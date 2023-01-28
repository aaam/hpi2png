#! /usr/bin/perl

#
# @File hpi2png.pl
# @Author Alexander A. Mandl
# @Created 22-Mar-2011 18:15:10
# @Use ./hpi2png.pl input.hpi output.png
# @Comment Ensure ImageMagick and PerlMagick packages are installed
#
# AAM IT Solutions,License::AGPLv3
#

use strict;
use Image::Magick;

#protect file overwrite
if ( $ARGV[0] =~ $ARGV[1] ) {
  die("Error: Input cannot be the Output.");
}
my( $image, $mask, $input, $output, $jpg, $png, $line );

#hpi stores the image in jpg
$image = Image::Magick->new(magick=>'jpg');

#hpi stores the mask in png
$mask = Image::Magick->new(magick=>'png');

($input, $output) = ($ARGV[0],$ARGV[1]);

#open first argument
open(I, "$input") || die("Error: Opening input argument.");

#binary file
binmode(I);

#read lines
while($line = <I>){
  $_ .= $line;
}

#close filedescriptor
close(I);

# find the ending png pattern
($jpg, $png) = m/^.{32}(.*)(\211PNG.*)$/s;

# create jpg image object
$image->BlobToImage($jpg);

#create png image object
$mask->BlobToImage($png);

#jpg is not transparent
$image->Set(alpha=>'Off');

#apply layer mask
$image->Composite(image=>$image,image=>$mask,compose=>'CopyOpacity');

#write out result or display in X
if ( "$output"){
  $image->Write($output);
}else{
  $image->display();
}
