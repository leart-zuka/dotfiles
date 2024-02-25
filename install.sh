# Basic stuff first
sudo pacman -Syu
sudo pacman -S git firefox


# Set up paru

cd
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd
sudo rm -r paru/
cd


# Install all packages I need

package_list=("alacritty" "btop" "clang" "cmake" "cuda" "discord" "docker" "dolphin" "dunst" "feh" "file" "fish" "fisher" "fmt" "gcc" "gimp" "gnome" "go" "grim" "grub" "hunspell" "hyprland" "iwd" "lf" "lua" "mpd" "neovim" "networkmanager" "nodejs" "npm" "nvidia-dkms" "nvidia-utils" "obs-studio" "openal" "opencl-nvidia" "openssh" "pavucontrol" "pipewire" "pnpm" "python" "qt5" "qt5-wayland" "qt6" "qt6-wayland" "ripgrep" "rofi" "ruby" "rust" "sqlite" "swaylock" "swww" "texlive" "thunderbird" "tmux" "nerd-fonts" "unzip" "waybar" "wayland" "webcord" "wireplumber" "wl-clipboard" "wofi" "xdg-desktop-portal-hyprland" "zathura")
packages=""
for package in "${package_list[@]}"; do
    packages="${packages} ${package}"
done
paru -S $package_list


# Hyprland nvidia-stuff


## Grub stuff

string_to_add_grub="nvidia_drm.modeset=1"

grub_comfig="/etc/default/grub"

sudo sed -i "s/\(^GRUB_CMDLINE_LINUX_DEFAULT=.*\)\"$/\1 $string_to_add\"/" $grub_config

grub-mkconfig -o /boot/grub/grub.cfg


## Mkinitcpio.conf

string_to_add_mkinitcpio="nvidia nvidia_modeset nvidia_uvm nvidia_drm"

mkinitcpio_conf="/etc/mkinitcpio.conf"

sudo sed -i "/^MODULES=(/ s/)/ ${string_to_add_mkinitcpio})/" $mkinitcpio_conf

mkinitcpio --config /etc/mkinitcpio.conf --generate /boot/initramfs-custom.img


## Modprobe

file=/etc/modprobe.d/nvidia.conf
string_to_add_modprobe="options nvidia-drm modeset=1"
if test -f "$file"; then
    echo $string_to_add_modprobe >> $file
else
    sudo touch $file
    echo $string_to_add_modprobe >> $file
fi


# Config stuff
cd
git clone git@github.com:leart-zuka/dotfiles.git
cd dotfiles
cp -r ./ ~/.conf/


# Fish stuff
cd
curl https://pyenv.run | bash
set -Ux PYENV_ROOT $HOME/.pyenv
fish_add_path $PYENV_ROOT/bin
git clone https://github.com/pyenv/pyenv-virtualenv.git (pyenv root)/plugins/pyenv-virtualenv
chsh -s /usr/bin/fish
