
params ["_difficulty"];

// Get parameters
_carAlarmChance = getNumber (missionConfigFile >> "GTAJobs" >> _difficulty >> "carAlarmChance");
_trackerChance = getNumber (missionConfigFile >> "GTAJobs" >> _difficulty >> "trackerChance");
_cost = getNumber (missionConfigFile >> "GTAJobs" >> _difficulty >> "cost");
_rewardMin = getNumber (missionConfigFile >> "GTAJobs" >> _difficulty >> "rewardMin");
_rewardMax = getNumber (missionConfigFile >> "GTAJobs" >> _difficulty >> "rewardMax");
_expReward = getNumber (missionConfigFile >> "GTAJobs" >> _difficulty >> "expReward");
_vehicles = getArray (missionConfigFile >> "GTAJobs" >> _difficulty >> "vehicles");
_vehicleClass = selectRandom _vehicles;
_reward = floor (_rewardMin + (random (_rewardMax - _rewardMin))); // Generate reward amount between min and max

// Take money
if (_cost > CASH) exitWith {hint localize "STR_ATM_NotEnoughCash"};
CASH = CASH - _cost;
[0] call SOCK_fnc_updatePartial;

// Set cooldown time
player setVariable ['gtaJobTimeSinceLastMission', floor (time / 60), false];

// Start gta job
[_vehicleClass, _reward, _expReward, _carAlarmChance, _trackerChance] spawn life_fnc_gtaJobSpawn;

