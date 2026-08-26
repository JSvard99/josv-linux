# JoSv Linux - *A personal Linux setup/configuration.*

## About
This is a personal Linux setup and configuration meant to automate installation on a new machine aswell as version control my configurations.

## Installation
1. Acquire a Linux Arch installation image and boot into it.

2. In the tty, connect to WiFi with the command `iwctl station wlan0 connect ROUTER_NAME`, where ROUTER_NAME is the name of your router.

3. Run the command `archinstall` and apply the following changes and install:

    Locales -> Keyboard layout -> --Your keyboard layout--
            -> Locale language -> --Your locale language--

    Mirrors and repositories -> Select regions -> --Your region--

    Disk configuration -> Partiotioning -> Use a best-effort deafult partition layout -> --Select your disk-- -> btrfs -> Yes -> Use compression

    Bootloader -> Bootloader -> Grub
               -> Unified kernel images -> No
               -> Plymoth -> Yes -> --Any choice--

    Hostname -> --Set your prefered hostname--

    Authentication -> Root password -> --Choose a root password--
                   -> User account  -> --Setup prefered users,atleast one user as sudo.-- -> Confirm and exit

    Profile -> Type -> Minimal

    Applications -> Bluetooth        -> Yes
                 -> Audio            -> pipewire
                 -> Power management -> power-profiles-daemon
                 -> Firewall         -> firewalld
                 -> Additional fonts -> --Select all noto fonts--

    Network configuration -> Use Network Manager (iwd backend)

    Additional packages -> git

    Timezone -> --Select your timezone--

4. Select `chroot into installation for post-installation configurations`
4. Login with your configured user, and connect to WiFi with the comman `iwctl station wlan0 connect ROUTER_NAME`.

5. Run the command `git clone https://github.com/JSvard99/josv-linux.git`

6. Run the command `./josv-linux/install.sh`

The installation will then take place and reboot into the configured system.

## Git workflow
Given the special nature of this project where work is done in small increments and rarely encompasses larger tasks, all work is done and pushed directly to master.

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
