FROM kibana:4.5

RUN kibana plugin -i kibana-ansi -u https://github.com/sabre1041/kibana-ansi/archive/master.zip
