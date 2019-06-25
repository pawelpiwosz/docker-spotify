FROM debian:sid-slim

RUN apt-get update && apt-get install -y gnupg2

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90 \
  && echo deb http://repository.spotify.com stable non-free >> /etc/apt/sources.list.d/spotify.list

RUN apt-get update && apt-get install -y \
  xdg-utils \
  dbus-x11  \
  libcanberra-gtk0 \
  #libcanberra-gtk3-module \
  libcanberra-gtk-module \
  dirmngr \
  alsa-utils \
	libgl1-mesa-dri \
	libgl1-mesa-glx \
	libpulse0 \
  spotify-client \
  --no-install-recommends \
  && rm -rf /var/lib/apt/lists/*

ENV HOME /home/spotify
RUN useradd --create-home --home-dir $HOME spotify \
	&& gpasswd -a spotify audio \
	&& chown -R spotify:spotify $HOME

WORKDIR $HOME
USER spotify

# make search bar text better
RUN echo "QLineEdit { color: #000 }" > /home/spotify/spotify-override.css

ENTRYPOINT	[ "spotify" ]
CMD [ "-stylesheet=/home/spotify/spotify-override.css" ]
