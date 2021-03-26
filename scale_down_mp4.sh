# Save small (no audio) video file to mp4.

# Pipe output to txt file.
exec 2>&1

# Enter the first file's directory.
current_path=$(dirname "$1")
cd "$current_path"

# For every selected file, save mp4.
for f in "$@"
do
	filenameNoExt=${f%.*}
	# https://www.reddit.com/r/ffmpeg/comments/i4nzxr/rounding_down_by_1px_when_width_is_not_divisible/
	/usr/local/bin/ffmpeg -i "$f" -vf scale=800:-2 -c:v libx264 -preset slow -crf 22 -pix_fmt yuv420p -an -y "$filenameNoExt-small.mp4"
done

exit 0