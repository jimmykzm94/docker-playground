# TFLite build

## Description
There are currently no official documents available for this setup, aside from various online tutorials used to get started.

This repository has only a main branch to get me started and it lacks structured version control for releases. Since the architecture may change frequently, cloning and building directly on the host system or a virtual machine is not ideal. Instead, the build process is done inside a Docker container.

The steps below is done for my STM32 NUCLEO-F446RE board.

## Steps
### 1. Start from scratch
1. Run the image interactively, I am using Ubuntu 20.04.
```sh
docker run -it --name tflite_build ubuntu:20.04 /bin/bash
```
2. Update and install dependencies
```sh
apt-get update && apt-get install -y

apt install build-essential git curl \
unzip tar gcc-arm-none-eabi wget \
python3 python3-pip -y
```
3. Install Python dependencies
```sh
pip3 install numpy Pillow
```
4. Clone the repository
```sh
git clone https://github.com/tensorflow/tflite-micro
```
5. Build the Tensorflow Lite Micro libs(for M4)
```sh
make -C tflite-micro -f tensorflow/lite/micro/tools/make/Makefile \
TARGET=cortex_m_generic \
TARGET_ARCH=cortex-m4+fp \    
OPTIMIZED_KERNEL_DIR=cmsis_nn \
microlite

python3 tensorflow/lite/micro/tools/project_generation/ \
create_tflm_tree.py tflm_tree
```
6. Copy libs from container to local filesystem project

```sh
docker cp tflite_build:/app/tflite-micro/tflm_tree lib/tflm_tree
```

### 2. Export as tarball
My container name is `tflite_build`, so use the command:
```sh
docker export tflite_build > tflite_build_m4_v1.0.tar 
```
Note that I use v1.0 to indicate it as my first copy.

### 3. Import from tarball
I never try this before :) but it should work.
```sh
docker import tflite_build new_image_name:tag
```

### 4. Run interactively
Now you can build based on other configurations. Well done.

## Reference
https://medium.com/@switches0011/getting-started-with-embedded-ai-tinyml-stm32-nucleo-l476rg-with-tensorflow-lite-micro-6476deb6fe5f