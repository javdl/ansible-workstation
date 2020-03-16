# ansible-workstation

## Install

    sudo apt-get install software-properties-common git
    sudo apt-add-repository ppa:ansible/ansible
    sudo apt-get update
    sudo apt-get install ansible

## Quick start

Run as sudo, we are changing the system.

    sudo ansible-pull -U https://github.com/Joostvanderlaan/ansible-workstation

Test on localhost

    sudo ansible-playbook local.yml

## Enable remote install on freshly installed machine

    sudo apt install openssh-server
    sudo ufw allow 22
    sudo systemctl enable ssh
    sudo systemctl start ssh
    
## TODO

global npm packages like:
lerna
firebase-tools
webpack webpack-cli

sudo apt install nfs-common

eslint

insync
pandoc
cryptomator
npm install -g linux-window-session-manager
sudo apt-get install chrome-gnome-shell
inkscape (illustrator)
darktable (lightroom)
Gimp(photoshop)
thefuck 
sudo apt install python3-dev python3-pip python3-setuptools
sudo pip3 install thefuck
sudo apt-get install exfat-fuse exfat-utils
digikam, rapid photo downloader

    # extra steps for flatpaks to work
sudo apt install gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak install flathub com.borgbase.Vorta # Vorta backup GUI borgbase

    apt install webp imagemagick
    npm i -g sqip

## Debs vs Snaps

So you want to know pros/cons of snap vs. apt for end users? Let me take a crack at a few (fair warning, I've worked on the snap project in the past, but hopefully that gives me a unique insight into its pros and cons and not just a biased view):

**Pros of debs over snaps:**

Smaller packages (debs don't need to bundle their dependencies).

Although it's worth pointing out that while snaps are larger, updates are done with deltas, not huge downloads

Better theme integration (this only matters for GUI apps).

Confinement issues don't typically get in your way.

Debs come from the distribution and are reviewed by numerous people, not just the publisher.

This completely ignores debs outside of the distro, such as PPAs or debs found online.

Debs can be updated on your schedule, either automatically or not. Snaps always update automatically, the most you can do is delay it. Snapped apps that typically run for a long time often don't handle having an upgrade happen underneath them very well. I don't mean daemons (those are restarted upon upgrade), I mean apps like Signal which aren't daemons but typically run for long enough that an update might happen while they're still running.

**Pros of snaps over debs:**

Dependencies are bundled, which means you can be sure that you're running exactly what the publisher tested and supports.

Similar to the last point, snaps are isolated, which means if you remove it, all of its data and dependencies are gone as well.

Snaps are confined, so you can be reasonably sure that even if you don't necessarily trust the snap publisher, it doesn't own your system.

There are caveats to this, of course. Some types of snaps aren't actually confined (although you need to install those in a special way, so you'll know), and other snaps use interfaces which are inherently insecure, such as X11.

Debs are typically frozen when an Ubuntu release is cut, and that deb typically won't see an update over the course of the Ubuntu release. Depending on the repo it might see security updates and maybe bugfixes, but that's the exception. However, snaps are outside of the distribution, and can be updated at any time, which means the snap could very well be much newer than the deb.

It's worth pointing out that there are PPAs which allow debs to be updated outside of the distribution as well, but these require putting your trust in a particular person rather than the maintainers of Ubuntu. If you install a deb, you're potentially handing your system over to whoever created it since it has hooks that run as root without any sense of confinement.

[Source](https://www.reddit.com/r/Ubuntu/comments/a364ii/proscons_of_snap_vs_apt/)
