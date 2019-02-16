private ["_opfor","_blufor","_pos","_i","_datos","_numCiv","_numVeh","_roads","_prestigeOPFOR","_prestigeBLUFOR"];

waitUntil {!cityIsSupportChanging};
cityIsSupportChanging = true;

_opfor = _this select 0;
_blufor = _this select 1;
_pos = _this select 2;

private _cities = [];
if (typeName _pos == typeName "") then {
	// if a city name was passed in directly
	_cities = [[_pos, 1]];
} else {
	// else if it is a position we calculate effect on nearby towns.
	_cities = [];
	{
		private _distKm = ((getMarkerPos _x) distance _pos) / 1000;
		private _effect = 1 min (2/(1 + _distKm));
		// This effect terminates at about 4km
		if (_effect > 0.2) then {
			_cities pushback [_x, _effect];
		};
	} forEach ciudades;
};

{
	private _ciudad = _x select 0;
	private _effect = _x select 1;
	private _opforAdjusted = _effect * _opfor;
	private _bluforAdjusted = _effect * _blufor;

	_datos = server getVariable _ciudad;
	if (!(_datos isEqualType [])) exitWith {citySupportChanging = true; diag_log format ["Antistasi Error in citysupportchange.sqf. Passed %1 as reference",_pos]};
	_numCiv = _datos select 0;
	_numVeh = _datos select 1;
	_prestigeOPFOR = _datos select 2;
	_prestigeBLUFOR = _datos select 3;

	if (_prestigeOPFOR + _prestigeBLUFOR + _opforAdjusted > 100) then {
		_opforAdjusted = (_prestigeOPFOR + _prestigeBLUFOR) - 100;
	};
	_prestigeOPFOR = _prestigeOPFOR + _opforAdjusted;
	if (_prestigeOPFOR + _prestigeBLUFOR + _bluforAdjusted > 100) then {
		_bluforAdjusted = (_prestigeOPFOR + _prestigeBLUFOR) - 100;
	};
	_prestigeBLUFOR = _prestigeBLUFOR + _bluforAdjusted;


	if (_prestigeOPFOR > 100) then {_prestigeOPFOR = 100};
	if (_prestigeBLUFOR > 100) then {_prestigeBLUFOR = 100};
	if (_prestigeOPFOR < 0) then {_prestigeOPFOR = 0};
	if (_prestigeBLUFOR < 0) then {_prestigeBLUFOR = 0};

	_datos = [_numCiv, _numVeh,_prestigeOPFOR,_prestigeBLUFOR];

	server setVariable [_ciudad,_datos,true];
} forEach _cities;

cityIsSupportChanging = false;
true