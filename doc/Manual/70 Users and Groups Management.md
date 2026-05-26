# Users and Groups Management in Linux (Complete Guide)

Linux is a **multi-user system**, where every user has a unique identity, permissions, and environment. This chapter explains how to create, modify, and manage users and groups, assign sudo privileges, and control user environments.

---

# 1. User Concepts Overview

Every Linux user has:

* **Username**
* **UID (User ID)**
* **Home directory** (`/home/username`)
* **Login shell** (bash, zsh, etc.)
* **Groups**
* **Password (encrypted in system)**

---

## Key system files

| File           | Purpose               |
| -------------- | --------------------- |
| `/etc/passwd`  | user accounts         |
| `/etc/shadow`  | passwords (encrypted) |
| `/etc/group`   | groups                |
| `/etc/sudoers` | sudo permissions      |

---

# 2. Creating Users

## Create a user

```bash id="u1a2bb"
sudo useradd username
```

Better (Fedora-friendly):

```bash id="u3c4dd"
sudo adduser username
```

---

## Create user with home directory

```bash id="u5e6ee"
sudo useradd -m username
```

---

## Set password

```bash id="u7f8ff"
sudo passwd username
```

---

## Verify user

```bash id="u9g0gg"
id username
```

```bash id="u1h2hh"
getent passwd username
```

---

# 3. Removing Users

## Remove user only

```bash id="u3i4ii"
sudo userdel username
```

## Remove user + home directory

```bash id="u5j6jj"
sudo userdel -r username
```

---

⚠️ Warning:

* `-r` permanently deletes user files

---

# 4. Groups in Linux

Groups allow multiple users to share permissions.

---

## Create a group

```bash id="g1a2kk"
sudo groupadd developers
```

---

## Delete a group

```bash id="g3b4ll"
sudo groupdel developers
```

---

## View groups

```bash id="g5c6mm"
groups
```

```bash id="g7d8nn"
getent group
```

---

# 5. Add Users to Groups

## Add user to group

```bash id="a1e2oo"
sudo usermod -aG developers username
```

---

## Check user groups

```bash id="a3f4pp"
groups username
```

---

## ⚠️ Important rule

Always use `-aG` together:

❌ Wrong:

```bash id="a5g6qq"
usermod -G developers username
```

✔ Correct:

```bash id="a7h8rr"
usermod -aG developers username
```

Otherwise you remove existing groups.

---

# 6. Sudo (Admin Privileges)

## What is sudo?

`sudo` allows users to run commands as root.

---

## Add user to sudo group (Fedora)

```bash id="s1i2ss"
sudo usermod -aG wheel username
```

In Fedora:

* `wheel` group = sudo access

---

## Check sudo access

```bash id="s3j4tt"
groups username
```

---

## Test sudo

```bash id="s5k6uu"
sudo dnf update
```

---

## sudo configuration file

```bash id="s7l8vv"
/etc/sudoers
```

Edit safely:

```bash id="s9m0ww"
sudo visudo
```

---

# 7. User Information

## View current user

```bash id="i1n2xx"
whoami
```

---

## Full user info

```bash id="i3o4yy"
id
```

---

## List logged-in users

```bash id="i5p6zz"
who
```

```bash id="i7q8aa"
w
```

---

## Finger (if installed)

```bash id="i9r0bb"
finger username
```

---

# 8. User Details (Advanced)

## Change real name / info

```bash id="u1s2cc"
sudo usermod -c "Full Name" username
```

---

## Change home directory

```bash id="u3t4dd"
sudo usermod -d /new/home username
```

---

## Change login shell

```bash id="u5u6ee"
sudo usermod -s /bin/bash username
```

Example:

```bash id="u7v8ff"
sudo usermod -s /bin/zsh username
```

---

## Check available shells

```bash id="u9w0gg"
cat /etc/shells
```

---

# 9. Password and Account Control

## Change password

```bash id="p1x2hh"
sudo passwd username
```

---

## Lock user account

```bash id="p3y4ii"
sudo passwd -l username
```

---

## Unlock user account

```bash id="p5z6jj"
sudo passwd -u username
```

---

# 10. Default Shell Concept

Each user has a default shell:

Check:

```bash id="d1a2kk"
echo $SHELL
```

Change:

```bash id="d3b4ll"
chsh -s /bin/bash username
```

---

# 11. Primary vs Secondary Groups

Every user has:

### Primary group

* default group
* usually same name as user

### Secondary groups

* extra permissions (e.g. docker, wheel)

---

# 12. User Home Directory Structure

When a user is created:

```id="h1c2mm"
/home/username
├── Documents
├── Downloads
├── .bashrc
├── .profile
└── .config
```

---

# 13. Default User Creation Settings

Controlled by:

```bash id="d5d6nn"
/etc/default/useradd
```

and:

```bash id="d7e8oo"
/etc/login.defs
```

---

# 14. Real-world Examples

## Create developer user:

```bash id="r1f2pp"
sudo useradd -m -G wheel,developers -s /bin/bash devuser
```

---

## Secure service user:

```bash id="r3g4qq"
sudo useradd -r -s /sbin/nologin serviceuser
```

---

## Add sudo access:

```bash id="r5h6rr"
sudo usermod -aG wheel username
```

---

# ⚠️ 15. Critical Safety Rules

* Never edit `/etc/passwd` manually unless necessary
* Always use `visudo` for sudo changes
* Never remove root or system users
* Be careful with `userdel -r`

---

# Mental Model

Think of Linux users like:

> Each user = identity + permissions + environment

* Users = people
* Groups = teams
* sudo = admin key
* home = personal workspace

---

# 16. Quick Summary

```bash id="q1i2ss"
useradd -m user        # create user
passwd user            # set password
usermod -aG wheel user # sudo access
groupadd dev           # create group
userdel -r user        # delete user
chsh -s /bin/bash user # change shell
id user                # user info
```

---
