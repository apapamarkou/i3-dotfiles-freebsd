## 🧾 Filesystem Layout Basics

Linux systems, including Fedora-based distributions, use a unified directory structure rooted at a single top-level directory called the **root**, represented as `/`. Unlike Windows, there are no drive letters (e.g., C:\ or D:). All files and devices are organized within this single hierarchy.

Understanding the filesystem layout helps you navigate the system, locate configuration files, and manage applications effectively.

---

### **1. The Root Directory (`/`)**

The root directory is the base of the entire filesystem. Every file and directory on the system exists somewhere under `/`.

---

### **2. Key Directories Overview**

Below are the most important directories you will encounter:

#### **`/home` – User Files**

* Contains personal directories for each user (e.g., `/home/username`)
* Stores documents, downloads, and personal configuration files
* This is where you will spend most of your time

---

#### **`/etc` – System Configuration**

* Contains system-wide configuration files
* Examples:

  * `/etc/fstab` (filesystem mounts)
  * `/etc/hostname` (system name)
* Changes here affect the entire system

---

#### **`/bin` and `/usr/bin` – Essential Programs**

* Store executable programs (commands)
* `/bin`: essential tools required for basic system operation
* `/usr/bin`: most user-installed applications

---

#### **`/usr` – User Applications & Data**

* Contains the majority of installed software and libraries
* Subdirectories include:

  * `/usr/bin` (applications)
  * `/usr/lib` (libraries)
  * `/usr/share` (shared data)

---

#### **`/var` – Variable Data**

* Stores data that changes frequently
* Examples:

  * Logs: `/var/log`
  * Package cache: `/var/cache`
  * Spool files (printing, mail)

---

#### **`/tmp` – Temporary Files**

* Used for temporary data created by applications
* Often cleared automatically on reboot

---

#### **`/boot` – Boot Files**

* Contains files needed to start the system
* Includes the Linux kernel and bootloader configuration

---

#### **`/dev` – Device Files**

* Represents hardware devices as files
* Examples:

  * `/dev/sda` (hard drive)
  * `/dev/null` (special null device)

---

#### **`/proc` – Process & System Information**

* A virtual filesystem providing real-time system information
* Example:

  * `/proc/cpuinfo` (CPU details)

---

#### **`/sys` – System Interface**

* Provides access to kernel and hardware information
* Used mainly for advanced configuration and debugging

---

#### **`/opt` – Optional Software**

* Used for manually installed or third-party applications

---

#### **`/root` – Root User Home**

* Home directory for the system administrator (root user)
* Not the same as `/`

---

### **3. Hidden Files and Configuration**

* Files starting with a dot (`.`) are hidden

  * Example: `~/.config`, `~/.bashrc`
* These typically store user-specific settings and preferences

---

### **4. Mount Points**

* External drives and partitions are mounted into the filesystem
* Common locations:

  * `/mnt` (manual mounts)
  * `/media` (automatic mounts, e.g., USB drives)

