REM FIXME: get pyqt5 properly installed (currently it fails)
pip install https://github.com/pyqt/python-qt5/archive/master.zip
pip install chardet pyenchant urwid Cython pyinstaller pyenchant Pillow

REM TODO: tesseract portable + then also re-enable it in pyinstallerInterface
mkdir output
cd openteacher

python openteacher.py -p package-windows-portable ../output/openteacher-portable.zip
REM FIXME: get wix configured properly
python openteacher.py -p package-windows-msi ../output/OpenTeacher.msi

