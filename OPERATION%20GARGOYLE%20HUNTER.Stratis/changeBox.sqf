// Alternates between snake and box disappearing to give appearance of hiding
params ["_theMan"];

_meme_chance = 10;

if (floor(random 100) < _meme_chance) then {
	[floor(random 4) + 1] spawn compile preProcessFile "goatspawn.sqf";
};
if (isObjectHidden _theMan) then {
	theBox hideObjectGlobal true;
	_theMan setCaptive 0;
	_theMan hideObjectGlobal false;
} else {
	theBox hideObjectGlobal false;
	_theMan setCaptive 1;
	_theMan hideObjectGlobal true;
};