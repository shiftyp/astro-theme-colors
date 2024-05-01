shopt -s extglob

hue=$1
saturation=$2
brightness=$3
for image in !(*.shifted).{jpg,png}; do
  file=$(basename -- "$image")
  without_extension="${file%.*}"
  extension="${file##*.}"
  convert -define modulate:colorspace=HSB $file -modulate ${saturation:-100},${brighness:-100},$hue $without_extension.$hue.${saturation:-100}.${brighness:-100}.shifted.$extension;
done;
