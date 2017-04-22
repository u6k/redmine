FROM redmine
MAINTAINER u6k.apps@gmail.com

RUN apt-get update && \
    apt-get install -y openjdk-7-jre && \
    apt-get clean

RUN wget -O /usr/lib/plantuml.jar http://sourceforge.net/projects/plantuml/files/plantuml.jar/download

COPY plantuml /usr/bin/plantuml
RUN chmod +x /usr/bin/plantuml

RUN cd /usr/src/redmine/plugins/ && \
    git clone https://github.com/dkd/plantuml.git
