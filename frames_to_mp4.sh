# Save sequentially numbered image frames video file to mp4.

# Pipe output to txt file.
exec 2>&1

# Enter the first file's directory.
current_path=$(dirname "$1")
cd "$current_path"

# Get the filename and extension.
filenameNoExt=${1%[0-9].*}
extension=${1##*.}

# Save frames to mp4.
/usr/local/bin/ffmpeg -i "$filenameNoExt%d.$extension" -r 30 -vf "crop=trunc(iw/2)*2:trunc(ih/2)*2" -c:v libx264 -preset slow -crf 22 -pix_fmt yuv420p -an -y "$filenameNoExt.mp4"


exit 0