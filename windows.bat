git submodule update --remote
set PATH=C:\Python36;C:\Python36\Scripts;%PATH%

REM TODO: pyttsx, if fixed, requires pypiwin32
pip install chardet pyenchant urwid pyenchant Pillow git+https://github.com/pyinstaller/pyinstaller.git@develop
choco install pyqt5

mkdir output
cd openteacher
move moduleFilterer.pyx moduleFilterer.py

REM TODO: tesseract portable + then also re-enable it in pyinstallerInterface
python openteacher.py -p package-windows-portable ../output/openteacher-portable.zip
REM FIXME: get wix configured properly
python openteacher.py -p package-windows-msi ../output/OpenTeacher.msi
