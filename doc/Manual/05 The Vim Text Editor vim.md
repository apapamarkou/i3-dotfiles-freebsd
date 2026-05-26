## 🧾 Neovim Basics (Complete Command Reference)

Neovim is a modal editor, meaning every key behaves differently depending on the mode you are in. Most editing happens in **Normal Mode**, where commands are composed of verbs (actions) + motions (movement).

---

## **1. Modes**

* **Normal Mode** → navigation and commands (`Esc` to return)
* **Insert Mode** → typing text (`i`, `a`, `o`)
* **Visual Mode** → selecting text (`v`, `V`, `Ctrl+v`)
* **Command Mode** → `:` for commands like save, search, quit

---

## **2. Navigation (Motions)**

### Basic movement

* `h` → left
* `j` → down
* `k` → up
* `l` → right

### Word movement

* `w` → next word start
* `e` → end of word
* `b` → previous word start
* `ge` → previous word end

### Line movement

* `0` → beginning of line
* `^` → first non-blank character
* `$` → end of line

### File movement

* `gg` → top of file
* `G` → bottom of file
* `:{number}` → go to line number (e.g., `:25`)

---

## **3. Editing Commands (Core Operators)**

Neovim uses **operators + motions**.

### Delete (`d`)

* `dd` → delete entire line
* `d$` → delete to end of line
* `d0` → delete to beginning of line
* `dw` → delete word
* `de` → delete to end of word
* `db` → delete previous word
* `dgg` → delete to top of file
* `dG` → delete to bottom of file
* `d{motion}` → delete anything using a movement (powerful concept)

---

### Copy / Yank (`y`)

* `yy` → copy line
* `y$` → copy to end of line
* `yw` → copy word
* `ygg` → copy to top of file
* `yG` → copy to bottom of file
* `y` (visual mode) → copy selection

---

### Paste (`p`)

* `p` → paste after cursor
* `P` → paste before cursor

---

### Change (`c`) = delete + insert

* `cc` → change full line
* `cw` → change word
* `c$` → change to end of line
* `c{motion}` → replace selection and enter insert mode

---

### Substitute Character (`s`)

* `s` → delete character and enter insert mode
* `S` → replace entire line

---

### Replace Character

* `r<char>` → replace single character (e.g., `ra` replaces with “a”)

---

## **4. Undo / Redo / Repeat**

* `u` → undo
* `Ctrl + r` → redo
* `.` → repeat last action (VERY important)

---

## **5. Cut / Copy / Paste (Visual Mode)**

1. `v` → select text
2. Then:

   * `d` → cut selection
   * `y` → copy selection
   * `p` → paste

---

## **6. Save / Quit**

Command mode (`:`):

* `:w` → save
* `:w filename` → save as
* `:q` → quit
* `:wq` → save and quit
* `:x` → save and quit (same as `:wq`)
* `:q!` → quit without saving

---

## **7. Search**

* `/text` → search forward
* `?text` → search backward
* `n` → next match
* `N` → previous match

---

## **8. Search & Replace**

### Basic replace

* `:s/old/new/` → replace first match in line
* `:s/old/new/g` → replace all in line

### Whole file

* `:%s/old/new/g` → replace all occurrences in file
* `:%s/old/new/gc` → replace with confirmation

---

## **9. Powerful Combined Commands (VERY IMPORTANT)**

Neovim becomes powerful when combining operators + motions:

* `d2w` → delete 2 words
* `y3j` → copy 3 lines down
* `c$` → change until end of line
* `dG` → delete everything to bottom
* `ygg` → copy entire file
* `ciw` → change inner word (very common)
* `diw` → delete inner word
* `yiw` → yank inner word

---

## **10. Practical Mental Model**

Think of Neovim like this:

> **verb + motion = action**

Examples:

* `d + w` → delete word
* `y + $` → copy to end of line
* `c + i + w` → change inner word

---

