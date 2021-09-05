// Supposed to be called from an Engine eventhandler, created in gtaJobLockpickAction

params ["_veh", "_engineState"];

// Exit if engine is turned off
if (!(_engineState)) exitWith {};

// Alert bluefor
_vehName = getText (configFile >> "CfgVehicles" >> typeOf _veh >> "displayName");
_vehNearLoc = text nearestLocation [getPos _veh, "nameCity"];
systemChat format["An anti-theft tracker on a %1 near %2 has gone off!", _vehName, _vehNearLoc];

// Notify player
hint "This car is equipped with a tracker! Remove it before dropping it off";

// Put a local tracker marker at the car's position for each bluefor unit
[_veh] remoteExec ["life_fnc_gtaJobCreateTrackerMarker"];

// Remove the event handler so the event doesn't trigger twice
_engineEventHandlerId = _veh getVariable "gtaJobEngineEventHandlerId";
_veh removeEventHandler ["Engine", _engineEventHandlerId];

// Add action to remove the tracker for all players (action only shows then player is not the driver of the vehicle)
[_veh] remoteExec ['life_fnc_gtaJobRemoveTrackerActionAdd'];