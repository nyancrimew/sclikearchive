#!/bin/bash

# get array of SC_USERS and OUTPUT_DIR from env vars or .env file
if [[ "$SC_USERS" == "" ]]; then
  echo "no environment variables provided, reading configuration from $(pwd)/.env"
  source .env
fi

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