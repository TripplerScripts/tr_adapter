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
    'compatibilities/car/_init/client.lua',
    'compatibilities/car/_init/server.lua',
    'compatibilities/car/esx_car/client.lua',
    'compatibilities/car/esx_car/server.lua',
    'compatibilities/car/ox_car/client.lua',
    'compatibilities/car/ox_car/server.lua',
    'compatibilities/car/qb-car/client.lua',
    'compatibilities/car/qb-car/server.lua',
}
