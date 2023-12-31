# Using Clang

[here a description of clang and LLVM]

## Ubuntu Installation

```bash
sudo apt update
sudo apt install clang
sudo apt install llvm
```

### How to run on Ubuntu?

```bash
clang.sh <program>.c
```

## Windows Installation

Install Clang, you can check here https://www.wikihow.com/Install-Clang-on-Windows

Install LLVM, https://github.com/llvm/llvm-project/releases/tag/llvmorg-15.0.7

### How to run on Windows

Open $Powershell$, and execute the following line

```bash
clang.ps1 <program>.c
```
## MacOs Installation

Install homebrew package manager: /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

Install llvm and clang: brew install llvm

### How to run on MacOs

Open $Powershell$, and execute the following line

```bash
clang --analyze <program>.c -o analyze
```
