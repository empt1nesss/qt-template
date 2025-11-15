CC=clang
CXX=clang++

ifeq ($(OS),Windows_NT)

QT_ROOT=/c/Qt
ENV=PATH=$(QT_ROOT)/6.10.0/msvc2022_64/bin:$$PATH
EXE=QTTemplate.exe

else

EXE=QTTemplate

endif


.PHONY: conf build run clean

conf:
	@$(ENV) cmake -B build -G "Ninja" \
		-DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
		-DCMAKE_C_COMPILER=$(CC) \
		-DCMAKE_CXX_COMPILER=$(CXX)

build:
	@$(ENV) cmake --build build

run:
	@$(ENV) ./build/bin/$(EXE)

clean:
	@rm -rf build

