FROM kibana:4.5

RUN apt-get update && apt-get install patch

COPY ./logtrail.patch /tmp/logtrail.patch

RUN wget -qO- https://github.com/sivasamyk/logtrail/releases/download/0.1.14/logtrail-4.x-0.1.14.tar.gz | tar xz -C /tmp/
RUN patch -d /tmp/ -p0 < /tmp/logtrail.patch
RUN tar czf /tmp/logtrail.tar.gz -C /tmp/logtrail .

RUN kibana plugin -i kibana-ansi -u https://github.com/sabre1041/kibana-ansi/archive/master.zip
RUN kibana plugin -i logtrail -u file:////tmp/logtrail.tar.gz
RUN ln -s -f /opt/kibana/config/logtrail.json /opt/kibana/installedPlugins/logtrail/logtrail.json
