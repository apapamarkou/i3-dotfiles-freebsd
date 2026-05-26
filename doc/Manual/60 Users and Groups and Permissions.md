# 👤 1. Users and Groups and Permissions

## 🧑 What is a User?

A user is an account that can:

* own files
* run processes
* access system resources (based on permissions)

Each user has:

* a username
* a UID (User ID)
* a home directory

---

## 👥 What is a Group?

A group is a collection of users.

Purpose:

* share access to files
* simplify permission management

Each group has:

* group name
* GID (Group ID)

---

## 📋 Check users and groups

```bash id="u1a2bb"
whoami
```

```bash id="u3c4dd"
groups
```

```bash id="u5e6ee"
id
```

---

## 📂 System files

* `/etc/passwd` → user accounts
* `/etc/group` → groups
* `/etc/shadow` → encrypted passwords (root only)

---

# 🔐 2. File Permissions Overview

Every file and directory has 3 permission levels:

| Level      | Meaning       |
| ---------- | ------------- |
| User (u)   | owner         |
| Group (g)  | group members |
| Others (o) | everyone else |

---

## 📌 Permission types

| Symbol | Meaning |
| ------ | ------- |
| r      | read    |
| w      | write   |
| x      | execute |

---

## 📊 Example

```bash id="p7f8gg"
-rwxr-xr--
```

Breakdown:

| Section | Meaning                     |
| ------- | --------------------------- |
| rwx     | user can read/write/execute |
| r-x     | group can read/execute      |
| r--     | others can read only        |

---

# ⚙️ 3. chmod (Permission Control)

`chmod` = change file permissions

---

## 🧠 Two ways to use chmod:

# 1️⃣ Symbolic Mode (human readable)

### Format:

```bash id="c1a2hh"
chmod [who][+/-/=][permission] file
```

---

### 📌 Examples:

Add execute permission:

```bash id="c3b4ii"
chmod +x script.sh
```

Remove write permission:

```bash id="c5d6jj"
chmod -w file.txt
```

Give only user full access:

```bash id="c7e8kk"
chmod u=rwx file.txt
```

Group read-only:

```bash id="c9f0ll"
chmod g=r file.txt
```

---

## 🧠 Who symbols:

| Symbol | Meaning      |
| ------ | ------------ |
| u      | user (owner) |
| g      | group        |
| o      | others       |
| a      | all          |

---

# 2️⃣ Numeric Mode (octal) ⭐ IMPORTANT

Each permission has a number:

| Permission | Value |
| ---------- | ----- |
| r          | 4     |
| w          | 2     |
| x          | 1     |

---

## 📊 Combine values:

| Result | Meaning |
| ------ | ------- |
| 7      | rwx     |
| 6      | rw-     |
| 5      | r-x     |
| 4      | r--     |
| 0      | ---     |

---

## 📌 Examples:

Full access for owner, read-only for others:

```bash id="c1g2mm"
chmod 744 file.txt
```

Explanation:

* 7 → user = rwx
* 4 → group = r--
* 4 → others = r--

---

Shared project file:

```bash id="c3h4nn"
chmod 664 file.txt
```

Explanation:

* user = rw-
* group = rw-
* others = r--

---

Executable script:

```bash id="c5i6oo"
chmod 755 script.sh
```

---

# 📂 4. Directory Permissions (IMPORTANT)

Directories behave differently:

| Permission | Meaning             |
| ---------- | ------------------- |
| r          | list files          |
| w          | create/delete files |
| x          | enter directory     |

---

## 📌 Example:

```bash id="d1j2pp"
chmod 755 folder
```

Meaning:

* owner: full access
* group: read + enter
* others: read + enter

---

⚠️ Without `x`, you cannot enter a directory.

---

# 👑 5. Ownership (chown)

Change file owner:

```bash id="o3k4qq"
sudo chown user file.txt
```

Change user and group:

```bash id="o5l6rr"
sudo chown user:group file.txt
```

---

# 👥 6. Groups (chgrp)

Change group:

```bash id="g7m8ss"
sudo chgrp developers file.txt
```

---

# 🔐 7. Special Permissions (Advanced)

## 📌 Setuid (4xxx)

Run file as owner:

```bash id="s1n2tt"
chmod 4755 file
```

---

## 📌 Setgid (2xxx)

Group inheritance:

```bash id="s3o4uu"
chmod 2755 folder
```

---

## 📌 Sticky bit (1xxx)

Used on shared folders (like `/tmp`)

```bash id="t5p6vv"
chmod 1777 /tmp
```

Only owner can delete their files.

---

# 🧠 8. Real-world examples

## Secure script:

```bash id="r1q2ww"
chmod 700 script.sh
```

Only owner can use it.

---

## Shared folder:

```bash id="r3r4xx"
chmod 770 project/
```

Owner + group can access.

---

## Public folder:

```bash id="r5s6yy"
chmod 755 public/
```

---

# 🧠 9. Mental Model

Think of permissions like:

> 🔑 A lock system for every file

* User = owner key
* Group = shared key
* Others = public access

And permissions define:

* who can read it
* who can modify it
* who can execute it

---

# 📋 10. Quick Summary

```bash id="q1z2zz"
chmod 755 file      # common executable
chmod 644 file      # normal file
chmod 700 file      # private file
chmod +x script.sh  # make executable
```

