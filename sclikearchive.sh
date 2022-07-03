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
  yt-dlp --add-metadata --embed-thumbnail --output "$OUTPUT_DIR/%(uploader)s/%(title)s.%(ext)s" "https://soundcloud.com/$user/likes"
done