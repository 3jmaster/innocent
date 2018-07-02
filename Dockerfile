FROM kalilinux/kali-linux-docker:latest

### Environment config
ENV USER=kali \
    VNC_COL_DEPTH=24 \
    VNC_RESOLUTION=1280x1024 \
    VNC_PW=vncpassword \
    VNC_VIEW_ONLY=false

RUN apt-get update && \
    apt-get install -y tightvncserver autocutsel && \
    apt install -y kali-linux-top10 && \
    apt autoremove && \
    apt clean

COPY xstartup /.vnc/xstartup
COPY vncboot /etc/init.d/vncboot
RUN chmod 755 /etc/init.d/vncboot && \
    update-rc.d vncboot defaults

EXPOSE 22 5901 6901
