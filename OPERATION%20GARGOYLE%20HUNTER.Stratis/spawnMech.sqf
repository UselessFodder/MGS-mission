//spawn explosions to destroy building
private _bombSpawnX = getMarkerPos "spawnMech" select 0;
private _bombSpawnY = getMarkerPos "spawnMech" select 1;
private _bomb1 = "Bo_GBU12_LGB" createVehicle [_bombSpawnX +5, _bombSpawnY, 0];
sleep 0.1;
private _bomb2 = "Bo_GBU12_LGB" createVehicle [_bombSpawnX -5, _bombSpawnY, 0];
sleep 0.1;
private _bomb2 = "Bo_GBU12_LGB" createVehicle [_bombSpawnX, _bombSpawnY +5, 0];
sleep 0.1;
private _bomb2 = "Bo_GBU12_LGB" createVehicle [_bombSpawnX, _bombSpawnY -5, 0];
sleep 0.1;
mechHanger setDamage 1;

sleep 0.5;

//spawn METAL GEAR
theMech = "Tomahawk_Red_UNS" createVehicle getMarkerPos "spawnMech";
private _MechGroup = east createVehicleCrew theMech;
theMech setDir 103.358; 

publicVariable "theMech";

//set up health system
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

//steer it towards the enemy
_MechGroup addWaypoint [getMarkerPos "moveMark_1", 0];
_MechGroup addWaypoint [getMarkerPos "moveMark_2", 0];
_MechGroup addWaypoint [getMarkerPos "moveMark_3", 0];