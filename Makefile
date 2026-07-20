# default build target
default	: build.vulkan
install	: install.vulkan 

clean	: ; -rm -rf build-*/

.PSUEDO: default clean install build.vulkan build.cpu prime.vulkan prime.cpu install.vulkan install.cpu

prime.vulkan   	: ; cmake --preset x64-linux-vulkan-release
build.vulkan   	: prime.vulkan ; cmake --build --preset x64-linux-vulkan-release
install.vulkan 	: build.vulkan ; sudo cmake --install build-x64-linux-vulkan-release

prime.cpu 	   	: ; cmake --preset x64-linux-cpu-release
build.cpu 	  	: prime.cpu ; cmake --build --preset x64-linux-cpu-release
install.cpu 	: build.cpu ; sudo cmake --install build-x64-linux-cpu-release


# define newline


# endef

# $(error Build system changed:$(newline)\
# The Makefile build has been replaced by CMake.$(newline)$(newline)\
# For build instructions see:$(newline)\
# https://github.com/ggml-org/llama.cpp/blob/master/docs/build.md$(newline)${newline})
