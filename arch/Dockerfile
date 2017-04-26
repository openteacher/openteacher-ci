FROM base/archlinux

RUN pacman -Sy --noconfirm --force \
  cython \
  desktop-file-utils \
  espeak \
  fakeroot \
  file \
  gcc \
  grep \
  gzip \
  hicolor-icon-theme \
  python \
  python-chardet \
  python-docutils \
  python-opengl \
  python-pillow \
  python-pyenchant \
  python-pyqt5 \
  python-urwid \
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
