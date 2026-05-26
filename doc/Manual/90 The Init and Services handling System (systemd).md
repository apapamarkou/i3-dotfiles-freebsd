
# The Linux Init System (systemd)

## 1. What is the Init System?

The **init system** is the first process started by the Linux kernel after boot. It is responsible for starting and managing all other system processes.

On modern Fedora and most Linux distributions, the init system is:

> **systemd**

It manages:

* system boot process
* services (daemons)
* background tasks
* user sessions
* system states (shutdown, reboot)

---

## 2. systemd Core Concept

systemd is built around **units**.

### Types of units:

* `.service` → system services
* `.socket` → network or IPC sockets
* `.target` → system states (like runlevels)
* `.timer` → scheduled tasks
* `.mount` → filesystem mounts

---

## 3. Boot Process Overview

1. BIOS/UEFI starts hardware
2. Linux kernel loads
3. systemd starts as PID 1
4. systemd launches system services
5. system reaches a target state (graphical, multi-user, etc.)

---

## 4. Systemd Targets (Old Runlevels)

systemd replaces old SysV runlevels.

| Runlevel | systemd target    | Meaning          |
| -------- | ----------------- | ---------------- |
| 0        | poweroff.target   | shutdown         |
| 1        | rescue.target     | single-user mode |
| 3        | multi-user.target | CLI system       |
| 5        | graphical.target  | GUI desktop      |
| 6        | reboot.target     | reboot           |

---

## 5. System Service Management

### Start service

```bash id="s1a2bb"
sudo systemctl start nginx
```

---

### Stop service

```bash id="s3c4dd"
sudo systemctl stop nginx
```

---

### Restart service

```bash id="s5e6ee"
sudo systemctl restart nginx
```

---

### Check status

```bash id="s7f8ff"
systemctl status nginx
```

---

## 6. Enable / Disable Services (Boot Control)

### Enable at boot

```bash id="e1g2gg"
sudo systemctl enable nginx
```

---

### Disable at boot

```bash id="e3h4hh"
sudo systemctl disable nginx
```

---

### Difference:

| Command | Meaning     |
| ------- | ----------- |
| start   | run now     |
| enable  | run at boot |

---

## 7. List System Services

### All active services:

```bash id="l1i2ii"
systemctl list-units --type=service
```

---

### All installed services:

```bash id="l3j4jj"
systemctl list-unit-files --type=service
```

---

## 8. Logs with journalctl

systemd includes logging via **journalctl**.

### View logs:

```bash id="j1k2kk"
journalctl
```

---

### Follow live logs:

```bash id="j3l4ll"
journalctl -f
```

---

### Service-specific logs:

```bash id="j5m6mm"
journalctl -u nginx
```

---

### Boot logs:

```bash id="j7n8nn"
journalctl -b
```

---

## 9. systemd System-wide vs User-wide

systemd runs in two layers:

---

# SYSTEM-WIDE systemd

## Purpose:

Controls system services like:

* networking
* display manager
* ssh
* hardware services

---

## Location:

```bash id="s1o2oo"
/etc/systemd/system/
```

or:

```bash id="s3p4pp"
/usr/lib/systemd/system/
```

---

## Example:

```bash id="s5q6qq"
sudo systemctl enable sshd
```

---

# 👤 USER systemd (systemd --user)

Each user also has their own systemd instance.

## Purpose:

Manages user-level services like:

* background apps
* user timers
* personal daemons

---

## Location:

```bash id="u1r2rr"
~/.config/systemd/user/
```

---

## Start user service:

```bash id="u3s4ss"
systemctl --user start service
```

---

## Enable user service:

```bash id="u5t6tt"
systemctl --user enable service
```

---

## Check user services:

```bash id="u7u8uu"
systemctl --user status
```

---

## 10. systemd Targets (System States)

### Change target temporarily:

```bash id="t1v2vv"
sudo systemctl isolate multi-user.target
```

---

### Default boot target:

```bash id="t3w4ww"
systemctl get-default
```

---

### Set default target:

```bash id="t5x6xx"
sudo systemctl set-default graphical.target
```

---

## 11. systemd Timers (Cron alternative)

### List timers:

```bash id="t7y8yy"
systemctl list-timers
```

---

### Example timer service:

* `.service` → task
* `.timer` → schedule

---

## 12. Creating a systemd Service

### Example service file:

```bash id="c1z2zz"
sudo nano /etc/systemd/system/myapp.service
```

---

### 📄 Basic structure:

```ini id="c3a4aa"
[Unit]
Description=My App Service

[Service]
ExecStart=/usr/bin/myapp

[Install]
WantedBy=multi-user.target
```

---

### Reload systemd:

```bash id="c5b6bb"
sudo systemctl daemon-reload
```

---

### Enable service:

```bash id="c7c8cc"
sudo systemctl enable myapp
```

---

## 13. Important Concepts

### PID 1

systemd is always:

* the first process
* process ID = 1

Check:

```bash id="p1d2dd"
ps -p 1
```

---

### Dependencies

Services can depend on others:

* networking before ssh
* filesystem before GUI

---

### Parallel startup

systemd starts services in parallel → faster boot times.

---

## 14. Mental Model

Think of systemd like:

> The “manager of everything running on your system”

* kernel → hardware control
* systemd → service manager
* services → workers

---

## 15. systemd File Structure (Unit Files Explained)

A **systemd unit file** defines how a service behaves.

### Location hierarchy (important)

