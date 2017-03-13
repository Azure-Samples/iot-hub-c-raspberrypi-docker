# sysroot is generated at /root/rpi/chroot-raspbian-armhf
mkdir -p /root/rpi
cd /root/rpi

qemu-debootstrap --variant buildd --include wget --arch armhf jessie chroot-raspbian-armhf http://archive.raspbian.org/raspbian

mount -t proc proc /root/rpi/chroot-raspbian-armhf/proc
mount -t sysfs sysfs /root/rpi/chroot-raspbian-armhf/sys
mount -o bind /dev /root/rpi/chroot-raspbian-armhf/dev

# Add the Raspbian repo and set up a GPG key.
chroot /root/rpi/chroot-raspbian-armhf  bash -c 'echo "deb http://archive.raspbian.org/raspbian jessie main contrib non-free rpi" > /etc/apt/sources.list'
chroot /root/rpi/chroot-raspbian-armhf  bash -c 'wget http://archive.raspbian.org/raspbian.public.key -O - | apt-key add -'
chroot /root/rpi/chroot-raspbian-armhf  bash -c 'apt-get update'

# For installing azure iot sdk
chroot /root/rpi/chroot-raspbian-armhf  bash -c 'echo "deb http://ppa.launchpad.net/aziotsdklinux/ppa-azureiot/ubuntu vivid main" >> /etc/apt/sources.list'
chroot /root/rpi/chroot-raspbian-armhf  bash -c 'echo "deb-src http://ppa.launchpad.net/aziotsdklinux/ppa-azureiot/ubuntu vivid main" >> /etc/apt/sources.list'
chroot /root/rpi/chroot-raspbian-armhf  bash -c 'apt-key adv --keyserver keyserver.ubuntu.com --recv-keys FDA6A393E4C2257F'
chroot /root/rpi/chroot-raspbian-armhf  bash -c 'apt-get update'
chroot /root/rpi/chroot-raspbian-armhf  bash -c 'apt-get install -y azure-iot-sdk-c-dev'

#For installing wiringpi
chroot /root/rpi/chroot-raspbian-armhf  bash -c 'echo "deb http://archive.raspberrypi.org/debian/ jessie main ui" >> /etc/apt/sources.list.d/raspi.list'
chroot /root/rpi/chroot-raspbian-armhf  bash -c 'wget http://archive.raspberrypi.org/debian/raspberrypi.gpg.key -O - | apt-key add -'
chroot /root/rpi/chroot-raspbian-armhf  bash -c 'apt-get update'
chroot /root/rpi/chroot-raspbian-armhf  bash -c 'apt-get install -y wiringpi'
