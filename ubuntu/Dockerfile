FROM ubuntu:latest
RUN apt-get update && apt-get install --no-install-recommends -y \
  build-essential \
  cython3 \
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
  python3-all \
  python3-all-dev \
  python3-babel \
  python3-chardet \
  python3-cssselect \
  python3-docutils \
  python3-enchant \
  python3-feedparser \
  python3-flask \
  python3-gi \
  python3-pil \
  python3-pip \
  python3-launchpadlib \
  python3-mccabe \
  python3-polib \
  python3-pygments \
  python3-pygraphviz \
  python3-pyqt5 \
  python3-pyqt5.qtmultimedia \
  python3-pyqt5.qtopengl \
  python3-pyqt5.qtquick \
  python3-pyqt5.qtwebkit \
  python3-requests \
  python3-stdeb \
  python3-twisted \
  python3-urwid \
  tesseract-ocr \
  xvfb \
  &&\
  apt-get install -y python3-coverage \
  &&\
  ln -s /usr/bin/nodejs /usr/bin/node &&\
  npm install -g jshint &&\
  npm cache clean &&\
  pip3 --no-cache-dir install pydle flask-recaptcha &&\
  apt-get remove --purge -y python3-pip &&\
  apt-get autoremove --purge -y &&\
  rm -rf /var/lib/apt/lists/*

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

COPY openteacher /openteacher
WORKDIR /openteacher

RUN npm install
COPY ubuntu/run.sh /

ENV DISPLAY :99
ENTRYPOINT ["/run.sh"]
CMD ["--help"]
