// Alternates between snake and box disappearing to give appearance of hiding

if (isObjectHidden theMan) then {
	theBox hideObjectGlobal true;
	theMan setCaptive 0;
	theMan hideObjectGlobal false;
} else {
	theBox hideObjectGlobal false;
	theMan setCaptive 1;
	theMan hideObjectGlobal true;
};