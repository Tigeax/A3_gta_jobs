// Find all markers to for the GTA Job spawn locations.
// Example marker name 'gtajobspawn_100_4'
// The marker has to start with 'gtajobspawn_'
// The second argument after the '_' is the distance players have to be from the marker to allow the vehicle to be spawned. (So it is spawned out of sight)
// Anything after the second '_' is igonored and can be used to make the marker name unique.

gtaJobSpawnMarkers = [];

{
	if (["gtajobspawn_", _x] call BIS_fnc_inString) then {
		gtaJobSpawnMarkers pushBack _x;
	};
} forEach allMapMarkers;

publicVariable "gtaJobSpawnMarkers";

// Find all markers to for the GTA Job dropoff locations.

gtaJobDropoffMarkers = [];

{
	if (["gtajobdropoff_", _x] call BIS_fnc_inString) then {
		gtaJobDropoffMarkers pushBack _x;
	};
} forEach allMapMarkers;

publicVariable "gtaJobDropoffMarkers";
