fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Trippler Hub'
version '0.2.0'

shared_script 'init.lua'
client_scripts {
    'modules/loader/client.lua'
}
server_scripts {
    'modules/detecter/supported/server.lua',
    'modules/detecter/resources/server.lua',
    'modules/selector/server.lua',
    'modules/provider/server.lua',
    'modules/loader/server.lua',
}
files {
    'compatibilities/ambulance/_init/client.lua',
    'compatibilities/ambulance/ars_ambulance/client.lua',
    'compatibilities/ambulance/qb-ambulance/client.lua',

    'compatibilities/banking/_init/client.lua',
    'compatibilities/banking/fd_banking/client.lua',
    'compatibilities/banking/qb-banking/client.lua',
    'compatibilities/banking/renewed-banking/client.lua',

    'compatibilities/core/_init/client.lua',
    'compatibilities/core/_init/server.lua',
    'compatibilities/core/qb-core/client.lua',
    'compatibilities/core/qb-core/server.lua',
    'compatibilities/core/qbx_core/client.lua',
    'compatibilities/core/qbx_core/server.lua',

    'compatibilities/dispatch/_init/client.lua',
    'compatibilities/dispatch/bub-mdt/client.lua',
    'compatibilities/dispatch/ps-dispatch/client.lua',

    'compatibilities/doorlock/_init/client.lua',
    'compatibilities/doorlock/ox_doorlock/client.lua',
    'compatibilities/doorlock/qb-doorlock/client.lua',

    'compatibilities/fuel/_init/client.lua',
    'compatibilities/fuel/cdn-fuel/client.lua',
    'compatibilities/fuel/lc_fuel/client.lua',
    'compatibilities/fuel/LegacyFuel/client.lua',
    'compatibilities/fuel/ox_fuel/client.lua',
    'compatibilities/fuel/ps-fuel/client.lua',
    'compatibilities/fuel/qb-fuel/client.lua',
    'compatibilities/fuel/Renewed-Fuel/client.lua',

    'compatibilities/housing/_init/client.lua',
    'compatibilities/housing/ps-housing/client.lua',
    'compatibilities/housing/qb-housing/client.lua',

    'compatibilities/input/_init/client.lua',
    'compatibilities/input/ox_lib/client.lua',
    'compatibilities/input/qb-input/client.lua',

    'compatibilities/inventory/_init/client.lua',
    'compatibilities/inventory/_init/server.lua',
    'compatibilities/inventory/ox_inventory/client.lua',
    'compatibilities/inventory/ox_inventory/server.lua',
    'compatibilities/inventory/qb-inventory/client.lua',
    'compatibilities/inventory/qb-inventory/server.lua',

    'compatibilities/management/_init/client.lua',
    'compatibilities/management/qb-management/client.lua',
    'compatibilities/management/qbx_management/client.lua',
    
    'compatibilities/menu/_init/client.lua',
    'compatibilities/menu/ox_lib/client.lua',
    'compatibilities/menu/qb-menu/client.lua',
    
    'compatibilities/polyzone/_init/client.lua',
    'compatibilities/polyzone/ox_lib/client.lua',
    'compatibilities/polyzone/polyzone/client.lua',

    'compatibilities/progressbar/_init/client.lua',
    'compatibilities/progressbar/ox_lib/client.lua',
    'compatibilities/progressbar/progressbar/client.lua',

    'compatibilities/radialmenu/_init/client.lua',
    'compatibilities/radialmenu/ox_lib/client.lua',
    'compatibilities/radialmenu/qb-radialmenu/client.lua',

    'compatibilities/target/_init/client.lua',
    'compatibilities/target/ox_target/client.lua',
    'compatibilities/target/qb-target/client.lua',
    
    'compatibilities/vehiclekeys/_init/client.lua',
    'compatibilities/vehiclekeys/qb-vehiclekeys/client.lua',
    'compatibilities/vehiclekeys/qbx_vehiclekeys/client.lua',
    'compatibilities/vehiclekeys/Renewed-Vehiclekeys/client.lua',

    'compatibilities/weather/_init/client.lua',
    'compatibilities/weather/cd_easytime/client.lua',
    'compatibilities/weather/qb-weathersync/client.lua',
    'compatibilities/weather/renewed-weathersync/client.lua',
}
provide 'ars_ambulance'
provide 'qb-ambulance'
provide 'fd_banking'
provide 'qb-banking'
provide 'renewed-banking'
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
provide 'polyzone'
provide 'progressbar'
provide 'qb-radialmenu'
provide 'qb-target'
provide 'Renewed-Vehiclekeys'
provide 'renewed-weathersync'
