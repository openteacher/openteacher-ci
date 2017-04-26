FROM opensuse:latest
# TODO: find dependency packages
RUN zypper --non-interactive install \
  python3-Cython \
  python3-devel \
  python3-docutils \
  python3-qt5 \
  rpmbuild \
  xorg-x11-server \
  &&\
  zypper --non-interactive clean -a &&\
  rm -rf /var/log/zypp /var/log/zypper.log

COPY openteacher /openteacher
WORKDIR /openteacher
COPY fedora/run.sh /run.sh

ENV DISPLAY :99
ENTRYPOINT ["/run.sh"]
CMD ["--help"]

# build dependencies only
