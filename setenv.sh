#!/bin/bash

test -d mydir && ln -s $IDF_PATH esp-idf

export PATH=/opt/gcc-xtensa-esp32-elf-1.22.0-80-g6c4433a-5.2.0/bin:$PATH
export IDF_PATH=$(pwd)/esp-idf
export TARGET_DIR=target/xtensa-esp32-none-elf/release
export XARGO_RUST_SRC="$XTENSA_ROOT/rust-xtensa/src"
