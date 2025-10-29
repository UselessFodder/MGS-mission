theMech setVariable ["_numHits", 0]; 
theMech allowCrewInImmobile true;
{
	_x allowDamage false;
	
} forEach crew theMech;

theMech addEventHandler ["HandleDamage", 
	{
		private ["_veh","_dmg","_overalldamage"];
		_veh = _this select 0;
		_dmg = _this select 2;
		_overalldamage = (damage _veh) + _dmg;
		
		_setPause = {
			theMech setFuel 0;
			private _gunner = gunner theMech;
			_gunner disableAI "ALL";
			hint "refueling";
			_smoke1 = "test_EmptyObjectForSmoke" createVehicle position theMech; 
			_smoke1 attachTo[theMech,[0,1.5,-1]];
			_smoke2 = "test_EmptyObjectForSmoke" createVehicle position theMech; 
			_smoke2 attachTo[theMech,[1,-0.5,2]];
			sleep 10;
			theMech setFuel 1;
			_gunner enableAI "ALL";
			hint "fuel restored";
			deleteVehicle _smoke1;
			deleteVehicle _smoke2;
		};
		
		if (_dmg > 0.2 && fuel theMech > 0) then
		{
			private _totalHits = _veh getVariable "_numHits";
			if (_totalHits > 4) then {
				_veh setVariable ["_numHits", 0];
				[] spawn _setPause;
			} else {
				_veh setVariable ["_numHits", _totalHits + 1];
			};
			false;
		} else
		{
			false;
		};
	}
];