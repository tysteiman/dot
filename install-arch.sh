# install base-devel needed to run makepkg
sudo pacman -S base-devel

# install yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# go back to dot root and remove tmp yay dir
cd ..
rm -rf yay

# INSTALL BASE PACKAGES NEEDED (Defaults to my bspwm setup for work...)
yay -S nvim                   \
    stow                      \
    chromium                  \
    xorg                      \
    picom                     \
    xorg-xinit                \
    bspwm                     \
    sxhkd                     \
    docker                    \
    docker-compose            \
    aws-cli                   \
    htop                      \
    rofi                      \
    pavucontrol               \
    pulseaudio                \
    xclip                     \
    nerd-fonts-meta           \
    kitty                     \
    pcmanfm                   \
    dunst                     \
    libnotify                 \
    feh                       \
    polybar                   \
    ripgrep                   \
    openssh                   \
    slack-desktop             \
    flameshot

# make config directory if it doesnt exist
CONF=~/.config
if [ ! -d $CONF ]; then mkdir $CONF; fi

# move bashrc around if it exists
if [ -f ~/.bashrc ]; then mv ~/.bashrc ~/.bashrc.original; fi

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# run stow!
stow -v .

# launch emacs daemon to install all packages
# emacs --daemon
