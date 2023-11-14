#https://wiki.debian.org/DebianOldStable
FROM debian:oldstable-slim

RUN apt update -y

RUN apt install mariadb-server -y

RUN mysql_install_db

COPY ./tools/mdb-script.sh /home/

RUN chmod +x /home/mdb-script.sh

EXPOSE 3306

ENTRYPOINT [ "/home/mdb-script.sh" ]

