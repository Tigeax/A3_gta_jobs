params ["_veh"];

_vehId = format["gtaJobStolenCarTracker%1", [_veh] call BIS_fnc_objectVar];
_vehName = getText (configFile >> "CfgVehicles" >> typeOf _veh >> "displayName");

// Create marker
_marker = createMarkerLocal [_vehId, getPos _veh];
_marker setMarkerTextLocal format ["Stolen %1", _vehName];
_marker setMarkerTypeLocal "hd_dot";

// Update the location every 5 seconds
while {alive _veh && not isNull _veh && _veh getVariable 'gtaJobTracker'} do {

	_marker setMarkerPosLocal getPos _veh;
	sleep 5;
};

deleteMarkerLocal _marker;