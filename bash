1.	Search yum repository for openjdk package. 
yum search openjdk
2.	Install openjdk package from yum repo.
sudo yum install java-11-openjdk
yum list installed | grep java-11
3.	Install following package using rpm 
https://copr-be.cloud.fedoraproject.org/results/harbottle/main/epel-7-x86_64/01518633-kops/kops-1.17.1-1.el7.harbottle.x86_64.rpm
sudo rpm -ihv https://copr-be.cloud.fedoraproject.org/results/harbottle/main/epel-7-x86_64/01518633-kops/kops-1.17.1-1.el7.harbottle.x86_64.rpm
4.	Search yum repo for htop package. Note empty output. 
yum search htop
- install epel-release yum package.
sudo yum install epel-release
- search yum repo for htop package.
yum search htop
- install and run htop.
sudo yum install htop
5.	Set up docker-ce repository (refer official docker guide for centos).
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
-  list all available versions of docker-ce package. 
yum list docker-ce
- install exactly 18.06.1 version of docker-ce.
sudo yum install docker-ce-18.06.01.ce-3.e17
6.	List available systemd unit files.
systemctl list-unit-files
- note unit file for docker
systemctl list-unit-files | grep docker
7. Find where this unit file is located on a filesystem. View it with less. 
cat docker.service
8. Check if docker unit is enabled or not? Disable or enable it depending on initial status.
systemctl status docker.service
systemctl enable docker.service
systemctl start docker.service
9.	Uninstall docker-ce package.
sudo yum remove docker-ce

1.	Users and groups (commands and listing)
a.	Create user and group with the same name - <name_surname>. User id must be 9000 and group id - 7000. User should have /bin/sh as a default shell. Set password for user with useradd.
sudo groupadd test_user -g 7000
sudo useradd -u 9000 -g 7000 test_user -s /bin/sh -p hash_password
Create group students. Add user to group students.
sudo usermod -a -G student test_user

2.	Sudo (listing and screenshot of line from sudoers)
a.	Switch to user <name_surname> using su.
Only after changing the password manually, I was been able to login with username “test_user”
su test_user
sudo passwd test_user
3. Run fdisk -l. Note the error you've got. Why this happened? 
fdisk -l
b.	Grant this user permission to run ONLY fdisk command as root.  Run fdisk -l again and check output. 
vi /etc/sudoers
test_user ALL=/usr/sbin/fdisk
c.	Adjust sudoers configuration to run fdisk command without password prompt.
test_user ALL=(ALL) NOPASSWD:/sbin/fdisk
3.	Permissions
a.	Create directory ~/test. Create file myfile inside directory test. Write module name to myfile. Change myfile permissions to 0555.
mkdir test
touch myfile
chmod 0555 myfile
4.Sticky bit
g.	As a root user create folder /sticky with permissions 0777. As a root user create file delete_me inside /sticky folder. Check folder and file permissions.
mkdir -m 0777 sticky
touch ./sticky delete_me
h.	Switch to user <name_surname>. Try to delete file delete_me
su test_user 
rm delete_me
ls -li.	
As a root user create file delete_me inside /sticky folder. Set sticky bit on folder /sticky
touch delete_me
chmod 2555 sticky
a.	Create second root user named root2. Switch to root2 and ensure it has same privileges as root
useradd -o -u 0 -g 0 Root2
id Root2
6	Check selinux status. 
getenforce
b.	Enable or disable it depending on initial status.
cat /etc/selinux/config
a.	Create file test1. Set immutable flag on it. Try to delete it.
sudo chattr +i file1
c.	Fix an issue and delete the file. 
sudo chattr -i file1
1.	Change VM hostname to <name_surname_vm>. Reboot VM, check that hostname stays the same. Screenshot with hostname configuration.
hostnamectl set-hostname denis_skakalski_CentOS
systemctl restart sytemd-hostnamed

