fx_version 'adamant'
games { 'gta5' }

client_scripts {
  'utils.lua',
  'cfg.lua',
  'client/functions.lua',
  'client/main.lua',
}

server_scripts {
  '@mysql-async/lib/MySQL.lua',
  'cfg.lua',
  'credentials.lua',
  'utils.lua',
  'server/functions.lua',
  'server/main.lua',
}

dependencies {
  'meta_libs',
  'es_extended'
}
