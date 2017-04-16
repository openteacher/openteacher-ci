FROM base/archlinux

RUN pacman -Sy --noconfirm \
  cython2 \
  desktop-file-utils \
  espeak \
  fakeroot \
  file \
  gcc \
  grep \
  gzip \
  hicolor-icon-theme \
  python2 \
  python2-chardet \
  python2-docutils \
  python2-opengl \
  python2-pillow \
  python2-pyenchant \
  python2-pyqt5 \
  python2-urwid \
  qt5-declarative \
  qt5-multimedia \
  qt5-webkit \
  sudo \
  tesseract \
  xdg-utils \
  xorg-server-xvfb \
  &&\
  pacman -Sc --noconfirm

COPY openteacher /openteacher
WORKDIR /openteacher
RUN useradd -d /openteacher arch && chown -R arch:arch /openteacher

COPY arch/run*.sh /

ENV DISPLAY :99
ENTRYPOINT ["/run-privileged.sh"]
CMD ["--help"]
