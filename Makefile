.PHONY: conf build run clean

QT_ROOT=/c/Qt
ENV=PATH=$(QT_ROOT)/6.10.0/msvc2022_64/bin:$$PATH

conf:
	@$(ENV) cmake -B build -G "Ninja" -DCMAKE_EXPORT_COMPILE_COMMANDS=ON

build:
	@$(ENV) cmake --build build

run:
	@$(ENV) ./build/QTTemplate.exe

clean:
	@rm -rf build
