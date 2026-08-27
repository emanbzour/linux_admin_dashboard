#!/bin/bash

# ==================================================
#              LINUX ADMIN DASHBOARD
# ==================================================

# ==================================================
# 1. SYSTEM INFORMATION
# ==================================================

system_information() {
choice=0
while [ "$choice" -ne 7 ]
do
echo ""
echo "=================================================="
echo "              SYSTEM INFORMATION"
echo "=================================================="
echo ""
echo "              1. Current User"
echo ""
echo "              2. Current Directory"
echo ""
echo "              3. Current Date"
echo ""
echo "              4. Operating System"
echo ""
echo "              5. Kernel Release"
echo ""
echo "              6. Machine Architecture"
echo ""
echo "              7. Back to Main Menu"
echo ""
echo "=================================================="
echo "              Enter your choice:"
echo "=================================================="

read -r choice

if [ "$choice" -eq 1 ]
then
echo ""
echo "              Current User:"
whoami

elif [ "$choice" -eq 2 ]
then
echo ""
echo "              Current Directory:"
pwd

elif [ "$choice" -eq 3 ]
then
echo ""
echo "              Current Date:"
date

elif [ "$choice" -eq 4 ]
then
echo ""
echo "              Operating System:"
uname -s

elif [ "$choice" -eq 5 ]
then
echo ""
echo "              Kernel Release:"
uname -r

elif [ "$choice" -eq 6 ]
then
echo ""
echo "              Machine Architecture:"
uname -m

elif [ "$choice" -eq 7 ]
then
:

else
echo ""
echo "              Invalid choice."
echo "              Please enter 1 - 7."
fi
done
}


# ==================================================
# 2. USERS AND GROUPS
# ==================================================

users_groups() {
choice=0
while [ "$choice" -ne 7 ]
do
echo ""
echo "=================================================="
echo "                USERS AND GROUPS"
echo "=================================================="
echo ""
echo "              1. Current User"
echo ""
echo "              2. User Groups"
echo ""
echo "              3. Add User to Group"
echo ""
echo "              4. Remove User from Group"
echo ""
echo "              5. Add User"
echo ""
echo "              6. Delete User"
echo ""
echo "              7. Back to Main Menu"
echo ""
echo "=================================================="
echo "              Enter your choice:"
echo "=================================================="

read -r choice

if [ "$choice" -eq 1 ]
then
echo ""
echo "              Current User:"
whoami

elif [ "$choice" -eq 2 ]
then
echo ""
echo "              Enter username:"
read -r username

if [ -z "$username" ]
then
echo "              Username cannot be empty."
else
echo ""
echo "              Groups for $username:"
groups "$username"
fi

elif [ "$choice" -eq 3 ]
then
echo ""
echo "              Enter username:"
read -r username

echo "              Enter group name:"
read -r groupname

if [ -z "$username" ] || [ -z "$groupname" ]
then
echo "              Username and group cannot be empty."
else
sudo usermod -aG "$groupname" "$username"

if [ "$?" -eq 0 ]
then
echo "              User added to group successfully."
else
echo "              Failed to add user to group."
fi
fi

elif [ "$choice" -eq 4 ]
then
echo ""
echo "              Enter username:"
read -r username

echo "              Enter group name:"
read -r groupname

if [ -z "$username" ] || [ -z "$groupname" ]
then
echo "              Username and group cannot be empty."
else
sudo gpasswd -d "$username" "$groupname"

if [ "$?" -eq 0 ]
then
echo "              User removed from group successfully."
else
echo "              Failed to remove user from group."
fi
fi

elif [ "$choice" -eq 5 ]
then
echo ""
echo "              Enter new username:"
read -r username

if [ -z "$username" ]
then
echo "              Username cannot be empty."
else
sudo useradd "$username"

if [ "$?" -eq 0 ]
then
echo "              User created successfully."
else
echo "              Failed to create user."
fi
fi

elif [ "$choice" -eq 6 ]
then
echo ""
echo "              Enter username to delete:"
read -r username

if [ -z "$username" ]
then
echo "              Username cannot be empty."
else
sudo userdel "$username"

if [ "$?" -eq 0 ]
then
echo "              User deleted successfully."
else
echo "              Failed to delete user."
fi
fi

elif [ "$choice" -eq 7 ]
then
:

else
echo ""
echo "              Invalid choice."
echo "              Please enter 1 - 7."
fi
done
}

