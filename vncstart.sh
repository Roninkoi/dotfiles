#x0vncserver -passwordfile ~/.vnc/passwd -display :0
x11vnc -find -auth guess -rfbauth ~/.vnc/passwd -clip 2560x1440+0+0 &

