# Mirror video horizontally to create 2x wide video.

# Pipe output to txt file.
exec 2>&1

# Enter the first file's directory.
current_path=$(dirname "$1")
cd "$current_path"

# For every selected file, save mp4.
for f in "$@"
do
	filenameNoExt=${f%.*}
	/usr/local/bin/ffmpeg -i "$f"  -filter_complex "[0:v]hflip[right];[0:v][right] hstack" -y "$filenameNoExt-hmirror.mp4"
done

exit 0