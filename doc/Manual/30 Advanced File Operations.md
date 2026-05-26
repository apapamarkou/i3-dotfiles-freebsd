# Advanced File Operations in Unix Systems

This chapter covers advanced file handling concepts and powerful command combinations used in real-world Linux workflows. These tools are essential for system control, troubleshooting, and efficient terminal usage.

---

## 1. Links (Hard Links vs Soft Links)

Unix supports two types of links: **hard links** and **symbolic (soft) links**.

### Hard Links

A hard link is an additional name for the same file data on disk.

* Both filenames point to the same inode (same actual data)
* Deleting one file does NOT delete the data if another link exists

**Create hard link:**

```bash id="8o8c7y"
ln file1.txt file2.txt
```

**Key properties:**

* Same inode
* Same file content
* Cannot link directories (in most cases)
* Cannot span filesystems

---

### Soft Links (Symbolic Links)

A soft link is a shortcut to another file.

* Points to a file path, not actual data
* If original file is deleted → link breaks

**Create soft link:**

```bash id="3n1v2u"
ln -s file1.txt link.txt
```

**Key properties:**

* Different inode
* Can link directories
* Can cross filesystems
* Breaks if target is removed

---

### Summary

| Feature           | Hard Link  | Soft Link |
| ----------------- | ---------- | --------- |
| Points to         | Inode      | File path |
| Survives deletion | Yes        | No        |
| Cross filesystem  | No         | Yes       |
| Directories       | Usually no | Yes       |

---

## 2. Disk Usage & Free Space

### Check disk usage

* `df -h` → show disk space usage (human readable)
* `du -sh folder` → size of a directory
* `du -ah` → sizes of all files and folders

### Example:

```bash id="c8n9pq"
df -h
du -sh /home/user
```

---

### Memory usage (related system concept)

* `free -h` → show RAM usage

```bash id="4f0v3g"
free -h
```

**Output shows:**

* total memory
* used memory
* free memory
* swap usage

---

## 🗑️ 3. Recursive File Operations

### ⚠️ Recursive delete (VERY DANGEROUS)

* `rm -r folder` → delete folder and contents
* `rm -rf folder` → force delete without confirmation

```bash id="k3j9aa"
rm -rf my_folder
```

### Safety note:

* No recycle bin
* No undo
* Can destroy system if misused

---

## 4. Powerful Command Pipelines

Unix allows chaining commands using pipes (`|`).

---

### View large output safely

* `find . | more` → paginated output
* `find . | less` → better pager

```bash id="2l9v7h"
find / | less
```

---

### Search inside output

* `cat file | grep text`

```bash id="7q1m2x"
cat log.txt | grep error
```

Better (recommended):

```bash id="9p3k1z"
grep error log.txt
```

---

### View end of data

* `tail` → last lines
* `tail -f` → live logs

```bash id="x1a7bb"
cat log.txt | tail
```

---

### Sorting & filtering pipelines

```bash id="v3k9fd"
cat file.txt | sort | uniq
```

Meaning:

* sort lines
* remove duplicates

---

### Common pipeline patterns

* `cmd | grep` → filter output
* `cmd | less` → view safely
* `cmd | head` → first lines
* `cmd | tail` → last lines

---

## 5. Advanced `ls` Usage

* `ls -la` → long format + hidden files
* `ls -lh` → human readable sizes
* `ls -R` → recursive listing
* `ls -lt` → sort by modification time
* `ls -lS` → sort by size

```bash id="q7v2hh"
ls -la
```

---

## 6. Advanced `find` Usage

### Search by name

```bash id="n2v4kk"
find . -name "*.txt"
```

### Search by type

```bash id="d9m1ss"
find . -type f
```

### Search and execute

```bash id="k8p3qq"
find . -name "*.log" -delete
```

---

## 7. Critical Concepts (Must Know)

### Everything is a stream

* Commands process **input → output**
* Output can be redirected or piped

---

### Redirection

* `>` → overwrite file
* `>>` → append to file

```bash id="r1x9aa"
echo "hello" > file.txt
echo "again" >> file.txt
```

---

### Standard streams

* `stdin` → input
* `stdout` → output
* `stderr` → errors

Example:

```bash id="f2k8zz"
command > out.txt 2> error.txt
```

---

### Exit codes

* `0` → success
* `!=0` → error

```bash id="t9p3ww"
echo $?
```

---

## Mental Model

Unix power comes from:

> Small tools + files + streams + composition

Instead of big programs, you combine small ones:

```bash id="m8n2qq"
cat file | grep word | sort | uniq | head
```

---
