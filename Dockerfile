FROM d3v0x/gentoo
MAINTAINER d3v0x

RUN emerge-webrsync -v

RUN echo "USE=\"\${USE} -bindist\"" >> /etc/portage/make.conf
RUN emerge -DN @world

RUN rm -f /etc/portage/package.accept_keywords; \
    mkdir /etc/portage/package.accept_keywords

ADD ./data/package.use/blender /etc/portage/package.use/blender
ADD ./data/package.accept_keywords/blender /etc/portage/package.accept_keywords/blender
ADD ./data/profile/use.stable.mask /etc/portage/profile/use.stable.mask

RUN emerge media-gfx/blender
RUN rm -rf /usr/portage

ADD scripts /root/
CMD /root/start.sh
EXPOSE 8000 9000
