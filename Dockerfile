FROM debian:jessie

RUN apt-get update && apt-get -y --force-yes install lib32gcc1 wget zip

RUN mkdir -p /opt/
RUN mkdir -p ~/.steam/
COPY opt/. /opt/
COPY steam/. ~/.steam/
RUN cd /root/.steam && ln -s /opt/hlds sdk32

ADD hlds_run.sh /bin/hlds_run.sh
ADD extract_maps.bash /bin/extract_maps.bash

RUN chmod +x /bin/hlds_run.sh
RUN chmod +x /bin/extract_maps.bash

# install Podbot bots
RUN mkdir -p /opt/hlds/podbot_tmp && cd /opt/hlds/podbot_tmp
RUN wget -O podbot_full_v3b21.zip 'https://gamebanana.com/dl/3277'
RUN unzip podbot_full_v3b21.zip
RUN mv podbot /opt/hlds/cstrike/addons
RUN rm -R /opt/hlds/podbot_tmp
RUN echo "linux addons/podbot/podbot_mm_i386.so" >> /opt/hlds/cstrike/addons/metamod/plugins.ini
#COPY liblist.gam /opt/hlds/cstrike/
RUN sed 's/pb add 100//g' /opt/hlds/cstrike/addons/podbot/podbot.cfg >> /opt/hlds/cstrike/addons/podbot/podbot.cfgtmp
RUN rm /opt/hlds/cstrike/addons/podbot/podbot.cfg
RUN mv /opt/hlds/cstrike/addons/podbot/podbot.cfgtmp /opt/hlds/cstrike/addons/podbot/podbot.cfg

WORKDIR /opt/hlds

ENTRYPOINT ["/bin/hlds_run.sh"]
