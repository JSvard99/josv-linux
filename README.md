# JoSv Linux
## *A personal Linux setup/configuration.*

## About
This is a personal Linux setup and configuration meant to automate installation on a new machine aswell as version control my configurations.

## Installation
1. Acquire a Linux Arch installation image and boot into it.

2. In the tty, connect to WiFi with the command `iwctl station wlan0 connect ROUTER_NAME` where ROUTER_NAME is the name of your router.

3. Run the command `archinstall` and apply the following choices in the guided installer and reboot. 

        Hostname                        : **WHATEVER**
        Kernels                         : linux
        Automatic Time Sync (NTP)       : Yes
        Timezone                        : **TIMEZONE**
        Additional Packages             : git
        Pacman                          : Color enabled
        Mirrors and Repositories        : **REGION**
        Bootloader                      : Grub
                                          Removable
                                          Plymouth **Whatever**
        Disk Configuration              : **Default layout for a clean wipe. Otherwise read into dual booting from the resources below.*
        Swap                            : Zram enabled
                                          Zram algorithm zstd
        Authentication                  : Root password set
                                          Configured **At least 1** user(s)
        Locales                         : Keyboard layout **Keyboard layout**
                                          Locale language "en_US.UTF-8"
                                          Locale encoding "UTF-8"
                                          Console font "default8x16"
        Profile                         : Minimal
        Network                         : Use Network Manager (iwd backend)
        Application                     : Bluetooth enabled
                                          Audio server "pipewire"
                                          Power management "power-profiles-daemon"
                                          Firewall "firewalld"
                                          Extra fonts "noto-fonts, noto-fonts-emoji"

*NOTE: Text surrounded with ** are comments.*

4. Login with your configured user, and connect to WiFi with the comman `iwctl station wlan0 connect ROUTER_NAME`.

5. Run the command `git clone https://github.com/JSvard99/josv-linux.git`

6. Run the command `./josv-linux/install.sh`

The installation will then take place and reboot into the configured system.

## Git workflow
This is fairly special project in that it mainly consists of small fixes and updates. Therefore, most of the work is done and then pushed directly to the master branch. However, for larger tasks the feature branch workflow may still be prefered. 

In this case, every branch should have one of the following prefixes

- feature/
    Any work that adds something new to the project/codebase.

- fix/
    Any work that aims to fix something broken in the project/codebase.

- refactor/
    Any work that aims to refactor something to the project /codebase without adding any new features. 

Example branch names could be feature/neovim-setup or refactor/hyprland-seperate-configs. When the work for the task is done on the branch create a pull request and after review merge into master.

## Resources
Some useful reading in the making this project.

- [Arch Wiki - Installation Guide](https://wiki.archlinux.org/title/Installation_guide)
- [Arch Wiki - Dual boot with Windows](https://wiki.archlinux.org/title/Dual_boot_with_Windows)
- [Arch Wiki - Laptop](https://wiki.archlinux.org/title/Laptop)
- [Arch Wiki - General recommendations](https://wiki.archlinux.org/title/General_recommendations) 
- [Hyprland Wiki - Installation](https://wiki.hypr.land/Getting-Started/Installation/)
- [Hyprland Wiki - Master Tutorial](https://wiki.hypr.land/Getting-Started/Master-Tutorial/)
- [Hyprland Wiki - Systemd start](https://wiki.hypr.land/Useful-Utilities/Systemd-start/)
- [Noctalia Docs - Hyprland](https://docs.noctalia.dev/noctalia/compositor-settings/hyprland/)
