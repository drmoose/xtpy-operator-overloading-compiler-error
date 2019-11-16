#/bin/bash

pyflags="$(pkg-config python3-embed --libs --cflags)"
if [ -z "$pyflags" -a "$#" = 0 ]; then
	echo "Your system doesn't define pkg-config python3-embed." >&2
	echo "Auto-compile will likely fail. Pass additional compiler flags as" >&2
	echo "command-line arguments to $0 to supply embedded libpython and" >&2
	echo "-I for numpy." >&2
	echo >&2
fi

cd "$(dirname "$0")"

set -xe

g++ $pyflags "$@" -Ixtensor-python/include -Ipybind11/include -Ixtensor/include -Ixtl/include -I/usr/lib/python3.8/site-packages/numpy/core/include main.cpp
