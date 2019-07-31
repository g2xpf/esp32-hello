#!/bin/bash

# Requirements
#   environment variables:
#   - IDF_PATH (your esp-idf directory)
#   - XTENSA_ROOT (the directory where "rust-xtensa" exists)
#
# this script has been tested with esp-idf v3.2
#

source setenv.sh

# export V=1
make -j6 app

rustup run xtensa xargo build --release #--verbose

$IDF_PATH/components/esptool_py/esptool/esptool.py \
	--chip esp32 \
	elf2image \
	--flash_mode "dio" \
	--flash_freq "40m" \
	--flash_size "2MB" \
	-o $TARGET_DIR/esp32-hello.bin \
	$TARGET_DIR/esp32-hello
    
