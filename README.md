# i3-dotfiles-freebsd

Personal FreeBSD i3wm setup, dotfiles and post-install scripts.

Repository: https://github.com/apapamarkou/i3-dotfiles-freebsd

## Features

- i3 window manager
- top bar
- application launcher
- emoji picker
- wallpaper utility
- neovim full IDE setup 
- terminal emulator with autosuggestions and ai assistant
- loopback audio pacthbay (PipeWire / WirePlumber / qpwgraph)
- weather application
- disk usage/cleaner
- system configuration
- calendar
- firefox browser
- VS Code IDE
- screenshots and screen recording
- tui file manager (nnn)
- standard text editors (micro nvim vi)
- video editing (kdenlive)
- image editing software (krita and gimp)
- DAW Music production software (Ardour)
- pdf view and edit (okular)
- image quick viewer (feh)
- windows apps install and run
- full offlce suite


---

# License

This project is licensed under the GNU General Public License (GPL).

---

# Installation

Install freebsd and include `ports`.

## 1. Login as root

Install git:

```sh
pkg update
pkg install git
````

---

## 2. Clone repository

Clone into `/home` so all users can access it:

```sh
cd /home
git clone https://github.com/apapamarkou/i3-dotfiles-freebsd.git
```

---

## 3. Fix permissions if needed

```sh
chmod -R a+rX /home/i3-dotfiles-freebsd
```

---

## 4. Run root setup

```sh
cd /home/i3-dotfiles-freebsd
sh root-setup.sh
```

The script will ask for the target username.

---

## 5. Reboot

```sh
reboot
```

---

## 6. Login as your normal user

Run user setup:

```sh
cd /home/i3-dotfiles-freebsd
sh user-setup.sh
```

---

## 7. Reboot again

```sh
reboot
```

---

## 8. Start i3

Login as your user and run:

```sh
startx
```

---

# Notes

* Tested on FreeBSD 15
* Uses `.xinitrc` with `startx`
* Shell is configured to use `zsh`
* PipeWire and WirePlumber are enabled automatically

---

# Repository Structure

```text
.
├── root-setup.sh
├── user-setup.sh
├── .config
├── .zshrc
├── .profile
├── post-install-scripts
└── doc
```


