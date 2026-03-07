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

### macOS Dependencies

Install dependencies with Homebrew:

```bash
brew install curl wget fzf mpv chafa
```

> The installer checks required dependencies and exits with a list of anything missing.

---

## Installation

### Automatic Installation

Run:

```bash
curl -fsSL https://raw.githubusercontent.com/por-cli/por-cli/refs/heads/main/setup.sh | bash
```

The script installs `por-cli` to:

- `/usr/local/bin/por-cli` on desktop Linux
- `/data/data/com.termux/files/usr/bin/por-cli` on Termux

---

### Manual Installation

Clone the repository:

```bash
git clone https://github.com/por-cli/por-cli.git
cd por-cli
```

Make the script executable:

```bash
chmod +x por-cli
```

Move it to a directory in your PATH:

```bash
sudo mv por-cli /usr/local/bin/
```

Verify installation:

```bash
por-cli -h
```

---

## Usage

```bash
por-cli [options]
```

---

## Options

- `-r` Resume and pick from history
- `-p` Use proxy for requests/playback
- `-d` Download selected video
- `-h` Show help menu

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