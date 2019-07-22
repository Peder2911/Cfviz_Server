FROM rocker/shiny-verse

RUN Rscript -e "install.packages(c('cowplot','rjson'), requirements = FALSE)"
RUN Rscript -e "devtools::install_github('peder2911/armour_ever_testy', requirements = FALSE)"

RUN apt-get install -y git
RUN git clone 'https://github.com/peder2911/ceasefire_plots' /srv/shiny-server/cfplot
#ADD app/ /srv/shiny-server/cfplot
COPY data/* /srv/shiny-server/cfplot/data/

RUN chown -R shiny:shiny /srv/shiny-server/cfplot

CMD /usr/bin/shiny-server.sh
