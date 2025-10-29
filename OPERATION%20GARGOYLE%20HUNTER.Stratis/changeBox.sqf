// Alternates between snake and box disappearing to give appearance of hiding

_meme_chance = 100;

if (floor(random 100) < _meme_chance) then {
	[floor(random 4) + 1] spawn compile preProcessFile "goatspawn.sqf";
};
if (isObjectHidden theMan) then {
	theBox hideObjectGlobal true;
	theMan setCaptive 0;
	theMan hideObjectGlobal false;
} else {
	theBox hideObjectGlobal false;
	theMan setCaptive 1;
	theMan hideObjectGlobal true;
};