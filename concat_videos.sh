# Mirror video vertically to create 2x tall video.

# Pipe output to txt file.
exec 2>&1

# Enter the first file's directory.
current_path=$(dirname "$1")
cd "$current_path"

inputfilename=${1%.*}
extension=${1##*.}
listfile="$inputfilename-concat-list.txt"

# Save a txt file with video paths.
for f in "$@"; do echo "file '$f'" >> $listfile; done

# Save concatinated mp4.
/usr/local/bin/ffmpeg -f concat -safe 0 -i $listfile -c copy -y $inputfilename-concat.$extension

rm $listfile

exit 0