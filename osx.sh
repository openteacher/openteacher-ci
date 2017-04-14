#!/bin/sh

export PATH="/usr/local/bin:/usr/local/share/python:${PATH}"

brew install python pyqt5 enchant tesseract --all-languages pil
pip install chardet pyenchant urwid Cython pyinstaller
mkdir output
cd openteacher
# TODO: investigate properly. Now just disabled because it makes Travis crash.
rm -r pyttsx
python openteacher.py -p package-mac ../output/mac.dmg
