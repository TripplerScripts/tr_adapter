fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Trippler Hub'
version '0.91.0'
dependency 'tr_lib'

shared_script 'init.lua'
server_scripts {
    'modules/print/shared.lua',
    'modules/require/shared.lua',
    'call/server.lua',
    'order/server.lua',
    'env/server.lua',
    'adapter/server.lua',
    'loader/server.lua',
    'provider/server.lua',
    'selector/server.lua',
    'extractor/server.lua',
    'definer/server.lua',
    'mapper/server.lua',
    'converter/server.lua',
}
files {
    'compatibilities/inventory/_init/server.lua',
    'compatibilities/inventory/ox_inventory/server.lua',
    'compatibilities/inventory/qb-inventory/server.lua',
}
provide 'ox_inventory'
