#!/bin/sh

export PATH="/usr/local/bin:/usr/local/share/python:${PATH}"

brew install python python-qt5 pip enchant tesseract --all-languages pil
pip install chardet pyenchant urwid Cython
cd openteacher
python openteacher.py -p package-mac mac.dmg
