Still not working properly...

docker run -d -v /etc/localtime:/etc/localtime:ro -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY --device /dev/snd:/dev/snd -v $HOME/.spotify/config:/home/spotify/.spotify/config -v $HOME/.spotify/cache:/home/spotify/.spotify/cache --net=host --name spotify spotify