#include <stdio.h>

// 使用 __global__ 关键字定义 CUDA 内核函数（在 GPU 上执行）
// 此函数会被多个线程并行调用
__global__ void hello_world(void) { printf("GPU: Hello world!\n"); }

int main(int argc, char **argv) {
  printf("CPU: Hello world!\n");

  // 调用 CUDA 内核函数
  // 执行配置 <<<网格维度, 线程块维度>>>：此处启动 1 个线程块，每个块有 10
  // 个线程
  hello_world<<<1, 10>>>();

  // 清理 GPU 资源（重置当前设备，释放所有分配的内存）
  // 这句话包含了隐式同步，GPU和CPU执行程序是异步的，核函数调用后成立刻会到主机线程继续，而不管GPU端核函数是否执行完毕，所以上面的程序就是GPU刚开始执行，CPU已经退出程序了，所以我们要等GPU执行完了，再退出主机
  cudaDeviceReset();
  return 0;
}