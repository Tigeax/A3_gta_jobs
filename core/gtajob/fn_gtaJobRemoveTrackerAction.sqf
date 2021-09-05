params ["_veh", "_caller", "_actionId", "_arguments"];

// Remove the tracker action so it can't be activiated again
[_veh] remoteExec ['life_fnc_gtaJobRemoveTrackerActionRemove'];

life_interrupted = false;
life_action_inUse = true;

// Setup progress bar.
"progressBar" cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_cP = _veh getVariable 'gtaJobRemoveTrackerProgress';

_progress progressSetPosition (_cP / 100);
_pgText ctrlSetText format ["%1%2", _cp, "%"];

life_is_processing = true;

// Run progressbar
for "_i" from 0 to 1 step 0 do {

	// Put the player in animation if the player is not in a vehicle
	if (animationState player != "AinvPknlMstpSnonWnonDnon_medic_1" && vehicle _caller == _caller) then {
		player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};

	//uiSleep 1.5;
	uiSleep 0.1;

	// Increment the progressbar
	_cP = _cP + 1;
	_progress progressSetPosition (_cP / 100);
	_pgText ctrlSetText format ["%1%2", _cp, "%"];

	// Check if the progressbar finished
	if (_cP >= 100) exitWith {};

	// Check if the progressbar was interrupted (see fn_keyHandler)
	if (life_interrupted) exitWith {};
};

life_action_inUse = false;
"progressBar" cutText ["", "PLAIN"]; // Remove progressbar from screen
player playActionNow "stop"; // Stop player animation
_veh setVariable ['gtaJobRemoveTrackerProgress', _cP, true];

// Exit if the progress bar was interrupted and thus didn't finish
if (life_interrupted) exitWith {
	titleText ["Stopped removing tracker", "PLAIN"];
	life_interrupted = false;

	// Add action to remove the tracker for all players (action only shows then player is not the driver of the vehicle)
	[_veh] remoteExec ['life_fnc_gtaJobRemoveTrackerActionAdd'];

};

titleText ["Tracker removed", "PLAIN"];

// Remove the tracker
_veh setVariable ['gtaJobTracker', false, true];

// Add dropoff action
_gtaJobOwner = _veh getVariable 'gtaJobOwner';
[_veh] remoteExec ['life_fnc_gtaJobDropoffVehicleActionAdd', _gtaJobOwner];