# ==================================================
# 3. FILE AND DIRECTORY MANGEMENT
# ==================================================
file_dir_management(){
choice=0
while [ "$choice" -ne 7 ]
do
echo ""
echo "=================================================="
echo "        FILE AND DIRECTORY MANAGEMENT"
echo "=================================================="
echo ""
echo "              1. Create File"
echo ""
echo "              2. Create Directory"
echo ""
echo "              3. List Directory"
echo ""
echo "              4. Copy File"
echo ""
echo "              5. Move File"
echo ""
echo "              6. Delete File"
echo ""
echo "              7. Back to Main Menu"
echo ""
echo "=================================================="
echo "              Enter your choice:"
echo "=================================================="

read -r choice

if [ "$choice" -eq 1 ]
then
echo ""
echo "              Enter file path:"
read -r filepath

if [ -z "$filepath" ]
then
echo "              File path cannot be empty."
elif [ -e "$filepath" ]
then
echo "              File already exists."
else
touch "$filepath"

if [ "$?" -eq 0 ]
then
echo "              File created successfully."
else
echo "              Failed to create file."
fi
fi

elif [ "$choice" -eq 2 ]
then
echo ""
echo "              Enter directory path:"
read -r directory

if [ -z "$directory" ]
then
echo "              Directory path cannot be empty."
elif [ -e "$directory" ]
then
echo "              Path already exists."
else
mkdir -p "$directory"

if [ "$?" -eq 0 ]
then
echo "              Directory created successfully."
else
echo "              Failed to create directory."
fi
fi

elif [ "$choice" -eq 3 ]
then
echo ""
echo "              Enter directory path:"
read -r directory

if [ -d "$directory" ]
then
echo ""
echo "              Directory contents:"
ls -la "$directory"
else
echo "              Directory does not exist."
fi

elif [ "$choice" -eq 4 ]
then
echo ""
echo "              Enter source file:"
read -r source

echo "              Enter destination:"
read -r destination

if [ -f "$source" ]
then
cp "$source" "$destination"

if [ "$?" -eq 0 ]
then
echo "              File copied successfully."
else
echo "              Failed to copy file."
fi
else
echo "              Source file does not exist."
fi

elif [ "$choice" -eq 5 ]
then
echo ""
echo "              Enter source:"
read -r source

echo "              Enter destination:"
read -r destination

if [ -e "$source" ]
then
mv "$source" "$destination"

if [ "$?" -eq 0 ]
then
echo "              Item moved successfully."
else
echo "              Failed to move item."
fi
else
echo "              Source does not exist."
fi

elif [ "$choice" -eq 6 ]
then
echo ""
echo "              Enter file path:"
read -r filepath

if [ -f "$filepath" ]
then
rm "$filepath"

if [ "$?" -eq 0 ]
then
echo "              File deleted successfully."
else
echo "              Failed to delete file."
fi
else
echo "              File does not exist."
fi

elif [ "$choice" -eq 7 ]
then
:

else
echo ""
echo "              Invalid choice."
echo "              Please enter 1 - 7."
fi
done
}
# ==================================================
# 4. FILE PERMISSION AUDIT
# ==================================================

permission_audit() {
c=0
while [ "$c" -ne 7 ]
do
echo ""
echo "=================================================="
echo "              PERMISSION AUDIT"
echo "=================================================="
echo ""
echo "              1. Check File Permission"
echo ""
echo "              2. Check Directory Premission"
echo ""
echo "              3. Add Execute Permission"
echo ""
echo "              4. Remove Execute Permission "
echo ""
echo "              5. Check File owner"
echo ""
echo "              6. check File Details"
echo ""
echo "              7. Back to Main Menu"
echo ""
echo "=================================================="
echo "              Enter your choice:"
echo "=================================================="

read -r c

if [ "$c" -eq 1 ]
then
echo ""
echo "             Enter File Path: "
read -r path

if [ -f "$path" ]
then 
echo ""
echo "              File Permission:"
ls -l "$path" | tr -s ' ' | cut -d ' ' -f1 
else 
echo "              File dose not exist."
fi

elif [ "$c" -eq 2 ]
then 
echo ""
echo "               Enter the directory path:"
read -r dir

if [ -d "$dir" ]
then 
ls -ld "$dir" | tr -s ' ' | cut -d ' ' -f1 
else 
echo "              Directory dose not exist."
fi

elif [ "$c" -eq 3 ]
then 
echo ""
echo "              Enter file path:"
read -r path 

if [ -e "$path" ]
then
chmod u+x "$path"

if [ "$?" -eq 0 ]
then 
echo "             Execute permission added."
else 
echo "             Failed to change permission."
fi
else 
echo "             Path dose not exist."        
fi


elif [ "$c" -eq 4 ]
then 
echo ""
echo "              Enter file path:"
read -r path 

if [ -e "$path" ]
then
chmod u-x "$path"

if [ "$?" -eq 0 ]
then 
echo "             Execute permission removed."
else 
echo "             Failed to change permission."
fi
else 
echo "             Path dose not exist."        
fi


elif [ "$c" -eq 5 ]
then 
echo ""
echo "             Enter file path:"
read -r path

if [ -e "$path" ]
then 
echo "             File Owner:"
ls -l "$path" | tr -s ' ' | cut -d ' ' -f3
echo "             File Group:"
ls -l "$path" | tr -s ' ' | cut -d ' ' -f4

else 
echo "             File dose not exist."
fi

elif [ "$c" -eq 6 ]
then 
echo ""
echo "             Enter file path:"
read -r path

if [ -e "$path" ]
then 
ls -la "$path"
else 
echo "             File dose not exist."
fi

elif [ "$c" -eq 7 ]
then
:

else 
echo ""
echo "              Invalid choice."
echo "              Please enter 1- 7."

fi
done 
}

