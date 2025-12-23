#include <cstdio>
#include <cuda_runtime.h>

__global__ void hello_from_gpu() {
    printf("Hello World from GPU!\n");
}

int main() {
    hello_from_gpu<<<1, 1>>>();

    // Force the GPU to finish and flush printf output
    cudaError_t err = cudaDeviceSynchronize();
    if (err != cudaSuccess) {
        printf("Kernel failed: %s\n", cudaGetErrorString(err));
    }

    printf("Hello World from CPU!\n");
    return 0;
}
