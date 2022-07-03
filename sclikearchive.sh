#!/bin/bash

# get array of SC_USERS and OUTPUT_DIR from env file
# todo: support externally provided environment variables?
source .env

if [[ "$OUTPUT_DIR" == "" ]]; then
  echo "OUTPUT_DIR not set, defaulting to current directory"
  OUTPUT_DIR="$(pwd)"
fi

for user in ${SC_USERS[@]};
do
  echo "archiving likes for $user"
  yt-dlp --download-archive "$OUTPUT_DIR/downloaded.txt" -cwi  --add-metadata --embed-thumbnail --output "$OUTPUT_DIR/%(uploader)s/%(title)s.%(ext)s" "https://soundcloud.com/$user/likes"
done

# clean up stray thumbnails
echo "cleaning up stray thumbnails"
rm "$OUTPUT_DIR/*/*.jpg"