fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Trippler Hub'
version '0.50.0'
dependency 'tr_lib'

shared_script 'init.lua'
server_scripts {
    'modules/adaptor/server.lua',
    'modules/loader/server.lua',
    'modules/provider/server.lua',
    'modules/selector/server.lua',
    'modules/detecter/extractor/server.lua',
    'modules/detecter/resources/server.lua',
}
files {
    'compatibilities/core/_init/server.lua',
    'compatibilities/core/esx_core/server.lua',
    'compatibilities/core/qb-core/server.lua',
    'compatibilities/core/ox_core/server.lua',
}
provide 'esx_core'
provide 'ox_core'
