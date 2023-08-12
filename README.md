## About

- **Distribution**: Arch Linux

- **WM**: bspwm

- **Compositor**: picom

- **Bar**: polybar

- **Launcher**: rofi

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
alias dots='/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME'
dots config --local status.showUntrackedFiles no
dots checkout
```
Next you need to change some system-related options:
```
sudo -i
mkdir -p /etc/systemd/logind.conf.d
mkdir -p /etc/X11/xorg.conf.d
```
- to ignore suspend when pressing laptop power key:
```
echo "[Login]
HandleSuspendKey=ignore
HandleHibernateKey=ignore
" > /etc/systemd/logind.conf.d/key-suspend-ignore.conf
```
- to set screen lock via xss-lock when closing laptop lid:
```
echo "[Login]
HandleLidSwitch=lock
HandleLidSwitchExternalPower=lock
" > /etc/systemd/logind.conf.d/lid-switch-lock.conf
```
- to setup keyboard:
```
echo "Section \"InputClass\"
        Identifier \"system-keyboard\"
        MatchIsKeyboard \"on\"
        Option \"XkbLayout\" \"us,ru\"
        Option \"XkbOptions\" \"grp:alt_shift_toggle\"
EndSection
" > /etc/X11/xorg.conf.d/00-keyboard.conf
```
- to setup touchpad:
```
echo "Section \"InputClass\"
       Identifier \"touchpad\"
       MatchDriver \"libinput\"
       MatchIsTouchpad \"on\"
       Option \"Tapping\" \"on\"
       Option \"NaturalScrolling\" \"true\"
       Option \"DisableWhileTyping\" \"false\"
       Option \"ScrollPixelDistance\" \"20\"
EndSection
" > /etc/X11/xorg.conf.d/02-touchpad.conf
```
- to disable dpms:
```
echo "Section \"Extensions\"
    Option \"DPMS\" \"false\"
EndSection

Section \"ServerFlags\"
    Option \"StandbyTime\" \"0\"
    Option \"SuspendTime\" \"0\"
    Option \"OffTime\" \"0\"
    Option \"BlankTime\" \"0\"
EndSection
" > /etc/X11/xorg.conf.d/90-no-dpms.conf
```

If your your Honor/Huawei laptop haves power-supply static noise at jack output, you can use this to reduce it:
```
mkdir -p /etc/modprobe.d
echo "options snd-hda-intel model=alc255-acer,dell-headset-multi
" > /etc/modprobe.d/alsa-base.conf
```
