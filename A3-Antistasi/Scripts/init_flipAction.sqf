// From here, thanks iceman77!: https://forums.bohemia.net/forums/topic/157916-vehicle-flip-script-to-share/
if (!isDedicated) then {

    private _actionDef =  [
        "<t color='#FFFF00'>Flip Vehicle</t>", 
        "Scripts\FlipAction.sqf", 
        [], 
        0, 
        false, 
        true, 
        "", 
        "_this == (vehicle _target) && " + 
        "cursorObject isKindOf 'landVehicle' && " +
        "(_this distance cursorObject) < 5" +
        "(vectorUp cursorTarget) select 2 < 0"
    ];

    waitUntil {!isNull player && {time > 0}};

    player addAction _actionDef;
    player addEventHandler ["Respawn", {
        (_this select 0) addAction _actionDef;
    }];
};
