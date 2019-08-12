FROM rocker/shiny-verse

RUN apt update -y 
RUN apt install -y libpq-dev

ADD shiny-server-wrapper.R /usr/bin/shiny-server-wrapper.R
RUN chmod +x /usr/bin/shiny-server-wrapper.R
RUN chown shiny:shiny /usr/bin/shiny-server-wrapper.R

ADD ./shiny-server.conf /etc/shiny-server/shiny-server.conf
ADD apps/ /srv/shiny-server/apps

#RUN chown -R shiny:shiny /srv/shiny-server/apps

EXPOSE 3838

CMD ["Rscript", "/usr/bin/shiny-server-wrapper.R"]
