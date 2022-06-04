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
