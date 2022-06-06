#! /bin/bash

codename=$(lsb_release -cs)
gpg_dir="/etc/apt/trusted.gpg.d"

# Install ZFS
echo "deb http://deb.debian.org/debian $codename-backports main contrib non-free"| tee -a /etc/apt/sources.list && apt update
apt install linux-headers-amd64
apt install -t bullseye-backports zfsutils-linux

# Install OMV
wget -O- https://packages.openmediavault.org/public/archive.key | gpg --dearmor  -o ${gpg_dir}/openmediavault.gpg
cat <<EOF >> /etc/apt/sources.list.d/openmediavault.list
deb https://packages.openmediavault.org/public shaitan main
# deb https://downloads.sourceforge.net/project/openmediavault/packages shaitan main
## Uncomment the following line to add software from the proposed repository.
# deb https://packages.openmediavault.org/public shaitan-proposed main
# deb https://downloads.sourceforge.net/project/openmediavault/packages shaitan-proposed main
## This software is not part of OpenMediaVault, but is offered by third-party
## developers as a service to OpenMediaVault users.
# deb https://packages.openmediavault.org/public shaitan partner
# deb https://downloads.sourceforge.net/project/openmediavault/packages shaitan partner
EOF
export LANG=C.UTF-8
export DEBIAN_FRONTEND=noninteractive
export APT_LISTCHANGES_FRONTEND=none
apt-get update
apt-get --yes --auto-remove --show-upgraded \
    --allow-downgrades --allow-change-held-packages \
    --no-install-recommends \
    --option DPkg::Options::="--force-confdef" \
    --option DPkg::Options::="--force-confold" \
    install openmediavault-keyring openmediavault

omv-confdbadm populate

# OMV extras (needed for zfs plugin)
wget -O - https://github.com/OpenMediaVault-Plugin-Developers/packages/raw/master/install | bash

# Plex
wget -O- https://downloads.plex.tv/plex-keys/PlexSign.key | gpg --dearmor  -o ${gpg_dir}/plex.gpg
echo "deb https://downloads.plex.tv/repo/deb public main" | tee /etc/apt/sources.list.d/plexmediaserver.list
apt update
apt install plexmediaserver

# Jellyfin
wget -O- https://repo.jellyfin.org/ubuntu/jellyfin_team.gpg.key | gpg --dearmor -o ${gpg_dir}/jellyfin.gpg
echo "deb [arch=$( dpkg --print-architecture )] https://repo.jellyfin.org/$( awk -F'=' '/^ID=/{ print $NF }' /etc/os-release ) $( awk -F'=' '/^VERSION_CODENAME=/{ print $NF }' /etc/os-release ) main" | sudo tee /etc/apt/sources.list.d/jellyfin.list
apt update
apt install jellyfin
