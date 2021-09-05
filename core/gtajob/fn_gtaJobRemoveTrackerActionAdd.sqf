// Add an action on another client

params ["_veh"];

_actionID = _veh addAction ["Remove tracker", "_this call life_fnc_gtaJobRemoveTrackerAction", nil, 5, true, true, "", "(driver _originalTarget) != _this", 5];

player setVariable ['gtaJobRemoveTrackerActionId', _actionID, false];