2.	Generate SSH keypair with names name_surname_key and name_surname_key.pub. Key length should be 4096, key comment "name surname personal key". Make sure there is no password promt during key generation. View generated files. 
Screenshot with ssh-keygen command.
ssh-keygen -t rsa -b 4096 -C "denis_skakalski_peronal_key" -f ~/.ssh/denis_skakalski

ls ~/.ssh

3.	Add generated pub key to authorized keys of root user.
cat ~/.ssh/denis_skakalski.pub | ssh root@192.168.137.18 "mkdir -p ~/.ssh && chmod 700 ~/.ssh && cat >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys"
Try ssh -i ~/.ssh/denis_skakalski root@localhost. 
ss | grep ssh
5.	Write SSH config to connect to localhost as root user using command "ssh mylovelyhost". 
cat ~/.ssh/config
Host mylovelyhost
HostName 192.168.137.18
User denis_skakalski
Port 22
IdentityFile ~/.ssh/authorized_keys

a.	Install httpd on VM2. 
yum install httpd
Configure it to listen to 127.0.0.1 (loopback interface). 
cat /etc/httpd/conf/httpd.conf | grep Listen

d.	Setup SSH tunnel from port 8888 on VM1 to port 80 on VM2. 
ssh -N -p 22 denis_skakalski2@192.168.137.19 -L 8888:192.168.137.19:80

1.	Check disk usage with df.
df
 Check free inodes.
df -i
2.	Create files test1 (1K), test2 (1M), test3 (10M). 
dd if=/dev/zero of=test1 bs=1024 count=1
Check file sizes with ls, du. 
du -ah
ls -lh

3.	Install stress utility.
4.	Run stress to load CPU. 
stress --cpu 8
Check processes threads. (screenshot)
top -H
5.	Run stress to load Memory. 
stress --vm 4 --vm-bytes 512M

Run stress to load Disk. 
stress --hdd 1

iostat 1
6.	List open files of ssh daemon. 
lsof -c sshd
Check current network connections with lsof
lsof -i -P -n
7.	Check dmesg options and output.
dmesg -T
8.	Install docker service. Using journalctl check docker logs for last hour, 
journalctl -t dockerd --since "1 hour ago"
9.	Check user logons statistics with lastlog.
lastlog | grep pts
10.	Check audit log.
cat /var/log/audit/audit.log | less

2.	Create a copy of /etc/passwd file to /root/passwd_awk.copy. 
cp /etc/passwd /root/passwd_awk.copy

Change shell for user games from /sbin/nologin to /bin/bash using awk. (awk script, screenshot of result and execution)
awk -F: '{if($1 == "games") sub("/sbin/nologin","/bin/bash");print}' /root/passwd_awk.copy | tee /root/passwd_awk.copy

Change shell for user games from /sbin/nologin to /bin/bash using sed. (sed script, screenshot of result and execution)

sed -i '/games/s/\/sbin\/nologin/\/bin\/bash/g' /root/passwd_sed.copy

4.	Write a command that will print only user/pid/command columns from “ps aux” output using sed or awk. Screenshot of result and execution

ps aux | awk '{print $2}'

5.	Write a command that will print only 1st and 2nd parts of string based on “:” delimiter (for /etc/passwd). Attach command and screenshot of result and execution.
cat /etc/passwd | awk -F: '{print $1,$2}'

6.	Write a command that will remove all lines from file containing word games( for /etc/passwd). Attach command and screenshot of result and execution.
sed -i '/games/d' /etc/passwd

 Change shell for all users with even uid to /bin/bash. Attach command and screenshot of result and execution.

awk -F: '{if ($3 % 2 == 0) sub ("/sbin/nologin","/bin/bash");print}' /root/passwd.copy | tee /root/passwd.copy

a.	Replace two or more of the character e in a row with the string alala.
sed 's/ee\+/alala/g' 8.txt

b.	Replace every period (.) at the end of a line with an exclamation point (!)
sed '/^$/d' 8.txt

c.	Remove empty lines
sed '/^$/d' 8.txt


