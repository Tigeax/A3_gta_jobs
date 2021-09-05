
params [
    "_ctrl",
    "_code",
    "_shift",
    "_ctrlKey",
    "_alt"
];

private _speed = speed cursorObject;
private _handled = false;
private _interruptionKeys = [17, 30, 31, 32, 57, 230]; //A, S, W, D, spacebar, middle mouse

if (life_action_inUse) exitWith {

    if (!life_interrupted && _code in _interruptionKeys) then {
        life_interrupted = true
    };

    _handled;
};


if (life_container_active) exitwith {

    //ignore movement actions
    private _allowedMoves = [
        "MoveForward",
        "MoveBack",
        "TurnLeft",
        "TurnRight",
        "MoveFastForward",
        "MoveSlowForward",
        "turbo",
        "TurboToggle",
        "MoveLeft",
        "MoveRight",
        "WalkRunTemp",
        "WalkRunToggle",
        "AdjustUp",
        "AdjustDown",
        "AdjustLeft",
        "AdjustRight",
        "Stand",
        "Crouch",
        "Prone",
        "MoveUp",
        "MoveDown",
        "LeanLeft",
        "LeanLeftToggle",
        "LeanRight",
        "LeanRightToggle"
    ];

    if (({_code in (actionKeys _x)} count _allowedMoves) > 0) exitwith {
        false;
    };

    true;
};

switch (_code) do {

    // Open spectator cam (shift + 7) remove in production!
    case 8: {
        if (_shift) then {
            ["Init"] call BIS_fnc_camera;
            _handled = true
        };
    };
};

_handled;
