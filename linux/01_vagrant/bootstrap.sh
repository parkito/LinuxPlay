sudo yum update -y
sudo yum install mc -y
sudo dnf install -y https://www.elrepo.org/elrepo-release-8.el8.elrepo.noarch.rpm
sudo rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
sudo dnf makecache
sudo dnf --enablerepo="elrepo-kernel" install -y kernel-ml
