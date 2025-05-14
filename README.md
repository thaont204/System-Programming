# System Programming (NT209)

This repository contains lectures and lab exercises from the course **"System Programming"** at the University of Information Technology – VNU-HCM.

The course covers low-level programming concepts, data representation, x86 assembly, memory hierarchy, and security-related topics like reverse engineering and buffer overflow.

---

## 📚 Lectures

The `Lectures/` folder includes theory and summaries for the following topics:

1. Bit-level data representation and bitwise operations  
2. Arrays and data structures in C  
3. Introduction to x86 Assembly  
4. Procedures and function calls in C (viewed in assembly)  
5. Memory hierarchy and cache organization  
6. Linking and executable file structure  
7. Introduction to reverse engineering and buffer overflow techniques

Materials have 2 version including Vietnamese and English

---

## 🧪 Labs

The `Labs/` folder contains hands-on exercises and lab reports designed to reinforce system-level programming and security concepts:

- **Lab 1 – Bitwise Data Manipulation (Data Lab)**  
  Implement low-level operations using only bitwise operators (AND, OR, XOR, NOT, shift) to manipulate integers in C. Understand how binary representations affect logic and arithmetic.

- **Lab 2 – Introduction to Assembly Programming**  
  Write basic x86 assembly programs using `.data`, `.text`, and `.bss` sections. Learn how to use system calls, registers, and memory management through simple string output and arithmetic examples.

- **Lab 3 – Advanced Assembly and Flow Control**  
  Expand on Lab 2 by working with more complex assembly programs. Apply conditional jumps, comparisons, and memory addressing to simulate C logic in assembly.

- **Lab 4 – Basic Reverse Engineering**  
  Analyze compiled binaries using `objdump` and GDB to understand control flow and logic. Modify binary behavior and infer original C code from disassembled output.

- **Lab 5 – Advanced Reverse Engineering**  
  Work with obfuscated and challenging binaries. Apply reverse engineering techniques to uncover logic hidden through tricks like symbol stripping or fake control flow.

- **Lab 6 – Buffer Overflow Exploitation**  
  Practice exploiting stack-based buffer overflow vulnerabilities. Modify local variables or overwrite return addresses to control execution flow using custom payloads in `simple-buffer` and `bufbomb`.

Each lab includes:
- Source code (`.c`, `.s`, `.asm`)
- Lab instructions and tasks
- Report or solution writeup

---

## 🔧 Tools & Environments

- `gcc`, `gdb`, `objdump`, `nm`  
- `IDA Free`  
- Linux terminal (Ubuntu/Kali recommended)

---

## 📎 License

This repository is intended for academic learning and ethical research only.  
All source code and documentation are part of coursework and may not be used for commercial purposes.

---