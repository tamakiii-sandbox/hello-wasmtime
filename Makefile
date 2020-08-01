.PHONY: help install build run clean

help:
	@cat $(firstword $(MAKEFILE_LIST))

install:
	rustup target add wasm32-wasi

build: \
	main.wasm

main.wasm: main.rs
	rustc $^ --target wasm32-wasi

run: main.wasm
	wasmtime main.wasm
	wasmer main.wasm

clean:
	rm main.wasm
