# create dir to store binaries in
mkdir _build

# create makefile from cmakelist
cmake -DCMAKE_BUILD_TYPE=Release -B _build .

# make targets from make file
cd _build
make all
cd ..