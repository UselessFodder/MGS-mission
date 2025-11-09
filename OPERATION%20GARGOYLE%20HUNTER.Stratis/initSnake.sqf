theBox attachTo [SolidSnake, [0, 0.15, -0.1], "Pelvis"];
theBox setDir (getDir SolidSnake)-90;
//theBox hideObjectGlobal true;
[theBox, true] remoteExec ["hideObjectGlobal", 2];

//SAY METAL GEAR
waitUntil { !isNull (findDisplay 46) };

keydown_fnc = {   
 switch (_this) do {   
  {  
	case _x: {    
		[SolidSnake, ["metalGear", 100, 1]] remoteExec ["say3D", ([0, -2] select isDedicated), true];
	};     
  } foreach (actionKeys "User10");   
 };   
};   
   
(findDisplay 46) displayAddEventHandler ["KeyDown","_this select 1 call keydown_fnc;false;"];  


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
		
		_overalldamage;
		//0.05;
	}
];