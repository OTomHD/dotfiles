# Arch specific setup

# Install from package
* Make sure yay is installed
```bash
  sudo pacman -S --needed git base-devel
  git clone https://aur.archlinux.org/yay-bin.git
  echo Installing Yay
  cd yay-bin
  makepkg -sir
  echo Removing Build Files
  cd ..
  rm -rf yay-bin
```

* Enable the 32-bit repos add below into /etc/pacman.conf
```
[multilib]
Include = /etc/pacman.d/mirrorlist
```

* Install package list files with the below
``` bash
yay -S - < [PkgListFile]
```
