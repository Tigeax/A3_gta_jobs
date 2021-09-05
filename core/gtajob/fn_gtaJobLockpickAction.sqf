params ["_veh", "_caller", "_actionId", "_arguments"];

// Remove the action so it can't be activiated again
_veh removeAction _actionId;

// Get vehicle variables
_carAlarm = _veh getVariable 'gtaJobAlarm';
_carTracker = _veh getVariable 'gtaJobTracker';
_copsCalled = _veh getVariable 'gtaJobCopsCalled';


if (_copsCalled) then {

	_vehName = getText (configFile >> "CfgVehicles" >> typeOf _veh >> "displayName");
	_vehNearLoc = text nearestLocation [getPos _veh, "nameCity"];

	// Alert bluefor
	systemChat format["A civillian has spotted someone trying to steal a %1 near %2", _vehName, _vehNearLoc];

	// Put a local marker at the car's position for each bluefor unit
	[_veh] remoteExec ["life_fnc_gtaJobCreateStolenCarMarker"];

	// Alert civ stealing the car
	hint "Somone has called the cops!";
};


if (_carAlarm) then {

	_veh setVariable ['gtaJobCarAlarmPlay', true, true];

	// Start car alarm sound loop
	[_veh] spawn {
		params ["_veh"];

		for "_i" from 0 to 1 step 0 do {
			[_veh, 'Orange_Car_Alarm_Loop_01', 100, 1] remoteExec ["life_fnc_say3D", 0];
			sleep 2.25;

			if (!(_veh getVariable 'gtaJobCarAlarmPlay')) exitWith {}

		};

	};
};


life_interrupted = false;
life_action_inUse = true;

// Setup progress bar.
"progressBar" cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText "0%";
_progress progressSetPosition 0;
_cP = 0;

// Run progressbar
for "_i" from 0 to 1 step 0 do {

	// Put the player in animation
	if (animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};

	//uiSleep  0.3;
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
_veh setVariable ['gtaJobCarAlarmPlay', false, true]; // Stop car alarm sound

// Exit if the progress bar was interrupted and thus didn't finish
if (life_interrupted) exitWith {
	life_interrupted = false;
	titleText ["Action cancelled", "PLAIN"];
	// Add back the unlock action to the vehicle
	_veh addAction ["Lockpick", "_this call life_fnc_gtaJobLockpickAction", nil, 5, true, true, "", "", 3];
};

titleText ["Vehicle lockpicked", "PLAIN"];

// Unlock the vehicle
_veh lock false;

// If the car is supposed to have a tracker. Add on engine start event. And setup the tracker
if (_carTracker) then {
	_engineEventHandlerId = _veh addEventHandler ["Engine", "_this call life_fnc_gtaJobStartTracker"];
	_veh setVariable ['gtaJobEngineEventHandlerId', _engineEventHandlerId, true];
	_veh setVariable ['gtaJobRemoveTrackerProgress', 0, true];
} else {
	// Add dropoff action
	_veh addAction ["Dropoff vehicle", "_this call life_fnc_gtaJobDropoffAction", nil, 5, true, true, "", "", 3];
}