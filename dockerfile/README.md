# Notes for the Docker file
This `dockerfile` folder is self-contained and it's the open source of Docker image `microsoft/iot-hub-c-raspberrypi-build`, which includes Raspbian sysroot and cross compiler that builds Raspberry Pi C code on your host machine while the built binaries can run on Pi device.

## How to build Docker image

1. Change working directory to `dockerfile` folder.
2. Run below command to build the docker image. `your-temp-docker-name` is the name you want to name Docker.

   ```bash
   docker build -t your-temp-docker-name -f dockerfile .
   ```

3. Run the Docker image you just built with the first command. `f2a9a8d4ef8e` is the container id of the Docker image. Your container id should be different. Then, run the `init.sh`, which generates Raspbian system root and installs necessary packages. Run `exit` to exit the container once `init.sh` is done.

   ```bash
   docker run --privileged -it your-temp-docker-name
   root@f2a9a8d4ef8e:/# ./init.sh
   root@f2a9a8d4ef8e:/# exit
   ```
4. Save the container as the final image. 'your-final-image-name' is the final image you want to name it.

   ```bash
   docker commit f2a9a8d4ef8e your-final-image-name
   ```

## Docker image layout

* The sysroot is under `/root/rpi/chroot-raspbian-armhf` folder.
* The cross compiler is under `/gcc-linaro-arm-linux-gnueabihf-raspbian-x64` folder.

## Customize the Docker image

If you want to include more packages for your build purpose, change the last line of `init.sh`, where Raspbian packages are installed. Right now, only `wiringpi` package is specifically installed. Build-essential packages are also installed, which is achieved by applying the debootstrap option `--variant buildd`.

If you want to do a more deep customization, you can go through `dockerfile`, `build.sh` and `init.sh`, and help yourself. :)
