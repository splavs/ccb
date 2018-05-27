FROM splavs/ccbapp:app1

MAINTAINER splavs@gmail.com

USER root
RUN yum -y install expect; yum clean all
RUN echo "cissys ALL = NOPASSWD:ALL" >> /etc/sudoers

USER cissys
WORKDIR /home/cissys
ADD startApp.sh startApp.sh
ADD wait-for-oracle.sh wait-for-oracle.sh
ADD install_mf_license.sh install_mf_license.sh

EXPOSE 6500
#CMD exec ~/startApp.sh
