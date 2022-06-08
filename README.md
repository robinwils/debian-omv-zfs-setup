Custom research on OMV on standalone Debian with ZFS

# Strategies

## RAIDz Pool

- Equivalent to RAID5/6
- Parity
- Fault tolerance
- Slow resilvering
- Good storage efficiency

## Mirror Pool

Kind of like RAID10 (mirror + stripe) but as said in some links below the default pool strategy
is not quite like striping

- Fast resilvering
- No parity, apprently makes some stuff faster (TODO:describe when more is known)
- Less storage efficiency (1/n resulting storage with n being the number of disks in the vdev)

## Probable setup
- Debian stable with zfsutils
- ZFS Pool with 2 disks (WD Red Pro of 4/6TB) mirror vdevs, 2 vdevs in total (4 disks => 8TB of storage with 4TB disks)
  - 1 dataset per user
  - 1 dataset for jellyfin ?
- openmediavault as a "pure" service (no docker)
- jellyfin as a "pure" service (no docker)
- nextcloud integration ?
- encryption ? see Encryption section for more
- backup TBD

## Encryption
ZFS native encryption will be slow on i7 920 because of missing encryption acceleration.
We would need to use LUKS with dm-crypt:
- First https://wiki.archlinux.org/title/dm-crypt/Encrypting_an_entire_system#LUKS_on_a_partition
- Then https://wiki.archlinux.org/title/ZFS#Encryption_in_ZFS_using_dm-crypt

## Backup
TODO

# Links

- https://arstechnica.com/information-technology/2020/05/zfs-101-understanding-zfs-storage-and-performance/
- https://jrs-s.net/2015/02/06/zfs-you-should-use-mirror-vdevs-not-raidz/
- https://wiki.debian.org/ZFS
- https://openzfs.github.io/openzfs-docs/Getting%20Started/index.html
- https://openmediavault.readthedocs.io/en/latest/installation/on_debian.html
- https://www.truenas.com/community/threads/some-differences-between-raidz-and-mirrors-and-why-we-use-mirrors-for-block-storage.44068/
- https://arstechnica.com/gadgets/2021/06/raidz-expansion-code-lands-in-openzfs-master
- https://docs.freebsd.org/en/books/handbook/zfs/
- http://breden.org.uk/2008/03/02/a-home-fileserver-using-zfs/
- https://www.golinuxcloud.com/install-plex-media-server-debian-11/
- https://stackoverflow.com/questions/68992799/warning-apt-key-is-deprecated-manage-keyring-files-in-trusted-gpg-d-instead
