#!/usr/bin/Rscript

envfile <- as.list(Sys.getenv())

for(folder in list.files('srv/shiny-server/apps', full.names = TRUE)){
   saveRDS(envfile,paste0(folder,'/env.rds'))
   print(paste0('Saving env to ',paste0(folder, '/env.rds')))
}

system('/usr/bin/shiny-server.sh')
