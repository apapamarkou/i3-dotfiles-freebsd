# Handling Disks and Partitions in Unix Systems

Disk and partition management is a core part of Linux administration. It involves identifying storage devices, creating partitions, formatting filesystems, and mounting them so the system can use them.

---

## 1. Understanding Disks and Partitions

### Disk

A **disk** is a physical or virtual storage device (HDD, SSD, NVMe).

Examples:

* `/dev/sda` → first SATA disk
* `/dev/nvme0n1` → NVMe disk

---

### Partition

A **partition** is a logical section of a disk.

Examples:

* `/dev/sda1` → first partition on disk
* `/dev/sda2` → second partition

---

## 2. Viewing Disks and Partitions

### List block devices

* `lsblk` → show disk structure (recommended)

```bash id="a1k9bb"
lsblk
```

---

### Detailed disk info

* `fdisk -l` → list all disks and partitions (requires root)

```bash id="f9p2cc"
sudo fdisk -l
```

---

### Filesystem usage

* `df -h` → show mounted partitions and usage

```bash id="d7m3ee"
df -h
```

---

## 3. Partitioning Tools

### fdisk (traditional)

Used for MBR/GPT partitioning.

```bash id="p3n8ff"
sudo fdisk /dev/sda
```

Inside `fdisk`:

* `m` → help menu
* `p` → print partitions
* `n` → new partition
* `d` → delete partition
* `w` → write changes
* `q` → quit

⚠️ Changes are only applied when you press `w`.

---

### parted (modern tool)

Better for GPT disks.

```bash id="k4v1gg"
sudo parted /dev/sda
```

Example:

```bash id="q2x9hh"
(parted) mkpart primary ext4 0% 100%
```

---

## 4. Formatting Partitions

After creating a partition, you must format it.

### Common filesystems:

* `ext4` → Linux standard
* `xfs` → high-performance (Fedora default)
* `vfat` → USB drives (Windows compatible)

### Format command:

```bash id="m6c2jj"
sudo mkfs.ext4 /dev/sda1
```

Or:

```bash id="x9p3kk"
sudo mkfs.xfs /dev/sda1
```

---

## 5. Mounting Partitions

Linux does not use drive letters. You must **mount** partitions into directories.

### Mount manually:

```bash id="t8n4ll"
sudo mount /dev/sda1 /mnt
```

### Unmount:

```bash id="u3b7mm"
sudo umount /mnt
```

---

### Check mounts:

```bash id="c2v9nn"
mount
```

or:

```bash id="z7q1oo"
findmnt
```

---

## 6. Persistent Mounts (/etc/fstab)

To auto-mount at boot, edit `/etc/fstab`.

### Example entry:

```bash id="f1r4pp"
/dev/sda1   /mnt/data   ext4   defaults   0   2
```

### Fields:

* Device
* Mount point
* Filesystem type
* Options
* Dump
* Fsck order

⚠️ Mistakes in `fstab` can prevent booting.

---

## 7. Swap Space

Swap is disk space used as virtual memory.

### Create swap file:

```bash id="s3x8qq"
sudo fallocate -l 2G /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
```

### Enable at boot:

Add to `/etc/fstab`:

```bash id="f8t2rr"
/swapfile none swap sw 0 0
```

---

## 8. Disk Usage Analysis

### Check folder usage:

```bash id="d1k5ss"
du -sh *
```

### Find largest files:

```bash id="l9p3tt"
du -ah / | sort -n | tail
```

### Free space:

```bash id="f3m8uu"
df -h
```

---

## 9. Device Identification

### Useful commands:

* `lsblk -f` → filesystem info
* `blkid` → UUIDs of partitions

```bash id="b7n2vv"
blkid
```

💡 UUIDs are preferred over `/dev/sdX` in `fstab`.

---

## ⚠️ 10. Critical Safety Concepts

### Never forget:

* `/dev/sda` naming can change between boots
* Always verify disk before formatting
* `rm` does NOT affect disks, but `mkfs` ERASES data

### Safe workflow:

1. Identify disk (`lsblk`)
2. Confirm size and label
3. Partition carefully
4. Format intentionally
5. Mount manually first
6. Add to `fstab` last

---

## Mental Model

Think of storage like this:

* Disk = physical container
* Partition = divided sections
* Filesystem = structure inside partition
* Mount = attaching it to system tree

Everything becomes part of `/`.

---

## Core Workflow Summary

```bash id="w1a9xx"
lsblk              # identify disk
fdisk /dev/sdX     # partition
mkfs.ext4 /dev/sdX1 # format
mount /dev/sdX1 /mnt # mount
df -h              # verify
```

---
