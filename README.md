# minimal jax.ffi cuda example

To install

1. git clone https://github.com/openxla/xla.git
2. cd external_function
3. conda create -n test python=3.13 pip
4. conda activate test
5. pip install -e .
6. ./build.sh

To run

python external_function/cuda_example_test.py