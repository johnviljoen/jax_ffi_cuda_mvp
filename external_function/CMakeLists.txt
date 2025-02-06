# initial setup
cmake_minimum_required(VERSION 3.15...3.30)
set(SKBUILD_PROJECT_NAME "temp")
project(${SKBUILD_PROJECT_NAME} LANGUAGES CXX)

# Explicitly set the CUDA compiler path
# set(CMAKE_CUDA_COMPILER "/usr/local/cuda/bin/nvcc")
enable_language(CUDA)
find_package(CUDAToolkit REQUIRED)

# setup xla dir
find_package(Python 3.13 REQUIRED COMPONENTS Interpreter Development.Module)
execute_process(
  COMMAND "${Python_EXECUTABLE}"
          "-c" "from jax import ffi; print(ffi.include_dir())"
  OUTPUT_STRIP_TRAILING_WHITESPACE OUTPUT_VARIABLE XLA_DIR)
message(STATUS "XLA include directory: ${XLA_DIR}")

add_library(_cuda_examples SHARED "cuda_example.cu")
set_target_properties(_cuda_examples PROPERTIES POSITION_INDEPENDENT_CODE ON
                                                CUDA_STANDARD 17)
target_include_directories(_cuda_examples PUBLIC ${XLA_DIR})
install(TARGETS _cuda_examples LIBRARY DESTINATION ${SKBUILD_PROJECT_NAME})

