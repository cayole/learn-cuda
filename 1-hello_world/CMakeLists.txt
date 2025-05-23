cmake_minimum_required(VERSION 3.10)
project(hello_world LANGUAGES CXX CUDA)  # 明确启用 CUDA 语言

# 添加 CUDA 源码（确保 hello_world.cu 文件存在）
add_executable(hello_world hello_world.cu)

# 可选：指定 CUDA 架构（例如针对 NVIDIA GPU 计算能力）
set(CMAKE_CUDA_ARCHITECTURES "native")  # 自动检测当前 GPU
# 或手动指定（例如针对 Volta 架构）
# set(CMAKE_CUDA_ARCHITECTURES "70")