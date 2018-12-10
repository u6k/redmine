FROM redmine:3.4.4
MAINTAINER u6k.apps@gmail.com

RUN apt-get update && \
    apt-get install -y openjdk-7-jre unzip graphviz ttf-kochi-gothic xfonts-intl-japanese xfonts-intl-japanese-big xfonts-kaname && \
    apt-get clean

# Install PlantUML
RUN wget -O /usr/lib/plantuml.jar http://sourceforge.net/projects/plantuml/files/plantuml.jar/download

COPY plantuml /usr/bin/plantuml
RUN chmod +x /usr/bin/plantuml

RUN cd /usr/src/redmine/plugins/ && \
    git clone https://github.com/dkd/plantuml.git

# Install MinimalFlat theme
RUN cd /usr/src/ && \
    wget https://github.com/akabekobeko/redmine-theme-minimalflat2/releases/download/v1.3.4/minimalflat2-1.3.4.zip && \
    unzip minimalflat2-1.3.4.zip && \
    mv minimalflat2 /usr/src/redmine/public/themes/ && \
    rm minimalflat2-1.3.4.zip

# Install Gitmike theme
RUN cd /usr/src/ && \
    wget -O redmine-theme-gitmike.zip https://github.com/makotokw/redmine-theme-gitmike/archive/v1.1.0.zip && \
    unzip redmine-theme-gitmike.zip && \
    mv redmine-theme-gitmike-1.1.0 /usr/src/redmine/public/themes/ && \
    rm redmine-theme-gitmike.zip

# Install Farend Fancy theme
RUN cd public/themes/ && \
    git clone git://github.com/farend/redmine_theme_farend_fancy.git farend_fancy

# Install Knowledgebase plugin
RUN cd /usr/src/redmine/ && \
    git clone git://github.com/alexbevi/redmine_knowledgebase.git plugins/redmine_knowledgebase && \
    bundle install

# Install Wiki Extensions plugin
RUN cd /usr/src/ && \
    wget https://github.com/haru/redmine_wiki_extensions/releases/download/0.8.1/redmine_wiki_extensions-0.8.1.zip && \
    unzip redmine_wiki_extensions-0.8.1.zip && \
    mv redmine_wiki_extensions /usr/src/redmine/plugins/ && \
    rm redmine_wiki_extensions-0.8.1.zip

# Install Issue checklist plugin
RUN cd /usr/src/redmine/ && \
    git clone https://github.com/Restream/redmine_issue_checklist.git plugins/redmine_issue_checklist && \
    bundle install

