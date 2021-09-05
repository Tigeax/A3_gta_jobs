params ["_veh"];

// Only spawn for bluefor
if (side player != WEST) exitWith {};


_vehId = format["gtaJobStolenCarMarker%1", [_veh] call BIS_fnc_objectVar];
_vehName = getText (configFile >> "CfgVehicles" >> typeOf _veh >> "displayName");

// Create marker
_marker = createMarkerLocal [_vehId, getPos _veh];
_marker setMarkerTextLocal format ["Stolen %1", _vehName];
_marker setMarkerTypeLocal "hd_dot";

sleep 180; // Wait 5min

// Delete marker
deleteMarkerLocal _marker;