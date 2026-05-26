
# Handling Running Processes and System Usage in Unix Systems

In Unix-like systems (including Linux), every running program is a **process**. Understanding how to view, manage, and control processes is essential for system monitoring, troubleshooting, and performance control.

---

## 1. What is a Process?

A **process** is an instance of a running program.

Each process has:

* A **PID** (Process ID)
* A **state** (running, sleeping, stopped)
* **CPU and memory usage**
* A **parent process**

Example:

* Opening a browser = one or more processes
* Running a command = a process

---

## 2. Viewing Processes

### Basic process list

* `ps` → show current shell processes
* `ps aux` → show all system processes

```bash id="p1a2bb"
ps aux
```

### Interactive view

* `top` → live system monitor
* `htop` → improved interactive viewer (if installed)

Inside `top`:

* `P` → sort by CPU
* `M` → sort by memory
* `k` → kill process

---

### Filter processes

* `pgrep name` → find process by name

```bash id="x7k2mm"
pgrep firefox
```

* `ps aux | grep name` → search manually

---

## 3. Process Information Fields

From `ps aux`:

* **USER** → who started it
* **PID** → process ID
* **%CPU** → CPU usage
* **%MEM** → memory usage
* **COMMAND** → command running

---

## 4. Killing Processes

### Kill by PID

* `kill PID` → terminate process gracefully
* `kill -9 PID` → force kill (SIGKILL)

```bash id="k2p9ss"
kill 1234
kill -9 1234
```

---

### Kill by name

* `pkill name` → kill by process name
* `killall name` → kill all matching processes

```bash id="n8v4zz"
pkill firefox
killall firefox
```

---

## 5. Foreground and Background Jobs

### Run in background

* `command &` → run in background

```bash id="b3m7aa"
sleep 100 &
```

---

### View jobs

* `jobs` → list background jobs

---

### Bring job to foreground

* `fg %1` → bring job back

---

### Suspend process

* `Ctrl + Z` → pause process
* `bg` → resume in background

---

## 6. System Resource Monitoring

### Memory and CPU usage

* `free -h` → memory usage
* `uptime` → system load average
* `vmstat` → system performance overview

```bash id="v9c1dd"
free -h
uptime
```

---

### Disk usage

* `df -h` → disk space usage
* `du -sh folder` → folder size

---

### Real-time system view

* `top`
* `htop`

---

## 7. Process Priorities (Nice Values)

Processes have priority levels:

* **-20** → highest priority
* **19** → lowest priority

### Run with priority

* `nice -n 10 command` → lower priority
* `renice 10 PID` → change running process priority

```bash id="r4k2pp"
nice -n 10 firefox
renice 5 1234
```

---

## 8. System Load Explained

From `uptime`:

```
load average: 0.50, 0.75, 1.00
```

This shows:

* 1 min average load
* 5 min average load
* 15 min average load

💡 Rule of thumb:

* 1.0 per CPU core = fully loaded

---

## 9. Signals (Process Control)

Processes respond to signals:

* `SIGTERM (15)` → polite shutdown
* `SIGKILL (9)` → force kill
* `SIGHUP (1)` → reload config

Examples:

```bash id="s6n2qq"
kill -15 PID
kill -9 PID
```

---

## 10. Advanced Tools

* `pstree` → show process hierarchy
* `lsof` → list open files by processes
* `watch command` → repeat command every few seconds

```bash id="w8m1tt"
lsof -i
pstree
watch df -h
```

---

## Mental Model

Think of Linux like this:

* Everything running = a process
* Processes consume CPU + memory
* You can:

  * view them
  * control them
  * kill them
  * prioritize them

---

## Core Workflow Summary

```bash id="c1x9zz"
ps aux        # view processes
top           # monitor live
kill PID      # stop process
&             # run in background
fg/bg         # job control
```

---
