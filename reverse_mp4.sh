# Save fwd/rev mp4 and gif from video.

# Pipe output to txt file.
exec 2>&1

# Enter the first file's directory.
current_path=$(dirname "$1")
cd "$current_path"

# For every selected file, save mp4.
for f in "$@"
do
	filenameNoExt=${f%.*}
	/usr/local/bin/ffmpeg -i "$f" -vf reverse -af areverse -y "${filenameNoExt}_rev.mp4"
done

exit 0