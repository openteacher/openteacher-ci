FROM ubuntu:latest
RUN apt-get update && apt-get install --no-install-recommends -y \
  build-essential \
  cython \
  dbus \
  dh-python \
  espeak \
  fakeroot \
  gettext \
  libreoffice-writer \
  libreoffice-calc \
  locales \
  nodejs \
  npm \
  python-all \
  python-all-dev \
  python-babel \
  python-bzrlib \
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
  python-mccabe \
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
  apt-get install -y python-coverage \
  &&\
  ln -s /usr/bin/nodejs /usr/bin/node &&\
  npm install -g jshint &&\
  npm cache clean &&\
  apt-get remove --purge -y npm &&\
  apt-get autoremove --purge -y &&\
  rm -rf /var/lib/apt/lists/*

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

COPY openteacher /openteacher
WORKDIR /openteacher
COPY ubuntu/run.sh /

ENV DISPLAY :99
ENTRYPOINT ["/run.sh"]
CMD ["--help"]

# FIXME: python-latexcodec
