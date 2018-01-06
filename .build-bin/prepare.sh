#!/usr/bin/env bash
SCRIPT_DIR=$( dirname $( readlink -e $0 ) )
source "$SCRIPT_DIR/../.build-lib/ci-library.sh"

# prepare the build environment
_log command "Setting up locale.conf..."
_do touch "/etc/locale.conf"
_do sh -c "echo 'LANG=C' >> '/etc/locale.conf'"
_do sh -c "echo 'LC_MESSAGES=C' >> '/etc/locale.conf'"

# create a local makepkg settings
_log command "Setting up makepkg.conf..."
echo "source /etc/makepkg.conf

#-- Make Flags: change this for DistCC/SMP systems
MAKEFLAGS=\"-j$(($(nproc)+1))\"

#-- Packager: name/email of the person or organization building packages
PACKAGER=\"$GITLAB_USER_ID <$GITLAB_USER_EMAIL>\"" > /home/builder/makepkg.conf

# patch current makepkg with chakra custom mods
_log command "Patching makepkg..."
_do wget https://code.chakralinux.org/tools/chakrabuildsystem/raw/master/chakra/bin/makepkg
_do cp makepkg /usr/bin/makepkg

# determine the the repository where we should build against (stable|testing|staging)
repo_name=$(get_repository)
_log command "Enabling [$repo_name] pacman.conf..."
_do wget "https://code.chakralinux.org/tools/chakrabuildsystem/raw/master/conf/$repo_name.conf"
_do cp $repo_name.conf /etc/pacman.conf

# resync database and update with latest changes
_do pacman -Syyu  --noconfirm
