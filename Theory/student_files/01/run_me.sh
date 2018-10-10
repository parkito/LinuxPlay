#!/bin/bash
set -e

grep deploy /etc/passwd || useradd -m deploy
grep deploy /etc/sudoers || echo 'deploy ALL=(ALL:ALL) NOPASSWD:ALL' >> /etc/sudoers
visudo -c
[ -d /home/deploy/.ssh ] || mkdir -v /home/deploy/.ssh
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vagrant insecure public key' > /home/deploy/.ssh/authorized_keys
chown -Rv deploy:deploy /home/deploy/.ssh
chmod -v 700 /home/deploy/.ssh
chmod -v 600 /home/deploy/.ssh/authorized_keys
yum -y install httpd iptables-services git net-snmp net-snmp-utils
git clone https://github.com/gabrielecirulli/2048.git
cp -Rv 2048/* /var/www/html
cat > /etc/snmp/snmpd.conf << EOL
syslocation Server Room
syscontact SysAdmin (devops@example.com)
rocommunity snmp_secret_rocommunity
EOL
systemctl start httpd snmpd
systemctl enable httpd snmpd
iptables -A INPUT -m tcp -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -m udp -p udp --dport 161 -j ACCEPT
