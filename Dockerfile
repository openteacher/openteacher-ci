FROM ubuntu:latest
RUN apt-get update && apt-get install -y \
  cython \
  espeak \
  gettext \
  libreoffice-writer \
  libreoffice-calc \
  python-babel \
  python-chardet \
  python-cssselect \
  python-docutils \
  python-enchant \
  python-faulthandler \
  python-feedparser \
  python-flask \
  python-gi \
  python-imaging \
  python-launchpadlib \
  python-mccabe npm \
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
  python-twisted \
  python-urwid \
  tesseract-ocr \
  xvfb &&\
  \
  npm install -g jshint &&\
  pip install latexcodec &&\
  apt-get remove --purge -y npm python-pip &&\
  apt-get autoremove --purge -y &&\
  rm -rf /var/lib/apt/lists/*
COPY openteacher openteacher
WORKDIR openteacher
ENV DISPLAY :99
COPY run.sh /run.sh
ENTRYPOINT ["/run.sh"]
CMD ["-p", "test-suite", "fast"]