# ==================================================
# 5. TEXT ANALYSIS
# ==================================================

text_analysis() {
c=0
while [ "$c" -ne 7 ]
do
echo ""
echo "=================================================="
echo "              TEXT ANALYSIS"
echo "=================================================="
echo ""
echo "              1. Create sorted copy"
echo ""
echo "              2. Conut Lines"
echo ""
echo "              3. Search for text."
echo ""
echo "              4. Show the 10 first lines."
echo ""
echo "              5. Show the 10 last lines."
echo ""
echo "              6. Show unique lines."
echo ""
echo "              7. Back to Main Menu."
echo ""
echo "=================================================="
echo "              Enter your choice:"
echo "=================================================="

read -r c

case "$c" in
1)
echo ""
echo "             Enter file path:"
read -r path

if [ -f "$path" ]
then 
echo "              Enter output file:"
read -r out

sort "$path" > "$out"

if [ "$?" -eq 0 ]
then 
echo "              Sorted copy create successfully."
else
echo "              Failed to create a sorted copy."
fi
else 
echo "              File dose not exist."
fi
;;


2)
echo ""
echo "              Enter file path:"
read -r path 

if [ -f "$path" ]
then 
echo "              Number of lines :"
wc -l "$path"
else
echo "             File dose not exist."
fi
;;

3)
echo ""
echo "             Enter file path:"
read -r path 

if [ -f "$path" ]
then 
echo "              Enter text to search:"
read -r txt

grep "$txt" "$path"

if [ "$?" -eq 0 ]
then 
echo "              Search completed."
else 
echo "              Text was not found."
fi
else 
echo "             File dose not exist."
fi
;;

4)
echo ""
echo "             Enter file path:"
read -r path 

if [ -f "$path" ]
then 
echo "              First line :"
head "$path"

else 
echo "             File dose not exist."
fi
;;

5)
echo ""
echo "             Enter file path:"
read -r path 

if [ -f "$path" ]
then 
echo "              Last line :"
tail "$path"

else 
echo "             File dose not exist."
fi
;;

6)
echo ""
echo "             Enter file path:"
read -r path 

if [ -f "$path" ]
then 
echo "              Uniqe line :"
sort "$path" | uniq
else 
echo "             File dose not exist."
fi
;;

7)
;;

*)
echo ""
echo "              Invalid choice."
echo "              Please enter 1- 7."

;;
esac
done
}

# ==================================================
# 6. BACKUP MANAGEMENT
# ==================================================

backpu_management() {
backupdir="backups"
if [ ! -d "$backupdir" ]
then
mkdir "$backupdir"

fi
c=0
while [ "$c" -ne 5 ]
do
echo ""
echo "=================================================="
echo "              BACKUP MANAGEMENT"
echo "=================================================="
echo ""
echo "              1. Create Backup"
echo ""
echo "              2. Show Backup Files"
echo ""
echo "              3. Restore Backup."
echo ""
echo "              4. Delete Backup."
echo ""
echo "              5. Back to Main Menu."
echo ""
echo "=================================================="
echo "              Enter your choice:"
echo "=================================================="

read -r c

case "$c" in 
1)
echo ""
echo "               Enter file or directory to backup:"
read -r s

if [ -e "$s" ]
then
echo "              Enter the backup name:"
read -r name 

if [ -z "$name" ]
then 
echo "             Backup name cannot be empty."
else 
cp -r "$s" "$backupdir/$name"

if [ "$?" -eq 0 ]
then
echo "              Backup created successfully."
else 
echo "              Backup failed"
fi
fi
else
echo "              Source dose not exist."
fi
;;

2)
echo ""
echo "              Available backup:"
ls -la "$backupdir"
;;

3)
echo ""
echo "              Enter the backup name:"
read -r name 

if [ -e "$backupdir/$name" ]
then
echo "              Enter the restore destination:"
read -r d

cp -r "$backupdir/$name" "$d"