| Location                   | Purpose                   | Priority  |
| -------------------------- | ------------------------- | --------- |
| `/etc/systemd/system/`     | custom/admin services     | highest   |
| `/run/systemd/system/`     | runtime services          | temporary |
| `/usr/lib/systemd/system/` | system-installed services | default   |

👉 Rule:

* If you create a custom service → always use `/etc/systemd/system/`

---

## 16. systemd Unit File Structure

A service file is divided into **sections**:

```ini
[Unit]
[Service]
[Install]
```

---

## A) [Unit] Section

Defines metadata and dependencies.

Example:

```ini
[Unit]
Description=My Custom Service
After=network.target
Requires=network.target
```

### Common fields:

| Option      | Meaning                     |
| ----------- | --------------------------- |
| Description | human-readable name         |
| After       | start after another service |
| Requires    | hard dependency             |

---

## B) [Service] Section

Defines what runs.

Example:

```ini
[Service]
ExecStart=/usr/bin/myapp
Restart=always
User=myuser
WorkingDirectory=/home/myuser
```

### Common fields:

| Option           | Meaning             |
| ---------------- | ------------------- |
| ExecStart        | command to run      |
| Restart          | auto-restart policy |
| User             | run as user         |
| WorkingDirectory | execution folder    |

---

## C) [Install] Section

Defines how service is enabled at boot.

```ini
[Install]
WantedBy=multi-user.target
```

### Meaning:

* `multi-user.target` = normal CLI system boot

---

# 17. Creating a Custom systemd Service

---

## Step 1: Create service file

```bash
sudo nano /etc/systemd/system/myapp.service
```

---

## Step 2: Full example service

```ini
[Unit]
Description=My Custom App
After=network.target

[Service]
ExecStart=/usr/local/bin/myapp
Restart=always
User=myuser
WorkingDirectory=/home/myuser

[Install]
WantedBy=multi-user.target
```

---

## Step 3: Reload systemd

```bash
sudo systemctl daemon-reload
```

---

## Step 4: Start service

```bash
sudo systemctl start myapp
```

---

## Step 5: Enable at boot

```bash
sudo systemctl enable myapp
```

---

## Step 6: Check status

```bash
systemctl status myapp
```

---

# 18. systemd Timers (Cron Replacement)

systemd uses **timers instead of cron jobs**.

---

## Two-file system

A timer always has:

* `.service` → what runs
* `.timer` → when it runs

---

## Example service file

```ini
# /etc/systemd/system/backup.service

[Unit]
Description=Backup Job

[Service]
ExecStart=/usr/local/bin/backup.sh
```

---

## Example timer file

```ini
# /etc/systemd/system/backup.timer

[Unit]
Description=Run backup daily

[Timer]
OnCalendar=daily
Persistent=true

[Install]
WantedBy=timers.target
```

---

## Enable timer

```bash
sudo systemctl daemon-reload
sudo systemctl enable --now backup.timer
```

---

## Check timers

```bash
systemctl list-timers
```

---

## Common timer formats

| Syntax                   | Meaning               |
| ------------------------ | --------------------- |
| `daily`                  | once per day          |
| `hourly`                 | every hour            |
| `weekly`                 | once per week         |
| `OnBootSec=10min`        | 10 minutes after boot |
| `OnCalendar=*-*-* 12:00` | every day at noon     |

---

# 19. systemd Directories (Important)

systemd uses multiple directory layers:

---

## System services:

```bash
/usr/lib/systemd/system/
```

Installed by packages.

---

## Admin/custom services:

```bash
/etc/systemd/system/
```

Your custom services go here.

---

## Runtime services:

```bash
/run/systemd/system/
```

Temporary services (lost after reboot).

---

## Priority rule:

```
/etc > /run > /usr/lib
```

---

# 20. Advanced Custom Service Example

## Example: Python server

### Step 1: App file

```bash
/usr/local/bin/server.py
```

---

### Step 2: Service file

```ini
[Unit]
Description=Python Web Server
After=network.target

[Service]
ExecStart=/usr/bin/python3 /usr/local/bin/server.py
Restart=always
User=webuser
WorkingDirectory=/usr/local/bin

[Install]
WantedBy=multi-user.target
```

---

### Step 3: Enable it

```bash
sudo systemctl daemon-reload
sudo systemctl enable --now server.service
```

---

# 21. Common Mistakes

❌ Wrong path:

```
ExecStart=server.py
```

✔ Correct:

```
ExecStart=/usr/bin/python3 /full/path/server.py
```

---

❌ Forgetting daemon reload:

```bash
systemctl start service
```

✔ Correct:

```bash
systemctl daemon-reload
systemctl start service
```

---

❌ Wrong install target:

```
WantedBy=graphical.target
```

(use only if GUI dependency exists)

---

# 22. systemd Execution Flow

```text
Unit file created
        ↓
daemon-reload
        ↓
systemctl enable
        ↓
system boots
        ↓
systemd reads unit
        ↓
service starts
```

---

# 23. Mental Model

Think of systemd like:

> 🧠 A “robot manager” that runs your system

* Unit file = instruction card
* systemctl = remote control
* timer = alarm clock
* service = worker task

---

# 📋 24. Quick Summary

```bash
systemctl start service
systemctl stop service
systemctl enable service
systemctl status service
journalctl -u service
systemctl --user start service
systemctl get-default

systemctl list-timers
systemctl enable --now mytimer.timer
```

---

