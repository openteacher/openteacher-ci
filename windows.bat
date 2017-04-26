git submodule update --remote
pip3 install PyQt5 chardet pyenchant urwid Cython pyinstaller pyenchant Pillow

REM TODO: tesseract portable + then also re-enable it in pyinstallerInterface
mkdir output
cd openteacher

python3 openteacher.py -p package-windows-portable ../output/openteacher-portable.zip
REM FIXME: get wix configured properly
python3 openteacher.py -p package-windows-msi ../output/OpenTeacher.msi
