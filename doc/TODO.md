# Post Install nanootes

## Software Install Uninstall

```bash
sudo dnf remove firefox azote anaconda-install-env-deps anaconda-live anacoda dmenu volumeicon
```

## Screen Resolution and Numlock fix

### Fix resolution in TTY
Edit grub configuration file
```bash
sudo nano /etc/default/grub
```
Add
```content
GRUB_CMDLINE_LINUX="rhgb quiet video=1920x1080"
```

Update grub with
```bash
sudo grub2-mkconfig -o /boot/grub2/grub.cfg
```

### Fix display resolution in lightdm
Make a script for that
```bash
sudo nano /usr/local/bin/lightdm-display-setup.sh
```
With contents
```content
#!/bin/sh
xrandr --output Virtual-1 --mode 1920x1080
```
Make it executable
```bash
sudo chmod +x /usr/local/bin/lightdm-display-setup.sh
```


### Add Num Lock on in light dm 
Make a script for that
```bash
sudo nano /usr/local/bin/lightdm-greeter-setup.sh
```
with contents:
```content
#!/bin/sh
/usr/bin/numlockx on
```
Make it executable
```bash
sudo chmod +x /usr/local/bin/lightdm-greeter-setup.sh
```

Apply them to `lightdm.conf`
```bash
sudo nano /etc/lightdm/lightdm.conf
```

change the lines in [Seat:*] section
```
display-setup-script=/usr/local/bin/lightdm-display-setup.sh
greeter-setup-script=/usr/local/bin/lightdm-greeter-setup.sh
```

for Early TTY enable numlock run
```bash
sudo grubby --update-kernel=ALL --args="numlock=on"
```


gsettings get org.gnome.desktop.interface gtk-theme

## Fix Enable Audio in kvirt
Virt (I)->
Overview-> XML Edit change audio tag to:
```
<audio id='1' type='spice'/>
```
## Change shell
```bash
chsh -s /usr/bin/zsh
```


## Setup pass
### Install
```bash
sudo dnf install pass gnupg2 qrencode pinentry-curses pinentry-qt
```
edit 
```bash
micro ~/.gnupg/gpg-agent.conf
```
new file with
```content
allow-loopback-pinentry
default-cache-ttl 600
max-cache-ttl 7200
pinentry-program /usr/bin/pinentry-qt
```
### Create GPG key if not exist
```
gpg --list-secret-keys --keyid-format=long
gpg --full-generate-key
```
Options
- 1 
- 4096 
- 0

### View key ids
```
gpg --list-secret-keys
```
You see something like 
```
sec   rsa4096 2026-03-26 [SC]
      648241D3F622190007CB83886E076222DCA05296
```
### Initialize pass
```
pass init 648241D3F622190007CB83886E076222DCA05296
```

### Export keys

```
gpg --list-secret-keys --keyid-format=long
ssb   <key>/<keyId> 2026-03-26 [E]
```

```
gpg --export-secret-keys <keyId> > private.key
gpg --export <keyId> public.key
```

### Restore old keys
```bash
gpg --import public.key
gpg --import private.key 
pass init "Key-ID"
git clone  https://github.com/<user name>/sec ~/.password-store
```


### Install proprietary ffmpeg
```
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf update
sudo dnf swap ffmpeg-free ffmpeg --allowerasing
sudo dnf install x264 x264-libs
```

### Install grub btrfs
```bash
sudo dnf install git make
sudo ln -s /boot/grub2 /boot/grub
git clone https://github.com/Antynea/grub-btrfs.git
cd grub-btrfs
sudo make install
sudo systemctl enable grub-btrfsd
```

# GIT using ssh
## Setup
```
ssh-keygen -t ed25519 -C "papamarkoua@gmail.com"
```
[Enter] in all questions
```
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```
Get the public key
```
cat ~/.ssh/id_ed25519.pub
```
Add to GitHub (Settings → SSH keys)

## Usage
Clone with SSH (όχι HTTPS)
```
git clone git@github.com:username/repo.git
```
## Basic workflow
```
cd repo
git add .
git commit -m "Updates"
git push
```
