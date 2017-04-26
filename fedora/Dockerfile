FROM fedora:latest
RUN dnf install -y \
  python3-Cython \
  gcc \
  python-docutils \
  python3-docutils \
  python3-qt5 \
  python3 \
  python3-devel \
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
