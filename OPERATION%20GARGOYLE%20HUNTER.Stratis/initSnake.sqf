theBox attachTo [SolidSnake, [0, 0.15, -0.1], "Pelvis"];
theBox setDir (getDir SolidSnake)-90;
theBox hideObjectGlobal true;

//SAY METAL GEAR
SolidSnake addAction [
	"METAL GEAR",
	{
		[SolidSnake, ["metalGear", 100, 1]] remoteExec ["say3D", ([0, -2] select isDedicated), true];
	},
	[], // No arguments
	1.5, // Priority
	false, // Show window
	true, // Hide on use
	"", // Shortcut
	"true" // Condition (always show the action)
];

// Add box hiding action to ACE menu
_condition = {
	true
};
_statement = {
   [_target] execVM "changeBox.sqf";
};
_action = ["Stealth Box", "Get In/Out of Box", "", _statement, _condition] call ace_interact_menu_fnc_createAction;
[SolidSnake, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;


// Add health scripting to make Snake far more resiliant
SolidSnake addEventHandler ["HandleDamage", 
	{
		private ["_unit","_dmg","_overalldamage"];
		_unit = _this select 0;
		_dmg = _this select 2;
		_overalldamage = (damage _unit) + 0.05;
		
		//_overalldamage;
		0.05;
	}
];