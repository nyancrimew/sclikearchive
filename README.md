# SoundCloud Like Archive

Simple bash script to archive all liked tracks of SoundCloud users, intended for use in a regular cron task.

## Dependencies

For this script to work yt-dlp and ffmpeg need to be installed.

## Configuration

Create a .env file in the directory the script is going to be run in.

```bash
# a bash array of all the users to archive likes for
SC_USERS=("user1" "user2" "user2")

# the output directory to download archived tracks to (optional, defaults to current directory)
OUTPUT_DIR="/var/sclikearchive"
```

Alternatively the configuration can be passed in via environment variables,
though setting the users bash array only works when calling the script *from* bash.

## Running

Now you can simply execute `sclikearchive.sh` in the same directory as the env file.