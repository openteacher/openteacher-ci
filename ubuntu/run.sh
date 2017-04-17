#!/bin/sh

rm -f /tmp/.X99-lock
Xvfb :99 -screen 0 1024x768x16 -nolisten tcp &

if [ "$COV" ]; then
  python-coverage run --branch openteacher.py "$@"
  python-coverage html --directory="$COV" --omit=/usr*,pyttsx*,pyratemp*
elif [ "$PROFILING" ]; then
  python -m cProfile -o "$PROFILING" openteacher.py "$@"
else
  python openteacher.py "$@"
fi
