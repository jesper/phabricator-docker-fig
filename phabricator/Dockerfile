FROM debian:jessie
MAINTAINER Jesper Thomschutz <jesper@jespersaur.com>

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

RUN apt-get update && apt-get remove exim4 && apt-get install -y apache2 php5 libapache2-mod-php5 php5-mcrypt php5-mysql \
                           php5-gd php5-dev php5-curl php5-cli php5-json php5-ldap php5-apcu git \
                           postfix

RUN cd /opt/ && git clone https://github.com/facebook/libphutil.git
RUN cd /opt/ && git clone https://github.com/facebook/arcanist.git
RUN cd /opt/ && git clone https://github.com/facebook/phabricator.git

RUN /opt/phabricator/bin/config set mysql.host mysql
RUN /opt/phabricator/bin/config set mysql.user root
RUN /opt/phabricator/bin/config set mysql.pass _CH4Ng3_M3_

ADD apache-phabricator.conf /etc/apache2/sites-enabled/000-default.conf
RUN ulimit -c 10000
RUN a2enmod rewrite

ADD start_phabricator.sh /usr/bin/start_phabricator.sh

EXPOSE 80

CMD ["/usr/bin/start_phabricator.sh"]
