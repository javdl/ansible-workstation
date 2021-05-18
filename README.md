# Ansible workstation

A Linux workstation setup that is automated and easily repeated on a new machine to get exactly all the developer tools, music players etc. etc. that I want.

## Install Ansible

### With Brew

    brew install ansible

#### Install Brew (Linuxbrew)

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
Don't forget to add to **PATH** using the commands you see after brew install has finished.
Also, `source ~/.profile` to make it work in your already-open terminal.

Recommended:
    
    sudo apt-get install build-essential
    brew install gcc

To make brew work for sudo as well, we need to add it to the profile for the sudo user too. Otherwise commands like `sudo ansible` will not work.

    sudo su
    test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
    test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
    test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
    echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile

### With APT

You can also install Ansible with APT (of course)

    sudo apt-get install software-properties-common git
    sudo apt-add-repository ppa:ansible/ansible
    sudo apt-get update
    sudo apt-get install ansible

## Quick start

Run as sudo, we are changing the system.

    sudo ansible-pull -U https://github.com/Joostvanderlaan/ansible-workstation

## Start

    git clone https://github.com/Joostvanderlaan/ansible-workstation

Install requirements

    sudo ansible-galaxy install -r requirements.yml

Test on localhost

    sudo ansible-playbook local.yml

## Create a role:

    ansible-galaxy init test-role-1

## Enable remote install on freshly installed machine

    sudo apt install openssh-server
    sudo ufw allow 22
    sudo systemctl enable ssh
    sudo systemctl start ssh

## Test new tasks quickly

    sudo ansible-playbook local.yml --tags "new" 

    or 

    sudo ansible-playbook local.yml --skip-tags "packages"

## 6 months later, restore machine to original state

    ansible-playbook -K ~/post_install.yml

## TODO

gcloud sdk moet weg uit snap. geeft login problemen bij vs code plugins. beter direct van apt:
https://cloud.google.com/sdk/docs/downloads-apt-get

GNOME font settings

https://github.com/PeterMosmans/ansible-role-customize-gnome

gcloud init

https://extensions.gnome.org/extension/906/sound-output-device-chooser/

OBS open broadcaster https://obsproject.com/wiki/install-instructions#linux
    
## Optional steps

Install dotfiles https://gitlab.com/joostl/dotfiles (private)

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

## Resources

[Part 1](https://opensource.com/article/18/3/manage-workstation-ansible)
https://opensource.com/article/18/3/manage-your-workstation-configuration-ansible-part-2
https://opensource.com/article/18/5/manage-your-workstation-ansible-part-3