if [ "$?" -eq 0 ]
then
echo "              Backup restored successfully."
else 
echo "              Restored failed"
fi
else "              Backup dose not exist."
fi
;;

4)
echo ""
echo "              Enter the backup name:"
read -r name 

if [ -e "$backupdir/$name" ]
then
rm -r "$backupdir/$name" 

if [ "$?" -eq 0 ]
then
echo "              Backup deleted successfully."
else 
echo "              Failed to delete backup"
fi
else "              Backup dose not exist."
fi
;;

5)
;;

*)
echo ""
echo "              Invalid choice."
echo "              Please enter 1- 5."

;;
esac
done
}

# ==================================================
# 6. REPORT GENERATION
# ==================================================

report_generation() {

c=0
while [ "$c" -ne 5 ]
do
echo ""
echo "=================================================="
echo "              REPORT GENERATION"
echo "=================================================="
echo ""
echo "              1. Generate System Report."
echo ""
echo "              2. Generate User Report."
echo ""
echo "              3. Generate File Report."
echo ""
echo "              4. View Report."
echo ""
echo "              5. Back to Main Menu."
echo ""
echo "=================================================="
echo "              Enter your choice:"
echo "=================================================="

read -r c

case "$c" in 

1)
report="System_Report.txt"

echo "SYSTEM INFORMATION " > "$report"

echo "___________________"
echo "" >> "$report"
echo "Current User:" >> "$report"
whoami >> "$report"
echo "" >> "$report"
echo "Current Directory:" >> "$report"
pwd >> "$report"
echo "" >> "$report"
echo "Date:" >> "$report"
date >> "$report"
echo "" >> "$report"
echo "Operating System:" >> "$report"
uname -s  >> "$report"
echo "" >> "$report"
echo "Kernel Release:" >> "$report"
uname -r  >> "$report"
echo "" >> "$report"
echo "Machine Architecture:" >> "$report"
uname -m  >> "$report"
echo "" >> "$report"
echo "              System report generated:"
echo "              $report"
;;


2)
report="User_Report.txt"

echo "USER INFORMATION " > "$report"
echo "___________________"
echo "" >> "$report"
echo "Current User:" >> "$report"
whoami >> "$report"
echo "" >> "$report"
echo "User Group:" >> "$report"
groups >> "$report"
echo "" >> "$report"

echo ""
echo "              User report generated:"
echo "              $report"
;;

3)
echo ""
echo "               Enter file path:"
read -r path

if [ -f "$path" ]
then 
report=file_report.txt
echo "File INFORMATION " > "$report"
echo "___________________"
echo "" >> "$report"

echo "File:" >> "$report"
echo "$path" >> "$report"
echo "" >> "$report"

echo "File Detailse:" >> "$report"
ls -l "$path" >> "$report"
echo "" >> "$report"

echo "Line Count:" >> "$report"
wc -l "$path" >> "$report"

echo ""
echo "              File report generated:"
echo "              $report"
else 
echo "              File dose not exist."
fi
;;

4)
echo ""
echo "              Enter report filename:"
read -r report

if [ -f "$report" ]
then
echo ""
echo "_______________________________________"
cat "$report"
echo "_______________________________________"
else 
echo "                Report dose not exist."
fi
;;

5)
;;

*)

echo ""
echo "              Invalid choice."
echo "              Please enter 1- 5."

;;
esac
done
} 
choice=0
while [ "$choice" -ne 8 ]
do
echo ""
echo "=================================================="
echo "              LINUX ADMIN DASHBOARD"
echo "=================================================="
echo ""
echo "              1. System Information"
echo ""
echo "              2. User & Groups"
echo ""
echo "              3. File and Directory Management"
echo ""
echo "              4. Permission Audit"
echo ""
echo "              5. Text Analysis"
echo ""
echo "              6. Backup Management"
echo ""
echo "              7. Report Generation"
echo ""
echo "              8. Exit"
echo ""
echo "=================================================="
echo "              Enter your choice:"
echo "=================================================="

read -r choice

if [ "$choice" -eq 1 ]
then
system_information

elif [ "$choice" -eq 2 ]
then 
users_groups

elif [ "$choice" -eq 3 ]
then 
file_dir_management

elif [ "$choice" -eq 4 ]
then 
permission_audit

elif [ "$choice" -eq 5 ]
then 
text_analysis

elif [ "$choice" -eq 6 ]
then 
backpu_management

elif [ "$choice" -eq 7 ]
then 
report_generation

elif [ "$choice" -eq 8 ]
then
echo ""
echo "=================================================="
echo "              Thank you for using"
echo "              Linux Admin Dashboard"
echo "=================================================="
echo ""

else
echo ""
echo "              Invalid choice."
echo "              Please enter a number from 1 - 8."
fi
done
