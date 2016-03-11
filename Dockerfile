FROM cern/slc6-base
RUN yum -y update
RUN yum -y install MySQL-python unixODBC pyodbc unixODBC-devel freetds.x86_64 python-suds python-pip python-lxml gcc racle-instantclient-devel python-devel httpd which
RUN yum -y install shibboleth log4shib xmltooling-schemas opensaml-schemas
RUN yum -y install afs sssd limits openssh-server openssh-clients supervisor

RUN groupadd docker
RUN useradd -m docker -g apache
RUN echo docker:docker | chpasswd

EXPOSE 2222 5000 22

COPY init_services.sh /
RUN chmod +x /init_services.sh

ENTRYPOINT ["/init_services.sh"]
