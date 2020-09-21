FROM debian:jessie

RUN apt update && apt install lib32gcc1 -y

RUN mkdir -p /opt/
RUN mkdir -p ~/.steam/
COPY opt/. /opt/
COPY steam/. ~/.steam/

ADD hlds_run.sh /bin/hlds_run.sh
ADD extract_maps.bash /bin/extract_maps.bash

RUN chmod +x /bin/hlds_run.sh
RUN chmod +x /bin/extract_maps.bash

WORKDIR /opt/hlds

ENTRYPOINT ["/bin/hlds_run.sh"]
