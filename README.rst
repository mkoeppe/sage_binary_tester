============================================================
 Scripts for testing Sage binary distributions on Travis CI
============================================================

This downloads a binary distribution from a Sage mirror for various
systems supported by Travis CI: Mac OS X 10.10, 10.11, 10.12 (loaded
with different XCode versions) and two versions of Ubuntu Linux on
x86_64.

The scripts test that some optional packages can be installed
and runs very limited doctesting.

On the free Travis CI infrastructure ("org"), there is a time limit of
1 hour per build.  Downloading the binary distribution sometimes takes
30 minutes.  Thus it is quite limited what can be tested.
