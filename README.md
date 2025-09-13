# tr_compatibilities

Universal compatibility system for FiveM resources that automatically detects and routes missing resource calls to available alternatives.

## How It Works

1. **Resource Detection**: On startup, tr_compatibilities scans for available resources on your server
2. **Smart Interception**: Only intercepts calls to missing resources that have configured alternatives
3. **Automatic Routing**: Routes missing resource calls to compatible alternatives with format conversion
4. **Stay Out of the Way**: Doesn't interfere with resources that are already available

## Supported Resource Mappings

### Target Systems
- `ox_target` ↔ `qb-target`

### Inventory Systems  
- `ox_inventory` ↔ `qb-inventory`

### Menu/UI Systems
- `ox_lib` ↔ `qb-menu`, `qb-input`, `qb-radialmenu`, `progressbar`, `polyzone`

### Door Lock Systems
- `qb-doorlock` ↔ `ox_doorlock`

### Fuel Systems
- `LegacyFuel`, `ox_fuel`, `ps-fuel`, `Renewed-Fuel`, `lc_fuel`, `cdn-fuel`, `qb-fuel` (all interchangeable)

### Banking Systems
- `renewed-banking`, `fd_banking`, `qb-banking` (all interchangeable)

### Housing Systems
- `ps-housing` ↔ `qb-housing`

### Vehicle Keys Systems
- `qb-vehiclekeys`, `qbx_vehiclekeys`, `Renewed-Vehiclekeys` (all interchangeable)

### Weather/Time Systems
- `cd_easytime`, `qb-weathersync`, `renewed-weathersync` (all interchangeable)

### Management Systems
- `qb-management` ↔ `qbx_management`

### Dispatch/MDT Systems
- `bub-mdt` ↔ `ps-dispatch`

### Core Systems
- `qb-core` ↔ `qbx_core`

### Ambulance/EMS Systems
- `qb-ambulance` ↔ `ars_ambulance`

## Example Scenarios

**Server has:** `qb-menu`, `qb-target`, `qb-weathersync`

- **Script calls `exports['esx-menu']:openMenu()`** → tr_compatibilities intercepts → routes to `qb-menu` ✅
- **Script calls `exports['qb-menu']:openMenu()`** → tr_compatibilities does nothing (qb-menu exists) ✅
- **Script calls `exports.ox_target:addBoxZone()`** → tr_compatibilities intercepts → routes to `qb-target` ✅
- **Script calls `exports['renewed-weathersync']:setWeather()`** → tr_compatibilities intercepts → routes to `qb-weathersync` ✅

## Installation

1. Place `tr_compatibilities` in your `resources/[dev]/` folder
2. Add `ensure tr_compatibilities` to your server.cfg
3. Start your server - tr_compatibilities will automatically detect and configure routing

## Configuration

Edit `config.lua` to:
- Enable/disable debug logging
- Modify resource mappings
- Add new resource compatibility mappings

## File Structure

```
tr_compatibilities/
├── fxmanifest.lua          # Resource manifest with provide statements
├── config.lua              # Configuration and mappings
├── core/main.lua           # Main detection and routing logic
├── compatibilities/               # Resource-specific compatibilities
│   ├── target/
│   ├── inventory/
│   ├── menu/
│   ├── input/
│   ├── progressbar/
│   ├── core/
│   └── ...
└── utils/format-converter.lua  # Data format conversion utilities
```

## Debug Mode

Enable debug mode in `config.lua` to see detailed logging:
- Resource detection results
- Active interceptions being set up
- Export calls being routed
- Format conversions being performed

## Adding New Resources

The system is designed to be easily extensible. To add support for new resources:

1. Add the resource mapping to `Config.ResourceMappings` in `config.lua`
2. Add the resource to the appropriate category in `Config.ResourceCategories`
3. Create an compatibilities file in the appropriate `compatibilities/` subfolder
4. Add the `provide` statement to `fxmanifest.lua`

The system will automatically detect and integrate new additions.
