# 🎵 Tunes — Terminal Music Player (v2.2)
```
╔══════════════════════════════════════════╗
║        🎵  T E R M I N A L  T U N E S    ║
║           Your CLI Music Buddy           ║
╚══════════════════════════════════════════╝
```

> Your personal terminal DJ — play Lofi, Chill, or custom YouTube playlists directly from your Linux terminal.  
> Fully customizable, saves your favorite vibes, and even fixes itself when tools are missing!  

---

## ✨ Features
- 🎶 Play Lofi / Chill / Ambient music while coding  
- 🧠 Add or remove your own playlists anytime  
- 💾 Stores playlists in `~/.tunes_playlists`  
- 🧩 Auto-installs `yt-dlp` if missing  
- 🎨 Clean, colorful TUI menu  
- 🔁 Uses a stable, format-safe playback system  

---

## ⚙️ Installation

```bash
git clone https://github.com/thelinuxpoint/tunes.git
cd tunes
chmod +x tunes.sh
sudo cp tunes.sh /usr/local/bin/tunes
```

---

## 🚀 Usage

Simply run:
```bash
tunes
```

### Menu Options
```
1) 🎧 Play Music
2) ➕ Add Playlist
3) 🗑️  Remove Playlist
4) 📜 View Playlists
5) 🚪 Exit
```

---

## 🧩 Requirements
- **mpv** → media player backend  
  ```bash
  sudo apt install mpv -y
  ```
- **yt-dlp** → (auto-installs if missing)  
  or install manually:
  ```bash
  sudo wget https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -O /usr/local/bin/yt-dlp
  sudo chmod +x /usr/local/bin/yt-dlp
  ```
- Internet connection 🌐  

---

## 🧠 Playlist Storage

Your playlists are stored here:
```
~/.tunes_playlists
```

Format:
```
Playlist Name|https://youtube.com/playlist_or_video
```

Example:
```
Lofi Beats|https://www.youtube.com/watch?v=jfKfPfyJRdk
Coding Chill|https://www.youtube.com/watch?v=2OEL4P1Rz04
```

---

## 🧪 Playback Engine
Uses:
```
mpv --no-video --ytdl-format="bestaudio[ext=m4a]/bestaudio/best"
```
✅ Always picks the best available audio format  
✅ Automatically retries with a fallback if one fails  

---

## 📸 Showcase
```
╔════════════════════════════════════╗
║        🎵  Terminal Tunes          ║
╚════════════════════════════════════╝
Choose an option:
  1) 🎧 Play Music
  2) ➕ Add Playlist
  3) 🗑️  Remove Playlist
  4) 📜 View Playlists
  5) 🚪 Exit

Select (1-5): 1
🎧 Now playing: Lofi Beats
Press Ctrl+C to stop.
```

---

## 🧑‍💻 Author
**Prakash Choudhary** — [@TheLinuxPoint](https://github.com/thelinuxpoint)  
📺 YouTube: [The Linux Point](https://youtube.com/@thelinuxpoint)  
📷 Instagram: [@thelinuxpoint](https://instagram.com/thelinuxpoint)

---

⭐ **If you love coding with music, drop a star!**  
Let’s make terminals musical again 🎶



