fx_version 'cerulean'
game 'gta5'

shared_script 'init.lua'
server_scripts {
    'modules/detecter/supported/server.lua',
    'modules/detecter/resources/server.lua',
    'modules/selector/server.lua',
    'modules/provider/server.lua',
}
files {
    'compatibilities/ambulance/main.lua',
    'compatibilities/ambulance/ars_ambulance/client.lua',
    'compatibilities/ambulance/qb-ambulance/client.lua',

    'compatibilities/banking/main.lua',
    'compatibilities/banking/fd_banking/client.lua',
    'compatibilities/banking/qb-banking/client.lua',
    'compatibilities/banking/renewed-banking/client.lua',

    'compatibilities/core/main.lua',
    'compatibilities/core/qb-core/client.lua',
    'compatibilities/core/qbx_core/client.lua',

    'compatibilities/dispatch/main.lua',
    'compatibilities/dispatch/bub-mdt/client.lua',
    'compatibilities/dispatch/ps-dispatch/client.lua',

    'compatibilities/doorlock/main.lua',
    'compatibilities/doorlock/ox_doorlock/client.lua',
    'compatibilities/doorlock/qb-doorlock/client.lua',

    'compatibilities/fuel/main.lua',
    'compatibilities/fuel/cdn-fuel/client.lua',
    'compatibilities/fuel/lc_fuel/client.lua',
    'compatibilities/fuel/LegacyFuel/client.lua',
    'compatibilities/fuel/ox_fuel/client.lua',
    'compatibilities/fuel/ps-fuel/client.lua',
    'compatibilities/fuel/qb-fuel/client.lua',
    'compatibilities/fuel/Renewed-Fuel/client.lua',

    'compatibilities/housing/main.lua',
    'compatibilities/housing/ps-housing/client.lua',
    'compatibilities/housing/qb-housing/client.lua',

    'compatibilities/input/main.lua',
    'compatibilities/input/ox_lib/client.lua',
    'compatibilities/input/qb-input/client.lua',

    'compatibilities/inventory/main.lua',
    'compatibilities/inventory/ox_inventory/client.lua',
    'compatibilities/inventory/qb-inventory/client.lua',

    'compatibilities/management/main.lua',
    'compatibilities/management/qb-management/client.lua',
    'compatibilities/management/qbx_management/client.lua',
    
    'compatibilities/menu/main.lua',
    'compatibilities/menu/ox_lib/client.lua',
    'compatibilities/menu/qb-menu/client.lua',
    
    'compatibilities/polyzone/main.lua',
    'compatibilities/polyzone/ox_lib/client.lua',
    'compatibilities/polyzone/polyzone/client.lua',

    'compatibilities/progressbar/main.lua',
    'compatibilities/progressbar/ox_lib/client.lua',
    'compatibilities/progressbar/progressbar/client.lua',

    'compatibilities/radialmenu/main.lua',
    'compatibilities/radialmenu/ox_lib/client.lua',
    'compatibilities/radialmenu/qb-radialmenu/client.lua',

    'compatibilities/target/main.lua',
    'compatibilities/target/ox_target/client.lua',
    'compatibilities/target/qb-target/client.lua',
    
    'compatibilities/vehiclekeys/main.lua',
    'compatibilities/vehiclekeys/qb-vehiclekeys/client.lua',
    'compatibilities/vehiclekeys/qbx_vehiclekeys/client.lua',
    'compatibilities/vehiclekeys/Renewed-Vehiclekeys/client.lua',

    'compatibilities/weather/main.lua',
    'compatibilities/weather/cd_easytime/client.lua',
    'compatibilities/weather/qb-weathersync/client.lua',
    'compatibilities/weather/renewed-weathersync/client.lua',
}