# Renumber selected files, starting at 1

# Pipe output to txt file.
exec 2>&1

# Enter the first file's directory.
current_path=$(dirname "$1")
cd "$current_path"

REORDER=1

# Get the filename and extension.
filenameNoExt=${1%[0-9].*}
extension=${1##*.}

sortedInputs=( $(sort <(printf "%s\n" "$@")) )

# For every selected file, renumber.
for f in $sortedInputs
do
    DEST="$filenameNoExt-$REORDER.$extension"
        if [ "$DEST" != "$f" ]
        then
            mv "$f" "$DEST"
        fi
    ((REORDER++))
done