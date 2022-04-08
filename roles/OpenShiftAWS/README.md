Try these instructions

https://github.com/debianmaster/openshift-examples/tree/master/origin-on-aws-single-node

Modified as follows

sudo su
yum -y install docker wget
#sed -i '/OPTIONS=.*/c\OPTIONS="--selinux-enabled --insecure-registry 172.30.0.0/16"' /etc/sysconfig/docker
sed -i '/OPTIONS=.*/c\OPTIONS="--insecure-registry 172.31.0.0/16"' /etc/sysconfig/docker
# Change the 172.31 accordingly

systemctl restart docker

docker ps

wget https://github.com/openshift/origin/releases/download/v3.7.0/openshift-origin-client-tools-v3.7.0-7ed6862-linux-64bit.tar.gz

tar -xvf tar -xvf openshift-origin-client-tools-v3.7.0-7ed6862-linux-64bit.tar.gz
mv openshift-origin-client-tools-v3.7.0-7ed6862-linux-64bit/oc /usr/bin/

oc cluster up --public-hostname='63.32.97.183' --routing-suffix='63.32.97.183'
#OR
#openshift start --public-master='https://63.32.97.183:8443' --master='https://63.32.97.183:8443' --listen='https://0.0.0.0:8443'

iptables -I INPUT -p tcp -m tcp --dport 8443 -j ACCEPT

