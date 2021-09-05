params ["_veh", "_caller", "_actionId", "_arguments"];

_dropoffMarker = _veh getVariable 'gtaJobDropoffMarker';

// Exit if the vehicle is not near the dropoff point
if ((_veh distance getMarkerPos _dropoffMarker) > 20) exitWith {
	hint "Vehicle is not near the dropoff point";
};


// Remove the action so it can't be activiated again
_veh removeAction _actionId;

// Setup progress bar
life_action_inUse = true;
_interrupted = false;

"progressBar" cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText "0%";
_progress progressSetPosition 0;
_cP = 0;

// Run progressbar
for "_i" from 0 to 1 step 0 do {

	uiSleep  0.1;

	// Increment the progressbar
	_cP = _cP + 1;
	_progress progressSetPosition (_cP / 100);
	_pgText ctrlSetText format ["%1%2", _cp, "%"];

	// Check if the player is near the car
	if ((player distance _veh) > 10) exitWith {
		_interrupted = true;
	};

	// Check if the vehicle is near the dropoff point
	if ((_veh distance getMarkerPos _dropoffMarker) > 20) exitWith {
		_interrupted = true;
	};

	// Check if the progressbar finished
	if (_cP >= 100) exitWith {};
};

life_action_inUse = false;
"progressBar" cutText ["", "PLAIN"]; // Remove progressbar from screen

// Exit if the progress bar was interrupted and thus didn't finish
if (_interrupted) exitWith {
	titleText ["Action cancelled", "PLAIN"];

	// Add back dropoff action
	_veh addAction ["Dropoff vehicle", "_this call life_fnc_gtaJobDropoffAction", nil, 5, true, true, "", "", 3];
};

titleText ["Dropped off vehicle", "PLAIN"];

// Delete vehicle
deleteVehicle _veh;

// Delete markers
deleteMarkerLocal "gtaJobMarker";
deleteMarkerLocal "gtaJobDropoffMarker";

// Give exp reward
_expReward = _veh getVariable 'gtaJobExpRewardAmount';
GTAJOBEXP = GTAJOBEXP + _expReward;
[1212] call SOCK_fnc_updatePartial;

// Give player money reward
_reward = _veh getVariable 'gtaJobRewardAmount';
CASH = CASH + _reward;
[0] call SOCK_fnc_updatePartial;
hint format ["You got payed $%1", _reward];




