# por-cli

`por-cli` is a terminal-based video search and playback helper inspired by [ani-cli](https://github.com/pystardust/ani-cli).

This tool scrapes the sites [spankbang](https://spankbang.party) and [xhamster](https://xhamster1.desi) and plays videos directly using `mpv`.

It also allows access to content even if it is blocked in your region (no external VPN required).

It lets you:

- Search multiple providers from your terminal
- Preview thumbnails inside `fzf`
- Play streams directly with `mpv`
- Download videos
- Keep and resume watch history
- Optionally route requests through a proxy (`-p`)

---

## Features

- Interactive provider selection (`xhamster`, `spankbang`, `eporner`)
- Fuzzy video selection using `fzf`
- Thumbnail preview using `chafa`
- Resume playback from history (`-r`)
- Optional proxy mode (`-p`)
- Download videos

---

## Requirements

### Common Dependencies

- `bash`
- `curl`
- `sed`
- `wget`
- `fzf`
- `mpv`
- `chafa`
- `yt-dlp`

### macOS Dependencies

Install dependencies with Homebrew:

```bash
brew install curl wget fzf mpv chafa ggrep coreutils
```

> The installer checks required dependencies and exits with a list of anything missing.

---

## Installation

### Script Installation

Run this command:

```bash
curl -fsSL https://raw.githubusercontent.com/por-cli/por-cli/refs/heads/main/setup.sh | bash
```

---

### Manual Installation

#### Linux and macOS

Requirements:

- mpv
- fzf
- chafa
- ggrep (macOS only)
- coreutils (macOS only)
- yt-dlp (for downloading videos)

```bash
git clone https://github.com/por-cli/por-cli.git
cd por-cli
cp por-cli /usr/local/bin/
chmod +x /usr/local/bin/por-cli
```

#### Android (Termux)

Requirements:

- termux
- sed
- mpv-android
- chafa
- fzf
- yt-dlp (for downloading videos)

```bash
git clone https://github.com/por-cli/por-cli.git
cd por-cli
cp por-cli /data/data/com.termux/files/usr/bin/
chmod +x /data/data/com.termux/files/usr/bin/por-cli
```

---

## Usage

```bash
por-cli [OPTIONS]
```

### Options

- `-r` Resume & pick from history
- `-p` Use proxy
- `-d` Download video
- `-h`, `--help` Show help menu

---

## Examples

```bash
por-cli       # interactive search
por-cli -r    # resume from watch history
por-cli -p    # run with proxy enabled
por-cli -rp   # resume with proxy enabled
por-cli -d    # download video
por-cli -h    # show help text
```

---

## History

Watch history is stored at:

```
${XDG_STATE_HOME:-$HOME/.local/state}/por-cli/watch.history
```

The file is created automatically during setup and used by `-r` mode.

---

## Notes

- Provider websites may change markup and occasionally break scraping.
- Proxy quality depends on currently available endpoints.
- For best experience use recent versions of `mpv`, `fzf`, and `chafa`.

---

## Patch for ARM based Linux

If you get an error like:

```
unknown option: --with-shell=bash -c
```

Run:

```bash
sudo sed -i 's/fzf --with-shell="bash -c"/fzf/g' /usr/local/bin/por-cli
```

This happens because some ARM builds of `fzf` do not support the `--with-shell` option.

