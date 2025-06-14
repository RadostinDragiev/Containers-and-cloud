# Prints the current used user
whoami

# Prints the OS information
uname -a

# Lists all the processes that are started
top

# Lists all the processes that are started with 5 seconds refresh delay, 2 times
top -n 5 -d 2

# Prints information for the processor
cat /proc/cpuinfo

# Prints the current working directory
pwd

# Lists the files and directories in the current working directory
ls

# Lists the files and directories in the current working directory that are hidden
ls -la

# Lists all files, including hidden ones, with detailed information.
ls -all

# Lists all hidden files and folders
ls -a

# List all files(example: directories)
ls /

# Change directory
cd

# File types
    # d => Directory
    # l => Link/Shortcut
    # - => File
    # b => Block
    # c => Character
    # p => FIFO pipe
    # s => Local socket

# Create directory with name directory1
mkdir directory1

# Create directory with name directory2 and create directory with name directory3 inside of it
mkdir -p directory2/directory3

# Create file with name file1
touch file1

# Copy file1 to directory1(does not delete the file, only create a copy of it inside)
cp file1 directory1

# Move file1 to directory1
mv file1 directory1

# Delete file/directory
rm file1

# Read first 2 lines of a file
head -n 2 file1.txt

# Read last 2 lines of a file
tail -n 2 file1.txt

# Read data from a file
cat file1.txt

# Edit file
vi file1.txt

# Redirect output(stdout or stderr) and replace the content
echo Hello > hello.txt

# Redirect output(stdout or stderr) and add to already existing conent
echo Hello >> hello.txt

# Prints current date and time
date

# Prints current date in format
date +%Y-%m-%d

# Prints 3 month(previous, current and next)
cal -3

# Prints since when/ how long the system is operating
uptime

# Lists history of commands
history

# Exit the session
exit
# or
logout

# Prints all files staring with 'os'
cd /etc
ls os*

# Prints detailed infromation about current distribution
cd /etc
cat os-release

# Prints output code of previous command
echo $?

# Sequence of comands
cat file.txt ;  echo OK

# Pipe of commands(read file.txt then sort it and then show me first 3 lines)
cat file.txt | sort | head -n 3

# Locigal AND(read file.txt AND print OK, if first command fail then second won't be executed)
cat file.txt && echo OK

# Logical OR(read file.txt OR print OK, if first command fail then second will be executed)
cat file123.txt || echo OK

# Lists all the user on the system
cat /etc/passwd

# Add user
adduser someName

# Swtich to user
su - someName

# Lists all groups
cat /etc/group

# Change rights to file.txt(everyone can read and execute, using the octal mask)
cmod 755 file.sh

# Change owner of a file
chown user file.txt

# Change group of a file
chgrp group file.txt

# Change owner of a file and it's group
chown user:group file.txt

# Alternative commands
    # set all right to user
    chmod u+rwx file.txt

    # set all right to group
    chmod g+rwx file.txt

    # remove all right to user
    chmod u-rwx file.txt

    # remove all right to group
    chmod g-rwx file.txt
# Lists all environment variabls
env

# Check value from environment variable key
echo $DOCKER_VERSION

# Creates environment varable
export MY_VARIABLE=12345678

# Connect with SSH
ssh 162.168.0.8

# Lists all jobs
jobs

# Create sleep job for 10 seconds
sleep 10

# Create sleep job for 10 seconds on background
sleep 10 &

# Kill job
kill -9 [PID]

# Terminate job
kill -15 [PID]

# Install nano package inside the system(For Ubuntu based contributions)
apt install nano
#or
apk add nano

# Update apt/apk (empty(all) or for certain package)
apt update
apk update

# Upgrade apt/apk (empty(all) or for certain package)
apt upgrade
apk upgrade

# Downloadn locally file
wget [url]

# Get data from url
curl https://www.google.com/intl/en-US/gmail/about/