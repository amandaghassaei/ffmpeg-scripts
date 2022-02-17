# Loop video twice.

# Pipe output to txt file.
exec 2>&1

# Enter the first file's directory.
current_path=$(dirname "$1")
cd "$current_path"

# For every selected file, save mp4.
for f in "$@"
do
	filenameNoExt=${f%.*}
	/usr/local/bin/ffmpeg -stream_loop 1 -i "$f" -c copy -y "$filenameNoExt-loop2X.mp4"
done

exit 0