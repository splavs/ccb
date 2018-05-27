FROM splavs/ccb:3em

MAINTAINER splavs@gmail.com

USER oracle
WORKDIR /home/oracle
ADD startDB.sh startDB.sh

EXPOSE 1521 1158
CMD exec ~/startDB.sh
