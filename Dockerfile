FROM fedora:rawhide
RUN yum install -y @development-tools python3-devel cmake pkg-config python3-pip python3-numpy g++
RUN pip3 install pytest

