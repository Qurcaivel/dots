## About

- **Distribution**: Arch Linux

- **Terminal**: alacritty

- **Shell**: zsh

- **Prompt**: starship.rs

## Installation

Since `master` branch is used to store README.md, you need to clone `home` branch to get dots:
```
git clone -b home git@github.com:Qurcaivel/dots.git $HOME/.dots
```
This repository is used as bare, so if you want the same behavior, use this option:
```
git clone -b home --bare git@github.com:Qurcaivel/dots.git $HOME/.dots
alias dot='/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME'
dot config --local status.showUntrackedFiles no
dot checkout
```

If your Honor/Huawei laptop haves power-supply static noise at jack output, you can use this to reduce it:
```
mkdir -p /etc/modprobe.d
echo "options snd-hda-intel model=alc255-acer,dell-headset-multi
" > /etc/modprobe.d/alsa-base.conf
```
