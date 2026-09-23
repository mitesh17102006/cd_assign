# Bcs24 Compiler — Stage 1 README

## Prerequisites

* **Arch Linux:**
```bash
sudo pacman -Syu flex bison base-devel

```


* **Debian / Ubuntu:**
```bash
sudo apt update && sudo apt install flex bison build-essential

```



---

## How to Use

1. **Build:** Run `make` to generate lexer/parser files and compile the `bcs24` executable.
2. **Run:** Pass your source code file as a command-line argument:


```bash
./bcs24 sample.txt

```


3. **Outputs:** Prints `"Parsing Successful"` if valid, or `"Syntax Error"` otherwise.


4. **Clean:** Run `make clean` to wipe intermediate C and binary files.

---

## What to Edit in `lexer.l`

* **Keywords:** Ensure exact keywords (`BcsMain`, `if`, `else`, `while`, `int`, `bool`) match the language specification.


* **Token Patterns:** Modify regular expressions for identifiers (`id`), numbers (`num`), or relational operators (`relop`) if rules change.



---

## What to Edit in `parser.y`

* **Grammar Rules:** Update BNF rules (`program`, `declist`, `stmtlist`, expressions, and statements) if grammar constraints change.


* **Actions:** Modify code blocks inside brackets (`{ ... }`) to prepare syntax structures for Stage 2.