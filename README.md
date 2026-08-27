# linux_admin_dashboard

## Description

Linux Admin Dashboard is a Bash-based command-line project developed on Ubuntu Linux.

The project provides an interactive menu that brings together several common Linux administration tasks in one simple dashboard.

## Features

The dashboard includes:

* System Information
* Users and Groups Management
* File and Directory Management
* Permission Audit
* Text and Log Analysis
* Backup Management
* Report Generation
* Input Validation and Error Handling

## Technologies Used

* Ubuntu Linux
* Bash Shell Scripting
* Linux Command Line
* Git & GitHub

## Linux Commands Used

The project uses several Linux commands, including:

```bash
whoami
pwd
date
uname
ls
groups
usermod
gpasswd
useradd
userdel
touch
mkdir
cp
mv
rm
chmod
grep
wc
head
tail
sort
uniq
cut
tr
tee
```

## Bash Concepts Used

The project demonstrates:

* Variables
* User input with `read`
* `if / elif / else`
* `case`
* `while` loops
* Input validation
* Command exit status
* Pipes
* Redirection
* Functions

## Project Sections

### 1. System Information

Displays basic information about the current Linux system, such as:

* Current user
* Current directory
* Current date
* Operating system
* Kernel release
* Machine architecture

### 2. Users and Groups

Provides basic user and group management operations, including:

* Checking the current user
* Viewing user groups
* Adding a user to a group
* Removing a user from a group
* Creating a user
* Deleting a user

The program also handles invalid or empty input.

### 3. File and Directory Management

Allows the user to:

* Create files
* Create directories
* List directory contents
* Copy files
* Move files
* Delete files

The program checks whether paths exist before performing operations.

