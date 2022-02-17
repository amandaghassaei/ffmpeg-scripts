# Mirror video vertically to create 2x tall video.

# Pipe output to txt file.
exec 2>&1

# Enter the first file's directory.
current_path=$(dirname "$1")
cd "$current_path"

# For every selected file, save mp4.
for f in "$@"
do
	filenameNoExt=${f%.*}
	/usr/local/bin/ffmpeg -i "$f"  -filter_complex "[0:v]vflip[bottom];[0:v][bottom] vstack" -y "$filenameNoExt-vmirror.mp4"
done

exit 0