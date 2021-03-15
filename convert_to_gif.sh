# Save video file to gif.

# Pipe output to txt file.
exec 2>&1

# Enter the first file's directory.
current_path=$(dirname "$1")
cd "$current_path"

# For every selected file, save mp4.
for f in "$@"
do
	filenameNoExt=${f%.*}
	/usr/local/bin/ffmpeg -i "$f" -vf "fps=15,scale=600:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -loop 0 -y "$filenameNoExt.gif"

done

exit 0