#!/bin/bash -e
dpkg-divert --local --rename --add /sbin/initctl;
ln -s /bin/true /sbin/initctl;
echo "en_US.UTF-8 UTF-8" >> /var/lib/locales/supported.d/local;
locale-gen en_US en_US.UTF-8;
dpkg-reconfigure locales;
echo 'ALL ALL=(ALL) NOPASSWD:ALL' | tee -a /etc/sudoers;

echo "================== Adding empty known hosts file =============="
mkdir -p /root/.ssh;
touch /root/.ssh/known_hosts;

echo "================= Installing core binaries ==================="
apt-get update;
apt-get install -yy python-dev software-properties-common;
add-apt-repository -y ppa:ubuntu-toolchain-r/test;
apt-get update

echo "deb http://archive.ubuntu.com/ubuntu trusty main universe restricted multiverse" > /etc/apt/sources.list;
apt-get install -yy g++-4.9 wget texinfo sudo git-core python-pip;


echo "================= Installing Node ==================="
add-apt-repository ppa:chris-lea/node.js;
apt-get update;
apt-get install -y nodejs;

npm install -g grunt grunt-cli body-parser@~1.12.0 cookie-parser@~1.3.4 cors@>2.7.1 debug@~2.1.1;
npm install -g express@~4.12.2 express-session@>1.11.2 method-override@>2.3.3 morgan@~1.5.1;
npm install -g request@~2.55.0 sync-request@2.0.1 winston@>1.0.1;


echo "================= Create gclould folders ============"
mkdir -p /opt/gcloud

echo "================== Creating demo base folders =============="
mkdir -p /root/demobase
