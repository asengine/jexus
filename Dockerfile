FROM mono:6.12.0.107-slim

# MAINTAINER Jo Shields <jo.shields@xamarin.com>
# MAINTAINER Alexander Köplinger <alkpli@microsoft.com>

RUN apt-get update \
  && apt-get install -y wget binutils curl mono-devel ca-certificates-mono fsharp mono-vbnc nuget referenceassemblies-pcl mono-xsp4 \
  && rm -rf /var/lib/apt/lists/* /tmp/*

RUN cd /tmp \
    && rm -rf jexus-6.2* >/dev/null 2>&1 \
    && wget --no-check-certificate https://linuxdot.net/down/jexus-6.2.tar.gz \
    && tar -zxvf jexus-6.2.tar.gz \
    && cd jexus-6.2 \
    && ./install \
    && cd /tmp \
    && rm -rf jexus-6.2* >/dev/null 2>&1
    # && cd /usr/jexus

RUN mono -V