1.	Create a script Name_Surname.sh (replace with your name and surname)
2.	Script should be executable with bash
3.	Script should not stop execution if it encounters errors
4.	Script should do the following:
a.	Have NAME and SURNAME variables (values are your name and surname)
b.	Have FAIL variable
c.	Have ARRAY array variable containing letters of your surname 
d.	Create folder in home directory (~) with your name and surname using variables
e.	Create 3 files of the following sizes in NAME_SURNAME folder named after ARRAY variable elements: 1st element(1KiB), 2nd element (1MiB), last element (10MiB).
Each file must have size that is specified in brackets. Sizes are specified in KiB and MiB (1024 based).
f.	search home (~) directory for all files modified in last 1h and output those file(s) names into your NAME_SURNAME folder search.log file
g.	Add 1st and 2nd files created in task e to ~/archive.tar
h.	Append 3rd file created in task e to ~/archive.tar
i.	Remove files created in task e
j.	Unarchive ~/archive.tar into home (~) folder
k.	Exit with exit code 3 if FAIL variable equals true, exit with exit code 2 if FAIL variable equals false, exit with exit code 0 if FAIL variable is not set 

#!/bin/bash
set +e # but +e is the default value as well

while getopts n:s:f: option # there we are assigning the variables, while executing tha script
do
case "${option}" in
n) NAME=${OPTARG};
;;
s) SURNAME=${OPTARG};
;;
f) FAIL=${OPTARG};
;;
esac
done
ARRAY=( s k a k a l s k i) # the array assignement
mkdir ~/${NAME}_${SURNAME}
dd if=/dev/zero of=${NAME}_${SURNAME}/${ARRAY[0]} bs=1024 count=1
dd if=/dev/zero of=${NAME}_${SURNAME}/${ARRAY[1]} bs=1024 count=1024
dd if=/dev/zero of=${NAME}_${SURNAME}/${ARRAY[-1]} bs=1024 count=10240
find -type f -mmin -60 > /${NAME}_${SURNAME}/search.log
tar cvf archive.tar -P /${NAME}_${SURNAME}/${ARRAY[0]} /${NAME}_${SURNAME}/${ARRAY[1]}
tar rfv archive.tar -P ~/${NAME}_${SURNAME}/${ARRAY[-1]}
rm -f ~/${NAME}_${SURNAME}/${ARRAY[0]}
rm -f ~/${NAME}_${SURNAME}/${ARRAY[1]}
rm -f ~/${NAME}_${SURNAME}/${ARRAY[-1]}
tar xf ~/archive.tar --strip-component=2 -P
if [ $FAIL = "true" ];
then
exit 3
elif [ $FAIL = "false" ];
then
exit 2
else
exit 0
fi


1.	Create a script Name_Surname.sh (replace with your name and surname)
2.	Script should be executable with bash
3.	Script should do the following:
4.	
a.	Have SURNAME array variable containing letters of your surname 
b.	Create NAME_SURNAME folder in your home (~) directory
c.	Function “makefile” that takes two arguments (size, filename) and creates file $filename of $size size in current directory
d.	Create any loop that iterates over SURNAME variable excluding the last element and calls “makefile” function passing loop index as size in megabytes and array element as filename to create files in NAME_SURNAME folder
5.	Create length(SURNAME) * 2 folders named 1, 2, 3, 4, 5, … length of array SURNAME multiplied by 2 in NAME_SURNAME folder using any loop
6.	Create a command that runs the above script while redirecting ALL output to ~/output.log file

#!/bin/bash
host=$0
k=${host:8:9}

for ((i=0;i < ${#k}; i++ ))
do
SURNAME[$i]=${k:$i:1}
done

mkdir ~/${host:2:15}
makefile ()
{
truncate -s $1M $2
}
for ((d=0;d < ${#SURNAME[@]}-1; d++ ))
do
cd ~/${host:2:15} && makefile $d ${SURNAME[d]}
done

for ((e=1;e <= ${#SURNAME[@]}*2; e++ ))
do
cd ~/${host:2:15} && mkdir $e
done















