# Save (no audio) video file to mp4.

# Pipe output to txt file.
exec 2>&1

# Enter the first file's directory.
current_path=$(dirname "$1")
cd "$current_path"

# For every selected file, save mp4.
for f in "$@"
do
	filenameNoExt=${f%.*}
	/usr/local/bin/ffmpeg -i "$f" -vf "crop=trunc(iw/2)*2:trunc(ih/2)*2" -c:v libx264 -preset slow -crf 22 -pix_fmt yuv420p -an -y "$filenameNoExt.mp4"
done

exit 0