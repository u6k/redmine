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
    mv minimalflat2 /usr/src/redmine/public/themes/ && \
    rm minimalflat2-v1.2.2.zip

RUN cd /usr/src/ && \
    wget -O redmine-theme-gitmike.zip https://github.com/makotokw/redmine-theme-gitmike/archive/v1.1.0.zip && \
    unzip redmine-theme-gitmike.zip && \
    mv redmine-theme-gitmike-1.1.0 /usr/src/redmine/public/themes/ && \
    rm redmine-theme-gitmike.zip
