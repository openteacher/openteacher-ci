OpenTeacher CI
--------------

[![Build Status](https://travis-ci.org/openteacher/openteacher-ci.svg?branch=master)](https://travis-ci.org/openteacher/openteacher-ci)
[![Build status](https://ci.appveyor.com/api/projects/status/a3yga5brdcm2t7f9?svg=true)](https://ci.appveyor.com/project/openteacher/openteacher-ci)

This branch is used for Travis CI. It contains its configuration, and the main
OpenTeacher repository as a submodule. Travis builds are being requested using
their webhook, triggered by the OpenTeacher web service, which is in turn
triggered using a Launchpad web hook on commit.
