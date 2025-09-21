fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Trippler Hub'
version '0.3.0'

shared_script 'init.lua'
client_scripts {
    'modules/loader/client.lua'
}
server_scripts {
    'modules/loader/server.lua',
    'modules/provider/server.lua',
    'modules/selector/server.lua',
    'modules/detecter/extractor/server.lua',
    'modules/detecter/resources/server.lua',
}
files {
    'compatibilities/inventory/_init/client.lua',
    'compatibilities/inventory/_init/server.lua',
    'compatibilities/inventory/ox_inventory/client.lua',
    'compatibilities/inventory/ox_inventory/server.lua',
    'compatibilities/inventory/qb-inventory/client.lua',
    'compatibilities/inventory/qb-inventory/server.lua',
}

provide 'qb-inventory'
