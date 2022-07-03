# SoundCloud Like Archive

Simple bash script to archive all liked tracks of SoundCloud users, intended for use in a regular cron task.

## Configuration

Create a .env file in the directory the script is going to be run in.

```bash
# a bash array of all the users to archive likes for
SC_USERS=("user1" "user2" "user2")

# the output directory to download archived tracks to (optional, defaults to current directory)
OUTPUT_DIR="/var/sclikearchive"
```

## Running

Now you can simply execute `sclikearchive.sh` in the same directory as the env file.