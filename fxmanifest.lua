fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Trippler Hub'
version '0.79.0'
dependency 'tr_lib'

shared_script 'init.lua'
server_scripts {
    'modules/print/shared.lua',
    'modules/require/shared.lua',
    'engine/adaptor/server.lua',
    'engine/loader/server.lua',
    'engine/provider/server.lua',
    'engine/selector/server.lua',
    'engine/detecter/extractor/server.lua',
    'engine/detecter/resources/server.lua',
}
files {
    'compatibilities/inventory/_init/server.lua',
    'compatibilities/inventory/ox_inventory/server.lua',
    'compatibilities/inventory/qb-inventory/server.lua',
    'compatibilities/inventory/ps-inventory/server.lua',
}
provide 'ox_inventory'
provide 'ps-inventory'
