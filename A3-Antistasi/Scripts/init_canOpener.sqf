// From here, thanks iceman77!: https://forums.bohemia.net/forums/topic/157916-vehicle-flip-script-to-share/
if (!isDedicated) then {

    private _actionDef =  [
        "<t color='#FF0000'>Get out now!</t>", 
        "Scripts\canOpenerAction.sqf", 
        [], 
        0, 
        false, 
        true, 
        "", 
        "_this == (vehicle _target) && " + 
        "cursorObject isKindOf 'landVehicle' && " +
        "(_this distance cursorObject) < 5" + 
        "count (crew cursorObject) > 0 && " + 
        "(side ((crew cursorObject) select 0)) != (side _this) && " + 
        "!(canMove cursorObject)"
    ];

    waitUntil {!isNull player && {time > 0}};

    player addAction _actionDef;
    player addEventHandler ["Respawn", {
        (_this select 0) addAction _actionDef;
    }];
};
