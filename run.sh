#!/bin/sh

Xvfb :99 -screen 0 1024x768x16 -nolisten tcp &

# coverage
python-coverage run --branch openteacher.py -p test-suite all
python-coverage html -d coverage --omit=/usr*,pyttsx*,pyratemp*

# profiling
python -m cProfile -o profiling.prof openteacher.py -p non-existing-profile

# code complexity
python openteacher.py -p code-complexity > code-complexity.txt

#web stuff
python openteacher.py -p generate-mobile mobile-debug
python openteacher.py -p generate-web web-debug http://web.openteacher.org:5984 http://web.openteacher.org/services
python openteacher.py -p generate-website website-debug
python openteacher.py -p generate-business-card openteacher-business-card.png

# source
python openteacher.py -p package-source source.zip
python openteacher.py -p package-source-with-setup source-with-setup.tar.gz
