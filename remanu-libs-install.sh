#! /usr/bin/env bash

apt-get -y install libamd2 libarpack2-dev libblas-dev libblas3 libbtf1 libcamd2 \
                   libccolamd2 libcholmod3 libcolamd2 libcxsparse3 libeigen3-dev libfftw3-bin \
                   libfftw3-dev libfftw3-long3 libfftw3-mpi-dev libfftw3-mpi3 libfftw3-quad3 libfftw3-single3 \
                   libgraphblas1 libhdf5-mpi-dev libhdf5-openmpi-dev libhypre-2.13.0 \
                   libhypre-dev libklu1 libldl2 libmetis5 libmumps-5.1.2 libmumps-dev \
                   libparpack2 libparpack2-dev libpetsc3.7.7 libpetsc3.7.7-dev libproj-dev \
                   libptscotch-6.0 libptscotch-dev librbio2 libscalapack-mpi-dev \
                   libscalapack-openmpi-dev libscalapack-openmpi2.0 libscotch-6.0 libscotch-dev \
                   libslepc3.7.4 libslepc3.7.4-dev libspooles-dev libspooles2.2 libspqr2 \
                   libsuitesparse-dev libsuitesparseconfig5 libsuperlu-dev libsuperlu-dist5 \
                   libtet1.5 libumfpack5 python3-mpi4py python3-mpmath \
                   python3-petsc4py python3-pkg-resources python3-pkgconfig \
                   python3-ply python3-six python3-slepc4py python3-sympy

mkdir /content/packages

cd /content/packages && git clone https://github.com/pybind/pybind11.git
cd /content/packages/pybind11 && git checkout v2.2.4 && mkdir build
cd /content/packages/pybind11/build && cmake -DPYBIND11_TEST=on .. && make && make install
cd /content/packages/pybind11 && pip install .

cd /content/packages && git clone https://github.com/FEniCS/fiat.git
cd /content/packages/fiat && git checkout 2019.1.0 && pip install .

cd /content/packages && git clone https://bitbucket.org/fenics-project/dijitso.git
cd /content/packages/dijitso && git checkout 2019.1.0 && pip install .

cd /content/packages && git clone https://github.com/FEniCS/ufl.git
cd /content/packages/ufl && git checkout 2019.1.0 && pip install .

cd /content/packages && git clone https://bitbucket.org/fenics-project/ffc.git
cd /content/packages/ffc && git checkout 2019.1.0 && pip install .

cd /content/packages && git clone https://bitbucket.org/fenics-project/dolfin.git
cd /content/packages/dolfin && git checkout 2019.1.0 && mkdir build
cd /content/packages/dolfin/build && cmake -DDOLFIN_ENABLE_MPI=OFF .. && make && make install
source /usr/local/share/dolfin/dolfin.conf && cd /content/packages/dolfin/python && pip install .

pip install dmsh
pip install optimesh
pip install meshio

cd /content/packages && git clone https://github.com/miguel-valdez/remanu.git
cd /content/packages/remanu && pip install .
