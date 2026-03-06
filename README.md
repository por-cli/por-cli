
 # por-cli
 
-A cli tool to watch Adult Content.
+`por-cli` is a terminal-based video search and playback helper inspired by [ani-cli](https://github.com/pystardust/ani-cli).
 
-This tool is heavily inspired by [ani-cli](https://github.com/pystardust/ani-cli)

-This tool scrapes the site [spankbang](https://spankbang.party), [xhamster](https://xhamster1.desi) and plays it on mpv.

-This tool also allows to access the content if it is blocked in your region no external vpn is needed
-It lets you:

- Search multiple providers from your terminal.

- Preview thumbnails inside `fzf`.

- Play streams directly with `mpv`.

- Keep and resume watch history.

- Optionally route requests through a proxy (`-p`) when needed.
+
## Features

- Interactive provider selection (`xhamster`, `spankbang`, `eporner`).
- Fuzzy video selection using `fzf`.
- Preview support:
  - Desktop: `kitty icat`
  - Termux: `chafa`
- Resume mode from history (`-r`).
- Optional proxy mode (`-p`).

## Requirements

### Common dependencies

- `bash`

- `curl`

- `sed`

- `wget`

- `fzf`

- `mpv`

### Platform-specific dependencies

- **Linux desktop:** `kitty`
- **Termux (Android):** `chafa`

> The installer checks required dependencies and exits with a list of anything missing.
 
 ## Installation
- Run this one liner bash command to install por-cli (run this on termux if installing on android)

Run:

 ```bash
 bash <(curl -fsSL https://raw.githubusercontent.com/por-cli/por-cli/refs/heads/main/setup.sh)
 ```
 
The script installs `por-cli` to:
+- `/usr/local/bin/por-cli` on desktop Linux
+- `/data/data/com.termux/files/usr/bin/por-cli` on Termux
+
 ## Usage
+
 ```bash
-por-cli [OPTIONS]
-    Options:
-        -r            Resume & pick from history
-        -p            use proxy
-        -h, --help    Show this help menu
por-cli [options]
 ```
 
## Dependencies
### Options


- `-r` Resume and pick from history.

- `-p` Use proxy for requests/playback.

- `-h` Show help.

### Examples

```bash

por-cli       # interactive search

por-cli -r    # resume from watch history

por-cli -p    # run with proxy enabled

por-cli -rp   # resume with proxy enabled

por-cli -h    # show help text
```

## History

Watch history is stored at:

```text
${XDG_STATE_HOME:-$HOME/.local/state}/por-cli/watch.history
```

The file is created automatically during setup (and used by `-r` mode).


## Notes


- Provider websites can change markup and may occasionally break scraping.
- Proxy quality depends on currently available endpoints.

- For best experience, use a recent version of `mpv` and `fzf`.

 
* curl

* sed

* mpv

* fzf

-* kitty (for linux)

-* chafa (for termux)

-* wget
