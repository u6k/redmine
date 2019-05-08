FROM redmine:4.0.3
MAINTAINER u6k.apps@gmail.com

RUN apt-get update && \
    mkdir -p /usr/share/man/man1/ && \
    apt-get install -y \
      openjdk-8-jdk \
      unzip \
      graphviz \
      fonts-ipafont \
      xfonts-intl-japanese \
      xfonts-intl-japanese-big \
      xfonts-kaname && \
    apt-get clean

# Setup robots.txt
RUN { \
      echo "User-agent: *"; \
      echo "Disallow: /"; \
    } | tee /usr/src/redmine/public/robots.txt

# Install PlantUML
RUN wget -O /usr/lib/plantuml.jar http://sourceforge.net/projects/plantuml/files/plantuml.jar/download

COPY plantuml /usr/bin/plantuml
RUN chmod +x /usr/bin/plantuml

RUN cd /usr/src/redmine/plugins/ && \
    git clone https://github.com/dkd/plantuml.git

# Install MinimalFlat theme
RUN cd /usr/src/ && \
    wget https://github.com/akabekobeko/redmine-theme-minimalflat2/releases/download/v1.5.0/minimalflat2-1.5.0.zip && \
    unzip minimalflat2-1.5.0.zip && \
    mv minimalflat2 /usr/src/redmine/public/themes/ && \
    rm minimalflat2-1.5.0.zip

# Install Gitmike theme
RUN cd /usr/src/ && \
    wget -O redmine-theme-gitmike.zip https://github.com/makotokw/redmine-theme-gitmike/archive/v1.1.1.zip && \
    unzip redmine-theme-gitmike.zip && \
    mv redmine-theme-gitmike-1.1.1 /usr/src/redmine/public/themes/ && \
    rm redmine-theme-gitmike.zip

# Install Farend Fancy theme
RUN cd public/themes/ && \
    git clone git://github.com/farend/redmine_theme_farend_fancy.git farend_fancy

# Install Wiki Extensions plugin
RUN cd /usr/src/ && \
    wget https://github.com/haru/redmine_wiki_extensions/releases/download/0.9.0/redmine_wiki_extensions-0.9.0.zip && \
    unzip redmine_wiki_extensions-0.9.0.zip && \
    mv redmine_wiki_extensions /usr/src/redmine/plugins/ && \
    rm redmine_wiki_extensions-0.9.0.zip
