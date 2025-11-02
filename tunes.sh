#!/bin/bash
#==============================================#
#     tunes.sh — Terminal Music Player 🎶       #
#   Author: Prakash Choudhary (TheLinuxPoint)  #
#   GitHub: https://github.com/thelinuxpoint   #
#==============================================#

CONFIG_FILE="$HOME/.tunes_playlists"

# Colors
GREEN="\e[32m"
RED="\e[31m"
YELLOW="\e[33m"
BLUE="\e[34m"
RESET="\e[0m"

# Create config file with defaults if not present
if [ ! -f "$CONFIG_FILE" ]; then
  cat <<EOF > "$CONFIG_FILE"
Lofi Beats|https://www.youtube.com/watch?v=jfKfPfyJRdk
Coding Chill|https://www.youtube.com/watch?v=2OEL4P1Rz04
Cyber Chill|https://www.youtube.com/watch?v=FxEPM4XlJ-0
Rain Ambience|https://www.youtube.com/watch?v=HMnrl0tmd3k
EOF
fi

# Function to display playlists
list_playlists() {
  echo -e "${YELLOW}\nAvailable Playlists:${RESET}"
  awk -F'|' '{printf "  %d) %s\n", NR, $1}' "$CONFIG_FILE"
}

# Function to play a playlist
play_playlist() {
  list_playlists
  echo -ne "\n${YELLOW}Select playlist number: ${RESET}"
  read choice
  URL=$(awk -F'|' "NR==$choice {print \$2}" "$CONFIG_FILE")
  NAME=$(awk -F'|' "NR==$choice {print \$1}" "$CONFIG_FILE")

  if [ -z "$URL" ]; then
    echo -e "${RED}Invalid choice!${RESET}"
    exit 1
  fi

  if ! command -v mpv >/dev/null 2>&1; then
    echo -e "${RED}mpv not installed.${RESET}"
    echo "Install it with: sudo apt install mpv"
    exit 1
  fi

  echo -e "\n${GREEN}🎧 Now playing: $NAME${RESET}"
  echo -e "${BLUE}Press Ctrl+C to stop.${RESET}\n"
  mpv --no-video --ytdl-format="bestaudio[ext=m4a]/bestaudio/best" "$URL"
}

# Function to add a playlist
add_playlist() {
  echo -ne "${YELLOW}Enter playlist name: ${RESET}"
  read name
  echo -ne "${YELLOW}Enter playlist URL: ${RESET}"
  read url

  if [[ -z "$name" || -z "$url" ]]; then
    echo -e "${RED}Both name and URL are required.${RESET}"
    return
  fi

  echo "$name|$url" >> "$CONFIG_FILE"
  echo -e "${GREEN}✅ Playlist added successfully!${RESET}"
}

# Function to delete a playlist
delete_playlist() {
  list_playlists
  echo -ne "\n${YELLOW}Enter number to delete: ${RESET}"
  read del
  if [[ ! "$del" =~ ^[0-9]+$ ]]; then
    echo -e "${RED}Invalid input.${RESET}"
    return
  fi
  sed -i "${del}d" "$CONFIG_FILE"
  echo -e "${GREEN}🗑️ Playlist removed.${RESET}"
}

# Menu
echo -e "${BLUE}"
echo "╔════════════════════════════════════╗"
echo "║        🎵  Terminal Tunes          ║"
echo "╚════════════════════════════════════╝"
echo -e "${RESET}"

while true; do
  echo -e "\n${YELLOW}Choose an option:${RESET}"
  echo "  1) 🎧 Play Music"
  echo "  2) ➕ Add Playlist"
  echo "  3) 🗑️  Remove Playlist"
  echo "  4) 📜 View Playlists"
  echo "  5) 🚪 Exit"

  echo -ne "${YELLOW}\nSelect (1-5): ${RESET}"
  read option

  case $option in
    1) play_playlist ;;
    2) add_playlist ;;
    3) delete_playlist ;;
    4) list_playlists ;;
    5) echo -e "${GREEN}Goodbye!${RESET}"; exit 0 ;;
    *) echo -e "${RED}Invalid option.${RESET}" ;;
  esac
done
