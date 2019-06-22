# Install epel-release
yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

# Install GIT
yum -y install git

# Install yum utils (in case it is not available by default)
yum -y install yum-utils

echo -e "\n--- Installing EPEL Release ---\n"
yum install -y epel-release
echo -e "\n--- Installing Additional Core Libraries ---\n"
yum install -y openssl-devel wget zip unzip
yum install -y git
yum install -y net-tools
yum install -y nmap # For port debugging

echo -e "\n--- Disabling SELinux ---\n"
setenforce 0
sed -i 's/SELINUX=enforcing/SELINUX=disabled/' /etc/sysconfig/selinux
sed -i 's/SELINUX=enforcing/SELINUX=disabled/' /etc/selinux/config
sestatus
