FROM rocker/shiny-verse

ADD ./shiny-server.conf /etc/shiny-server/shiny-server.conf

RUN Rscript -e "install.packages(c('cowplot','rjson'), requirements = FALSE)"
RUN Rscript -e "devtools::install_github('peder2911/armour_ever_testy', requirements = FALSE)"

ADD app /srv/shiny-server/tl
RUN chown -R shiny:shiny /srv/shiny-server/tl

EXPOSE 3838

CMD ["/usr/bin/shiny-server.sh"]
