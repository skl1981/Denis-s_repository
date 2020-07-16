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










