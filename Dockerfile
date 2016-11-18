FROM multiarch/crossbuild:latest
MAINTAINER Mateusz Juda <mateusz.juda@gmail.com>

RUN apt-get update && apt-get install -yy distcc

# distccd port
EXPOSE 3632

# default, change in run-time
ENV ALLOW="0.0.0.0/32" DISTCCD_OPTS=""

COPY scripts/start.sh /workdir

CMD "/workdir/start.sh"
