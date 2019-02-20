private _veh = cursorObject;
if (_veh isKindOf "landVehicle") then {
	_veh spawn {
		sleep 5 + random(15);
		doGetOut (crew _this);
	};
};
 