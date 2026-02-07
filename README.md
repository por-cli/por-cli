# por-cli

A cli tool to watch Adult Content.

This tool is heavily inspired by [ani-cli](https://github.com/pystardust/ani-cli)
This tool scrapes the site [spankbang](https://spankbang.party), [xhamster](https://xhamster1.desi) and plays it on mpv.
This tool also allows to access the content if it is blocked in your region no external vpn is needed

## Installation
### Script Installation
run this one liner bash command to install por-cli (run this on termux if installing on android)
```bash
 curl -fsSL https://raw.githubusercontent.com/por-cli/por-cli/refs/heads/main/setup.sh | bash
```

### Manual Installation

#### For Linux and Mac

requirements:
* kitty
* mpv
* fzf
* ggrep (for mac only)

```bash
git clone https://github.com/por-cli/por-cli.git
cd por-cli
cp por-cli /usr/local/bin/
chmod +x /usr/local/bin/por-cli
```

#### For Android

requirements:
* termux
* sed
* mpv-android
* chafa
* fzf

```bash
git clone https://github.com/por-cli/por-cli.git
cd por-cli
cp por-cli /data/data/com.termux/files/usr/bin/
chmod +x /data/data/com.termux/files/usr/bin/por-cli
```


## Usage
```bash
por-cli [OPTIONS]
    Options:
        -r            Resume & pick from history
        -p            Use proxy
        -t            Play video in terminal
        -h, --help    Show this help menu
```

## Dependencies

* curl
* sed
* mpv
* fzf
* chafa 
* wget

## Patch for arm based Linux

if getting error like "unknown option: --with-shell=bash -c"

run this command

```bash
sudo sed -i 's/fzf --with-shell="bash -c"/fzf/g' /usr/local/bin/por-cli
```

this happens because fzf on arm doesnt have --with-shell option so we need to remove it 
