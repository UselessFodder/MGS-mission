params ["_player", "_didJIP"];

// Add the event handler for the arsenal closing
[missionNamespace,"arsenalClosed", {
    // Save the unit's loadout when the arsenal is closed
    player setVariable ["savedLoadout", getUnitLoadout player];
}] call BIS_fnc_addScriptedEventHandler;

["ace_arsenal_displayClosed", {
    // Save the unit's loadout when the arsenal is closed
    player setVariable ["savedLoadout", getUnitLoadout player];
}] call CBA_fnc_addEventHandler;

//prevent respawn cheese/weirdness if no arsenal is used yet
player setVariable ["savedLoadout", getUnitLoadout player];



if (_player == SolidSnake) then {
	execVM "initSnake.sqf";
};