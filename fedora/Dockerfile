FROM fedora:latest
RUN dnf install -y \
  Cython \
  gcc \
  python-docutils \
  python-qt5 \
  python2 \
  python2-devel \
  redhat-rpm-config \
  rpm-build \
  xorg-x11-server-Xvfb \
  &&\
  dnf clean all -y

COPY openteacher /openteacher
WORKDIR /openteacher
COPY fedora/run.sh /run.sh

ENV DISPLAY :99
ENTRYPOINT ["/run.sh"]
CMD ["--help"]

# build dependencies only
