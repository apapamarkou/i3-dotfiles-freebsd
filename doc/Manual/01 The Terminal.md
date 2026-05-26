# The Unix Terminal

The Unix terminal is a text-based interface that allows you to interact directly with the operating system. Instead of clicking through graphical menus, you type commands to perform actions like managing files, running programs, and configuring the system.

---

## 1. What is the Terminal?

The **terminal** (or shell terminal) is a program that interprets your commands and communicates with the operating system.

Key components:

* **Terminal Emulator** → the window (e.g., GNOME Terminal, Alacritty)
* **Shell** → the command interpreter (e.g., Bash, Zsh)
* **Kernel** → the core of the OS that executes operations

👉 You type commands → Shell processes them → Kernel executes them

---

## 2. Brief History of the Unix Terminal

* **1969** → Unix created at Bell Labs
* Early interaction via physical terminals (text-only devices)
* Commands were designed to be:

  * small
  * composable
  * text-based
* This philosophy led to modern Linux systems

### Key idea:

> “Do one thing well” — Unix philosophy

---

## 3. What is Bash?

**Bash (Bourne Again Shell)** is the most common Linux shell.

It provides:

* Command execution
* Scripting support
* Environment control
* Automation

Check your shell:

```bash id="s1a2bb"
echo $SHELL
```

---

## 4. Customizing Bash

Bash is highly customizable through configuration files.

### Main config file:

* `~/.bashrc` → runs for every terminal session

---

### Reload configuration:

```bash id="r3c4cc"
source ~/.bashrc
```

---

### Change prompt (PS1)

Example:

```bash id="p5d6dd"
PS1="\u@\h:\w$ "
```

Meaning:

* `\u` → username
* `\h` → hostname
* `\w` → current directory

---

### Make changes permanent:

Add to `~/.bashrc`

---

## 5. Aliases (Command Shortcuts)

Aliases simplify long commands.

---

### Create alias:

```bash id="a1b2ee"
alias ll='ls -la'
```

---

### Common useful aliases:

```bash id="a3c4ff"
alias update='sudo dnf upgrade -y'
alias cls='clear'
alias rm='rm -i'
```

---

### Remove alias:

```bash id="r5d6gg"
unalias ll
```

---

### Make aliases permanent:

Add to:

```bash id="b7e8hh"
~/.bashrc
```

---

## 6. Environment Variables

Environment variables control system behavior.

### View variables:

```bash id="e1f2jj"
env
```

### Common variables:

* `PATH` → where system looks for commands
* `HOME` → user home directory
* `USER` → current user

### Example:

```bash id="p3g4kk"
echo $PATH
```

---

## 7. PATH Explained

The `PATH` variable tells the shell where to find programs.

Example:

```bash id="p5h6ll"
/usr/bin:/bin:/usr/local/bin
```

If a program is not in PATH:

* You must run it with full path:

```bash id="f7i8mm"
./program
```

---

## 8. Shell Scripting Basics

Bash can automate tasks.

### Simple script:

```bash id="s9j0nn"
#!/bin/bash
echo "Hello World"
```

Run:

```bash id="r1k2oo"
chmod +x script.sh
./script.sh
```

---

## 9. Command Chaining

### AND / OR execution:

```bash id="c3l4pp"
command1 && command2   # run if success
command1 || command2   # run if failure
```

---

### PIPE (very important):

```bash id="p5m6qq"
ls | grep txt
```

Output of one command becomes input to another.

---

## 10. Terminal Shortcuts

* `Ctrl + C` → stop process
* `Ctrl + Z` → suspend process
* `Ctrl + D` → exit terminal
* `Tab` → auto-complete
* `Ctrl + R` → search history

---

## 11. Command History

* `history` → show past commands
* `!n` → run command number n
* `!!` → repeat last command

---

## 12. Terminal Customization

You can customize:

* Colors
* Prompt style
* Fonts
* Transparency
* Themes

Tools:

* GNOME Terminal settings
* Tilix
* Alacritty
* Kitty

---

## ⚠️ 13. Important Concepts

* Terminal is not the system → it is an interface
* Shell interprets commands
* Everything is text-based input/output
* Misconfigured `.bashrc` can break terminal behavior

---

## Mental Model

Think of it like:

* Terminal → screen + keyboard interface
* Shell → brain that understands commands
* Kernel → engine that does the work

---

## Core Workflow Summary

```bash id="w1n2rr"
alias ll='ls -la'        # shortcut
source ~/.bashrc         # reload config
echo $PATH               # check system path
history                  # command history
```

---
