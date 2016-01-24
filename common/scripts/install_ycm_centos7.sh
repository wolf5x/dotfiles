#/usr/bin/bash
sudo yum install epel-release
sudo yum install clang cmake python-devel
sudo yum group install "Development Tools"
cd ~/.vim/bundle
git clone https://github.com/Valloric/YouCompleteMe.git
cd YouCompleteMe
git submodule update --init --recursive
cd ~
mkdir ycm_build
cd ycm_build
cmake -G "Unix Makefiles" -DUSE_SYSTEM_LIBCLANG=ON . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp 
cmake --build . --target ycm_support_libs --config Release
