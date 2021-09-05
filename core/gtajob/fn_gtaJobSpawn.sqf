
params ["_vehType", "_rewardAmount", "_expRewardAmount", "_carAlarmChance", "_carTrackerChance"];


// Get all markers where there is no player in the area, based on the distance defined in the marker name
_possibleSpawnMarkers = [];

{
	_markerName = _x;
	_markerPos = getMarkerPos _markerName;
	_noPlayerDistance = parseNumber ((_markerName splitString "_") select 1); // Split the markername by '_', select the second element and parse it to a number
	
	if (count (allUnits inAreaArray [_markerPos, _noPlayerDistance, _noPlayerDistance]) == 0) then {

		// Check if there is no vehicle at the spawnpoint
		if(count (vehicles inAreaArray [_markerPos, 5, 5]) == 0) then {
			_possibleSpawnMarkers pushBack _markerName;
		};
	};

} forEach gtaJobSpawnMarkers;

// Error if there are no possible spawn points
if (count _possibleSpawnMarkers == 0) exitWith {
	systemChat "LOG: Could not find suitable spawn location!";
	false;
};


// Select a random spawn marker
_spawnMarker = selectRandom _possibleSpawnMarkers;

// Select random dropoff marker
_dropoffMarker = selectRandom gtaJobDropoffMarkers;


// Spawn the vehicle
_veh = _vehType createVehicle getMarkerPos _spawnMarker;
_veh setDir markerDir _spawnMarker;


// Set vehicle state
_veh lock true;

_carAlarm = random 100 < _carAlarmChance;
_carTracker = random 100 < _carTrackerChance;
_copsCalled = false;

if (_carAlarm) then {
	_copsCalled = random 100 < 80; // 80% chance to to have the cops called
} else {
	_copsCalled = random 100 < 30; // 30% chance if the car does not have an alarm
};

_veh setVariable ['gtaJobOwner', player, true];
_veh setVariable ['gtaJobAlarm', _carAlarm, true];
_veh setVariable ['gtaJobTracker', _carTracker, true];
_veh setVariable ['gtaJobCopsCalled', _copsCalled, true];
_veh setVariable ['gtaJobRewardAmount', _rewardAmount, true];
_veh setVariable ['gtaJobExpRewardAmount', _expRewardAmount, true];
_veh setVariable ['gtaJobDropoffMarker', _dropoffMarker, true];


// Add unlock action to the vehicle
_veh addAction ["Lockpick", "_this call life_fnc_gtaJobLockpickAction", nil, 5, true, true, "", "_this == _originalTarget getVariable 'gtaJobOwner'", 3];


_vehName = getText (configFile >> "CfgVehicles" >> typeOf _veh >> "displayName");
_vehNearLoc = text nearestLocation [getPos _veh, ""];
_dropoffNearLoc = text nearestLocation [getMarkerPos _dropoffMarker, ""];

// Create vehicle map marker for player
deleteMarkerLocal "gtaJobMarker";
_marker = createMarkerLocal ["gtaJobMarker", getMarkerPos _spawnMarker];
_marker setMarkerTextLocal format ["Steal %1", _vehName];
_marker setMarkerTypeLocal "hd_dot";

// Create dropoff marker for the player
deleteMarkerLocal "gtaJobDropoffMarker";
_marker = createMarkerLocal ["gtaJobDropoffMarker", getMarkerPos _dropoffMarker];
_marker setMarkerTextLocal "Vehicle dropoff point";
_marker setMarkerTypeLocal "hd_dot";

// Notify the player
hint format["Steal the %1 near %2 and drop it off near %3", _vehName, _vehNearLoc, _dropoffNearLoc]; 