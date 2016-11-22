#
# We use our own crossbuild image build.
# Check how to build MacOSX10.11.sdk.tar.xz at https://github.com/tpoechtrager/osxcross#packaging-the-sdk
# bellow add correct url to
# docker build --build-arg osxcross_revision=2b3387844c1dccdd88be4cbc0de7ec955b05a630 --build-arg darwin_sdk_url=http://users.capdnet.ii.uj.edu.pl/~juda/<secret>/MacOSX10.11.sdk.tar.xz --build-arg darwin_sdk_version=10.11 --build-arg darwin_version=15 --build-arg darwin_osx_version_min=10.11 --tag registry.capdnet:5000/capd-crossbuild .
# docker push registry.capdnet:5000/capd-crossbuild
#

#FROM multiarch/crossbuild:latest
FROM registry.capdnet:5000/capd-crossbuild
MAINTAINER Mateusz Juda <mateusz.juda@gmail.com>

RUN apt-get update && apt-get install -yy distcc

# distccd port
EXPOSE 3632

# default, change in run-time
ENV ALLOW="0.0.0.0/32" DISTCCD_OPTS=""

COPY scripts/start.sh /workdir

CMD "/workdir/start.sh"
