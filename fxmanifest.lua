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
    
}

provide 'ars_ambulance'
provide 'qb-ambulance'
provide 'fd_banking'
provide 'qb-banking'
provide 'bub-mdt'
provide 'ps-dispatch'
provide 'qb-doorlock'
provide 'LegacyFuel'
provide 'Renewed-Fuel'
provide 'cdn-fuel'
provide 'lc_fuel'
provide 'ps-fuel'
provide 'qb-fuel'
provide 'ps-housing'
provide 'qb-housing'
provide 'qb-input'
provide 'qb-inventory'
provide 'qb-menu'
provide 'PolyZone'
provide 'progressbar'
provide 'qb-radialmenu'
provide 'qb-target'
provide 'Renewed-Vehiclekeys'
