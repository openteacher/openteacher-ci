FROM ubuntu:latest
RUN apt-get update && apt-get install -y \
  cython \
  espeak \
  gettext \
  libreoffice-writer \
  libreoffice-calc \
  nodejs \
  npm \
  python-babel \
  python-bzrlib \
  python-chardet \
  python-coverage \
  python-cssselect \
  python-docutils \
  python-enchant \
  python-faulthandler \
  python-feedparser \
  python-flask \
  python-gi \
  python-imaging \
  python-launchpadlib \
  python-mccabe \
  python-pip \
  python-polib \
  python-pygments \
  python-pygraphviz \
  python-pyqt5 \
  python-pyqt5.qtmultimedia \
  python-pyqt5.qtopengl \
  python-pyqt5.qtquick \
  python-pyqt5.qtwebkit \
  python-recaptcha \
  python-requests \
  python-stdeb \
  python-twisted \
  python-urwid \
  tesseract-ocr \
  xvfb \
  &&\
  ln -s /usr/bin/nodejs /usr/bin/node &&\
  npm install -g jshint &&\
  pip install latexcodec &&\
  apt-get remove --purge -y npm python-pip &&\
  apt-get autoremove --purge -y &&\
  rm -rf /var/lib/apt/lists/*

COPY openteacher openteacher
WORKDIR openteacher
COPY ubuntu/run.sh /run.sh

ENV DISPLAY :99
ENTRYPOINT ["/run.sh"]
CMD ["--help"]

# FIXME: python-latexcodec
