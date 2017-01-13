FROM centos:5.11
RUN yum -y install mysql-server-5.0.95-5.el5_9

COPY my.cnf /etc/my.cnf
COPY initial.sql /initial.sql
COPY localdb-run.sh /localdb-run.sh

RUN mysql_install_db

USER root 

RUN chmod 755 /localdb-run.sh
ENTRYPOINT ["/localdb-run.sh"] 

CMD ["mysqld_safe", "--init-file=/initial.sql", "--user=mysql"]

EXPOSE 3306
