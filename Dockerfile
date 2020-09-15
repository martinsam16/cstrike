
FROM debian:jessie

RUN mkdir -p /opt/
RUN mkdir -p ~/.steam/

COPY opt/. /opt/
COPY steam/. ~/.steam/

RUN apt update && apt install -y lib32gcc1


#RUN ln -s /opt/hlds ~/.steam/sdk32
#RUN ln -s /opt/steam/ /opt/hlds/steamcmd

ADD hlds_run.sh /bin/hlds_run.sh
RUN chmod +x /bin/hlds_run.sh

WORKDIR /opt/hlds

ENTRYPOINT ["/bin/hlds_run.sh"]
