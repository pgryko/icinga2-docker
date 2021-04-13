FROM postgres:13.2

RUN cat /etc/os-release

RUN apt-get update --fix-missing; \
apt-get install -y apt-transport-https wget gnupg; \
wget -O- https://packages.icinga.com/icinga.key | apt-key add -; \
echo "deb https://packages.icinga.com/debian icinga-buster main" > /etc/apt/sources.list.d/buster-icinga.list ; \
apt-get update -y; \
DEBIAN_FRONTEND='noninteractive' apt-get install -y icinga2 monitoring-plugins icinga2-ido-pgsql; \
apt-get upgrade -y; \
rm -rf /var/lib/apt/lists/*;

ADD src/initdb/1-icinga.sh /docker-entrypoint-initdb.d/1-icinga.sh
RUN chmod +x /docker-entrypoint-initdb.d/1-icinga.sh

ENV POSTGRES_USER="postgres"
ENV POSTGRES_HOST_AUTH_METHOD="trust"