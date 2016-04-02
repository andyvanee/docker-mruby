docker-mruby
========================================

This is a very stripped down mruby image for docker. The image is just under
25 MB. It probably doesn't make sense to use as a base image, since all the
build dependencies are added and then removed in `install.sh` to keep the size
down.
