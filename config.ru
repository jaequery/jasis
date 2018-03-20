require './config'

# set controllers
map('/admin') { run AdminApp }
map('/') { run SiteApp }


