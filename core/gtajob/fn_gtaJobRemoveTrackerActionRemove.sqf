// Remove an action on another client

params ["_veh"];

_actionID = player getVariable 'gtaJobRemoveTrackerActionId';

_veh removeAction _actionID;