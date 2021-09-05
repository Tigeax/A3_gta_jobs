disableSerialization;
_displayId = 1212;


createDialog "life_gtajob_dialog"; // Create dialog


waitUntil {!isNull (findDisplay _displayId);}; // Wait until the dialog is loaded

_display = findDisplay _displayId; // Get the display


// Calc cooldown
_timeMinSinceLastMission = profileNamespace getVariable 'gtaJobTimeSinceLastMission';
_cooldown = 0;

if (!(isNil '_timeMinSinceLastMission')) then {
	_cooldownAmount = getNumber (missionConfigFile >> "GTAJobs" >> "general" >> "cooldown");
	_cooldown = _cooldownAmount - floor (time / 60) - _timeMinSinceLastMission;

	if (_cooldown < 0) then {
		_cooldown = 0;
	};

};


// Set cooldown text
(_display displayCtrl 1301) ctrlSetText format ["Cooldown: %1min", _cooldown];

// Set exp text
_totalExp = GTAJOBEXP;

// Do some fancy math to calculate all the level stuff
_level = floor ((_totalExp/1000)^(1/1.2));
_expNeededCurrentLevel = floor (1000 * _level^1.2);
_expNeededNextLevel = floor (1000 * (_level + 1)^1.2);
_currentLevelExp = _totalExp - _expNeededCurrentLevel;
_neededExpForNextLevel = _expNeededNextLevel - _expNeededCurrentLevel;

(_display displayCtrl 1300) ctrlSetText format ["Level %1: %2/%3", _level, _currentLevelExp, _neededExpForNextLevel];


// Determine if buttons should be active

if (_cooldown > 0) exitWith {}; // Exit if cooldown is active

// Check conditions for each button
{
	_difficulty = _x select 0;
	_ctrlId =  _x select 1;

	_levelReq = getNumber (missionConfigFile >> "GTAJobs" >> _difficulty >> "levelReq");
	_condition = getText (missionConfigFile >> "GTAJobs" >> _difficulty >> "condition");

	_ctrlButton = _display displayCtrl _ctrlId;

	// If all conditions are met, make the button active
	if (_cooldown <= 0 && _level >= _levelReq && call compile _condition) then {
		_ctrlButton ctrlEnable true;
	};


} forEach [['easy', 1600], ['medium', 1601], ['hard', 1602], ['veryhard', 1603]];

