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
	/usr/local/bin/ffmpeg -i "$f" -filter_complex "[0:v]reverse,fifo[r];[0:v][r] concat=n=2:v=1 [v]" -map "[v]" -an -y "${filenameNoExt}_fwdrev.mp4"
	/usr/local/bin/ffmpeg -i "${filenameNoExt}_fwdrev.mp4" -vf "fps=15,scale=600:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -loop 0 -y "${filenameNoExt}_fwdrev.gif"
done

exit 0