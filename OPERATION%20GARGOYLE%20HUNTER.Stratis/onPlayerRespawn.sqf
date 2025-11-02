params ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];

private _loadout = player getVariable ["savedLoadout", []];

// Check if there is a saved loadout
if (!(_loadout isEqualTo [])) then {
	// Restore the unit's loadout when they respawn
	player setUnitLoadout _loadout;
};



if (player == SolidSnake) then {
	execVM "initSnake.sqf";
};