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

    'compatibilities/core/esx_core/server.lua',
    'compatibilities/core/ox_core/server.lua',
    'compatibilities/core/qb-core/server.lua',
}
files {
    'compatibilities/core/_init/client.lua',
    'compatibilities/core/_init/server.lua',
    'compatibilities/core/esx_core/client.lua',
    'compatibilities/core/esx_core/server.lua',
    'compatibilities/core/ox_core/client.lua',
    'compatibilities/core/ox_core/server.lua',
    'compatibilities/core/qb-core/client.lua',
    'compatibilities/core/qb-core/server.lua',
}
provide 'esx_core'
provide 'ox_core'
