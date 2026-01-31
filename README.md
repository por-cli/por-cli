# por-cli

A cli tool to watch Adult Content.

This tool is heavily inspired by [ani-cli](https://github.com/pystardust/ani-cli)
This tool scrapes the site [spankbang](https://spankbang.party), [xhamster](https://xhamster1.desi) and plays it on mpv.
This tool also allows to access the content if it is blocked in your region no external vpn is needed

## Installation
run this one liner bash command to install por-cli (run this on termux if installing on android)
```bash
bash <(curl -fsSL https://raw.githubusercontent.com/por-cli/por-cli/refs/heads/main/setup.sh)
```

## Usage
```bash
por-cli [OPTIONS]
    Options:
        -r            Resume & pick from history
        -p            use proxy
        -h, --help    Show this help menu
```

## Dependencies

* curl
* sed
* mpv
* fzf
* kitty (for linux)
* chafa (for termux)
* wget
