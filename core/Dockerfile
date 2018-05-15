FROM centos:centos7

# Update and install Icinga
RUN yum -y update; \
    yum -y install epel-release; \
    yum -y install https://packages.icinga.com/epel/icinga-rpm-release-7-latest.noarch.rpm; \
    yum -y install icinga2 nagios-plugins-all icinga2-ido-pgsql; \
    yum clean all;

# Fix permissions for Icinga2 PID file
RUN mkdir /run/icinga2
RUN touch /run/icinga2/icinga2.pid
RUN chown icinga:icinga /run/icinga2/icinga2.pid

# Enable PostgreSQL IDO module
COPY ./src/ido-pgsql.conf /etc/icinga2/features-available/ido-pgsql.conf
RUN icinga2 feature enable ido-pgsql;

# Environment variables
ENV container docker

# Open ports
EXPOSE 5665

# Add Tini
ENV TINI_VERSION v0.17.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]

CMD ["/usr/lib64/icinga2/sbin/icinga2", "daemon"]
