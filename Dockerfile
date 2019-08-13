FROM rocker/shiny-verse

RUN apt update -y 
RUN apt install -y libpq-dev

ADD ./shiny-server.conf /etc/shiny-server/shiny-server.conf

# Mount your apps here
RUN mkdir /srv/shiny-server/apps

#RUN chown -R shiny:shiny /srv/shiny-server/apps

EXPOSE 3838

CMD /usr/bin/shiny-server.sh
