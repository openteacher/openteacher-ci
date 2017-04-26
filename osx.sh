#!/bin/sh

export PATH=/usr/local/bin:/usr/local/sbin:$PATH

brew install pyenv pyqt5 enchant tesseract --all-languages
pip3 install chardet pyenchant urwid Cython pillow git+https://github.com/pyinstaller/pyinstaller.git@develop
mkdir output
cd openteacher
# TODO: investigate properly. Now just disabled because it makes Travis crash.
rm -r pyttsx
python3 openteacher.py -p package-mac ../output/mac.dmg
