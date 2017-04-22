FROM redmine
MAINTAINER u6k.apps@gmail.com

RUN apt-get update && \
    apt-get install -y openjdk-7-jre unzip && \
    apt-get clean

RUN wget -O /usr/lib/plantuml.jar http://sourceforge.net/projects/plantuml/files/plantuml.jar/download

COPY plantuml /usr/bin/plantuml
RUN chmod +x /usr/bin/plantuml

RUN cd /usr/src/redmine/plugins/ && \
    git clone https://github.com/dkd/plantuml.git

RUN cd /usr/src/ && \
    wget https://github.com/akabekobeko/redmine-theme-minimalflat2/releases/download/v1.2.2/minimalflat2-v1.2.2.zip && \
    unzip minimalflat2-v1.2.2.zip && \
    mv minimalflat2/ /usr/src/redmine/public/themes/minimalflat/ && \
    rm minimalflat2-v1.2.2.zip
