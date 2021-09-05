
waitUntil {!isNull (findDisplay 46)}; // Wait until everything is loaded


//player addAction ["GTA Job Menu", "[] spawn life_fnc_gtaJobDialog"];


// Add eventhandler, core/event/fn_keyHanderl.sqf, for KeyDown
(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call life_fnc_keyHandler"];