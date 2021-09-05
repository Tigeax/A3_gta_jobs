// Add the dropoff action to the gta job owner

params ["_veh"];

_veh addAction ["Dropoff vehicle", "_this call life_fnc_gtaJobDropoffAction", nil, 5, true, true, "", "", 3];