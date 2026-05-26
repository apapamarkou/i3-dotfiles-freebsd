# Working with Files and Directories in Unix Systems

Unix-like systems (including Fedora Linux) organize everything into files and directories. This chapter covers the essential commands for viewing, navigating, creating, moving, and inspecting files.

---

## 1. Viewing and Navigating the Filesystem

### **Where am I?**

* `pwd` → print working directory (shows current location)

### **Move between directories**

* `cd /path` → change directory
* `cd ..` → go up one level
* `cd ~` → go to home directory
* `cd -` → go to previous directory

### **List files and directories**

* `ls` → list files
* `ls -l` → long format (permissions, size, owner)
* `ls -a` → show hidden files
* `ls -lh` → human-readable sizes
* `ls -R` → recursive listing
* `tree` → visual directory structure (if installed)

---

## 2. Viewing File Contents

### **Quick view**

* `cat file` → display full file content
* `cat -n file` → show with line numbers

### **Paged viewing (recommended for large files)**

* `less file` → scroll through file (`q` to quit)
* `more file` → basic pager

### **Top / bottom of files**

* `head file` → first 10 lines
* `tail file` → last 10 lines
* `tail -f file` → live log monitoring

---

## 3. Creating Files and Directories

### **Files**

* `touch file.txt` → create empty file or update timestamp

### **Directories**

* `mkdir folder` → create directory
* `mkdir -p path/to/folder` → create nested directories

---

## 4. Removing Files and Directories

⚠️ Be careful: Linux deletion is permanent.

### **Files**

* `rm file` → delete file
* `rm -i file` → ask before deleting
* `rm -f file` → force delete

### **Directories**

* `rm -r folder` → remove directory recursively
* `rm -rf folder` → force delete directory (dangerous)

---

## 🔄 5. Moving and Renaming Files

* `mv file1 file2` → rename file
* `mv file /path/` → move file
* `mv folder /new/path/` → move directory

💡 In Unix, renaming = moving within same directory.

---

## 6. Copying Files

* `cp file1 file2` → copy file
* `cp -r folder/ newfolder/` → copy directory
* `cp -i file /path/` → prompt before overwrite

---

## 7. File Type and Inspection

* `file filename` → show file type (text, binary, executable, etc.)

Examples:

```bash
file script.sh
file image.png
file /bin/ls
```

---

## 8. Searching Files and Content

* `find /path -name file` → find files by name
* `find . -type f` → find all files in current directory
* `grep "text" file` → search inside file
* `grep -r "text" folder` → recursive search

---

## 9. Useful Extras (Commonly Used Tools)

* `wc file` → count lines, words, characters
* `sort file` → sort content
* `uniq file` → remove duplicates (sorted input needed)
* `diff file1 file2` → compare files
* `stat file` → detailed file metadata

---

## Core Mental Model

> Everything in Unix is a file.

* Directories = special files that contain other files
* Devices = files in `/dev`
* Configs = text files in `/etc`
* Logs = files in `/var/log`

---
