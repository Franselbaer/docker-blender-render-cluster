#!/bin/bash
if [ "RENDER_MODE" = "MASTER" ]; then 
  /usr/bin/rsync --daemon --port=9000 &
fi
blender -b -P /root/renderServerStartup.py
