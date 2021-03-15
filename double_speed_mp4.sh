# Chenge video speed (no audio).

# Pipe output to txt file.
exec 2>&1

# Enter the first file's directory.
current_path=$(dirname "$1")
cd "$current_path"

# For every selected file, save mp4.
for f in "$@"
do
	filenameNoExt=${f%.*}
	/usr/local/bin/ffmpeg -i "$f" -filter_complex "[0:v]setpts=0.5*PTS[v]" -map "[v]" -y "${filenameNoExt}_2X.mp4"
done

exit 0