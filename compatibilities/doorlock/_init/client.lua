---@diagnostic disable: duplicate-set-field
Doorlock = {}

Doorlock.SetDoorState = function(doorId, state)
    print('No doorlock resource available - SetDoorState called', 'warn')
    return false
end

Doorlock.GetDoorState = function(doorId)
    print('No doorlock resource available - GetDoorState called', 'warn')
    return nil
end

Doorlock.ToggleDoor = function(doorId)
    print('No doorlock resource available - ToggleDoor called', 'warn')
    return false
end