params ["_amnt"];

_goat_num = _amnt;

_max_goats = 100;
_current_goats = count (agents select {typeOf (agent _x) isEqualTo "Goat_random_F" });

if ((_max_goats - _current_goats) > 0) then {
    _goats_to_spawn = _goat_num min (_max_goats - _current_goats);
    
    for "_i" from 1 to _goats_to_spawn do {
        _goats = createAgent ["Goat_random_F", getPos player, [], 5, "CAN_COLLIDE"];
    };

    [theMan, [selectRandom ["invisible", "waiting", "dna", "cheeks", "metalGear"], 100, 1]] remoteExec ["say3D", ([0, -2] select isDedicated), true];
} else {
        systemChat "At max goat capacity!";
};