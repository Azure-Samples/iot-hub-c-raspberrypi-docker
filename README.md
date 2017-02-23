
# Docker based Raspberry Pi C tutorial

In this tutorial, you begin by learning the basics of working with Raspberry Pi 3 that's running Raspbian. You then learn how to build C source code on host machine in a cross-compliation way. Last but most important, you learn how to deploy built binaries to Pi and how to do remote debugging. 

## Configure your device

Go to [Configure your device](https://docs.microsoft.com/en-us/azure/iot-hub/iot-hub-raspberry-pi-kit-c-lesson1-configure-your-device) page and setup your Pi for first-time use.

## Get the tools (Mac OS X 10.10)

### Install Git
To install Git, use the [Homebrew](http://brew.sh) package management utility by following these steps:

1. Install Homebrew. If you've already installed Homebrew, go to step 2.
   
   1. Press `Cmd + Space` and enter `Terminal` to open a terminal.
   2. Run the following command:
      
      ```bash
      /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
      ```
2. Install Git by running the following command:
   
   ```bash
   brew install git
   ```

### Install Docker
Got to [Docker website](https://www.docker.com/). Scroll down and find the `Get Docker for Mac` link. Click it for download and installation.

### Install Visual Studio Code

> [!NOTE]
> You can skip this step if you don't want to do remote debugging.

[Download](https://code.visualstudio.com/docs/setup/osx) and install Visual Studio Code. Visual Studio Code is a lightweight but powerful source code editor for Windows, Linux, and macOS.

Open VS Code and install extension named `C/C++`. If you have already installed it, please make sure you're using the latest version.

## Build C code using Docker

## Deploy and debug the built app

## Contributing
This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/). For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.
