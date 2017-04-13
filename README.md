OpenTeacher CI
--------------

This branch is used for Travis CI. It contains its configuration, and the main
OpenTeacher repository as a submodule. Travis builds are being requested using
their webhook, triggered by the OpenTeacher web service, which is in turn
triggered using a Launchpad web hook on commit.
