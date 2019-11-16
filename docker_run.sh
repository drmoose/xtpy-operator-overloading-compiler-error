#!/bin/bash

cd "$(dirname "$0")"
set -xe

docker build -t plus_equals .

docker run --rm -it \
	-v $(pwd):/plus_equals \
	-u "$(id -ru):$(id -rg)" \
	-w /plus_equals \
	plus_equals \
	sh -c './compile.sh && ./a.out'

