fnc_moveRespawn = {
	while {true} do {
		if (alive SolidSnake) then {
			"respawn_west" setMarkerPos (getPos SolidSnake);
		};
		
		sleep 30;
	};
};

[] spawn fnc_moveRespawn;