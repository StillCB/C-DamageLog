#include <a_samp>

#undef MAX_PLAYERS
#define MAX_PLAYERS 5

#define FILTERSCRIPT
#define  INFINITY (Float:0x7F800000)


new 
    Float:DarahBot,
    BotSpawn,
    PlayerText:CBusterLog[MAX_PLAYERS][12];


new const gBodyPart[][] = {
    "Unknown", "Unknown", "Unknown",
    "Chest", "Crotch", "Left Arm",
    "Right Arm", "Left Foot", "Right Foot",
    "Head"
};

#if defined FILTERSCRIPT
public OnFilterScriptInit() {
    print("Test damage \"%\" by CBuster");
    return 1;
}

public OnFilterScriptExit() {
    print("Makasih dah mau coba!");
    return 1;
}
#endif

public OnPlayerConnect(playerid) {
    CBusterLog[playerid][0] = CreatePlayerTextDraw(playerid, 500.365997, 143.333374, "box");
    PlayerTextDrawLetterSize(playerid, CBusterLog[playerid][0], 0.000000, 19.323570);
    PlayerTextDrawTextSize(playerid, CBusterLog[playerid][0], 605.000000, 0.000000);
    PlayerTextDrawAlignment(playerid, CBusterLog[playerid][0], 1);
    PlayerTextDrawColor(playerid, CBusterLog[playerid][0], -1);
    PlayerTextDrawUseBox(playerid, CBusterLog[playerid][0], 1);
    PlayerTextDrawBoxColor(playerid, CBusterLog[playerid][0], 255);
    PlayerTextDrawSetShadow(playerid, CBusterLog[playerid][0], 0);
    PlayerTextDrawSetOutline(playerid, CBusterLog[playerid][0], 0);
    PlayerTextDrawBackgroundColor(playerid, CBusterLog[playerid][0], 255);
    PlayerTextDrawFont(playerid, CBusterLog[playerid][0], 1);
    PlayerTextDrawSetProportional(playerid, CBusterLog[playerid][0], 1);
    PlayerTextDrawSetShadow(playerid, CBusterLog[playerid][0], 0);

    CBusterLog[playerid][1] = CreatePlayerTextDraw(playerid, 490.827178, 141.583389, "box");
    PlayerTextDrawLetterSize(playerid, CBusterLog[playerid][1], 0.000000, 1.660323);
    PlayerTextDrawTextSize(playerid, CBusterLog[playerid][1], 614.299926, 0.000000);
    PlayerTextDrawAlignment(playerid, CBusterLog[playerid][1], 1);
    PlayerTextDrawColor(playerid, CBusterLog[playerid][1], -1);
    PlayerTextDrawUseBox(playerid, CBusterLog[playerid][1], 1);
    PlayerTextDrawBoxColor(playerid, CBusterLog[playerid][1], -5963521);
    PlayerTextDrawSetShadow(playerid, CBusterLog[playerid][1], 0);
    PlayerTextDrawSetOutline(playerid, CBusterLog[playerid][1], 0);
    PlayerTextDrawBackgroundColor(playerid, CBusterLog[playerid][1], 255);
    PlayerTextDrawFont(playerid, CBusterLog[playerid][1], 1);
    PlayerTextDrawSetProportional(playerid, CBusterLog[playerid][1], 1);
    PlayerTextDrawSetShadow(playerid, CBusterLog[playerid][1], 0);

    CBusterLog[playerid][2] = CreatePlayerTextDraw(playerid, 511.279235, 140.416641, "Damage_Log");
    PlayerTextDrawLetterSize(playerid, CBusterLog[playerid][2], 0.400000, 1.600000);
    PlayerTextDrawAlignment(playerid, CBusterLog[playerid][2], 1);
    PlayerTextDrawColor(playerid, CBusterLog[playerid][2], -1);
    PlayerTextDrawSetShadow(playerid, CBusterLog[playerid][2], 0);
    PlayerTextDrawSetOutline(playerid, CBusterLog[playerid][2], 1);
    PlayerTextDrawBackgroundColor(playerid, CBusterLog[playerid][2], 255);
    PlayerTextDrawFont(playerid, CBusterLog[playerid][2], 1);
    PlayerTextDrawSetProportional(playerid, CBusterLog[playerid][2], 1);
    PlayerTextDrawSetShadow(playerid, CBusterLog[playerid][2], 0);

    CBusterLog[playerid][3] = CreatePlayerTextDraw(playerid, 503.645751, 167.250030, "Bot_ID: 0");
    PlayerTextDrawLetterSize(playerid, CBusterLog[playerid][3], 0.294113, 1.284999);
    PlayerTextDrawAlignment(playerid, CBusterLog[playerid][3], 1);
    PlayerTextDrawColor(playerid, CBusterLog[playerid][3], -1);
    PlayerTextDrawSetShadow(playerid, CBusterLog[playerid][3], 0);
    PlayerTextDrawSetOutline(playerid, CBusterLog[playerid][3], 0);
    PlayerTextDrawBackgroundColor(playerid, CBusterLog[playerid][3], 255);
    PlayerTextDrawFont(playerid, CBusterLog[playerid][3], 1);
    PlayerTextDrawSetProportional(playerid, CBusterLog[playerid][3], 1);
    PlayerTextDrawSetShadow(playerid, CBusterLog[playerid][3], 0);

    CBusterLog[playerid][4] = CreatePlayerTextDraw(playerid, 503.308776, 185.916717, "Health: 100");
    PlayerTextDrawLetterSize(playerid, CBusterLog[playerid][4], 0.294113, 1.284999);
    PlayerTextDrawAlignment(playerid, CBusterLog[playerid][4], 1);
    PlayerTextDrawColor(playerid, CBusterLog[playerid][4], -1);
    PlayerTextDrawSetShadow(playerid, CBusterLog[playerid][4], 0);
    PlayerTextDrawSetOutline(playerid, CBusterLog[playerid][4], 0);
    PlayerTextDrawBackgroundColor(playerid, CBusterLog[playerid][4], 255);
    PlayerTextDrawFont(playerid, CBusterLog[playerid][4], 1);
    PlayerTextDrawSetProportional(playerid, CBusterLog[playerid][4], 1);
    PlayerTextDrawSetShadow(playerid, CBusterLog[playerid][4], 0);

    CBusterLog[playerid][5] = CreatePlayerTextDraw(playerid, 503.319732, 204.333236, "Damage: 0.0 pB");
    PlayerTextDrawLetterSize(playerid, CBusterLog[playerid][5], 0.294113, 1.284999);
    PlayerTextDrawAlignment(playerid, CBusterLog[playerid][5], 1);
    PlayerTextDrawColor(playerid, CBusterLog[playerid][5], -1);
    PlayerTextDrawSetShadow(playerid, CBusterLog[playerid][5], 0);
    PlayerTextDrawSetOutline(playerid, CBusterLog[playerid][5], 0);
    PlayerTextDrawBackgroundColor(playerid, CBusterLog[playerid][5], 255);
    PlayerTextDrawFont(playerid, CBusterLog[playerid][5], 1);
    PlayerTextDrawSetProportional(playerid, CBusterLog[playerid][5], 1);
    PlayerTextDrawSetShadow(playerid, CBusterLog[playerid][5], 0);

    CBusterLog[playerid][6] = CreatePlayerTextDraw(playerid, 502.977142, 224.066360, "Using: Fist");
    PlayerTextDrawLetterSize(playerid, CBusterLog[playerid][6], 0.294113, 1.284999);
    PlayerTextDrawAlignment(playerid, CBusterLog[playerid][6], 1);
    PlayerTextDrawColor(playerid, CBusterLog[playerid][6], -1);
    PlayerTextDrawSetShadow(playerid, CBusterLog[playerid][6], 0);
    PlayerTextDrawSetOutline(playerid, CBusterLog[playerid][6], 0);
    PlayerTextDrawBackgroundColor(playerid, CBusterLog[playerid][6], 255);
    PlayerTextDrawFont(playerid, CBusterLog[playerid][6], 1);
    PlayerTextDrawSetProportional(playerid, CBusterLog[playerid][6], 1);
    PlayerTextDrawSetShadow(playerid, CBusterLog[playerid][6], 0);

    CBusterLog[playerid][7] = CreatePlayerTextDraw(playerid, 503.440155, 243.599594, "Bodypart: Unknown");
    PlayerTextDrawLetterSize(playerid, CBusterLog[playerid][7], 0.294113, 1.284999);
    PlayerTextDrawAlignment(playerid, CBusterLog[playerid][7], 1);
    PlayerTextDrawColor(playerid, CBusterLog[playerid][7], -1);
    PlayerTextDrawSetShadow(playerid, CBusterLog[playerid][7], 0);
    PlayerTextDrawSetOutline(playerid, CBusterLog[playerid][7], 0);
    PlayerTextDrawBackgroundColor(playerid, CBusterLog[playerid][7], 255);
    PlayerTextDrawFont(playerid, CBusterLog[playerid][7], 1);
    PlayerTextDrawSetProportional(playerid, CBusterLog[playerid][7], 1);
    PlayerTextDrawSetShadow(playerid, CBusterLog[playerid][7], 0);

    CBusterLog[playerid][8] = CreatePlayerTextDraw(playerid, 503.508666, 261.682922, "Range: Unknown");
    PlayerTextDrawLetterSize(playerid, CBusterLog[playerid][8], 0.294113, 1.284999);
    PlayerTextDrawAlignment(playerid, CBusterLog[playerid][8], 1);
    PlayerTextDrawColor(playerid, CBusterLog[playerid][8], -1);
    PlayerTextDrawSetShadow(playerid, CBusterLog[playerid][8], 0);
    PlayerTextDrawSetOutline(playerid, CBusterLog[playerid][8], 0);
    PlayerTextDrawBackgroundColor(playerid, CBusterLog[playerid][8], 255);
    PlayerTextDrawFont(playerid, CBusterLog[playerid][8], 1);
    PlayerTextDrawSetProportional(playerid, CBusterLog[playerid][8], 1);
    PlayerTextDrawSetShadow(playerid, CBusterLog[playerid][8], 0);

    CBusterLog[playerid][9] = CreatePlayerTextDraw(playerid, 499.397735, 281.133148, "-------------------");
    PlayerTextDrawLetterSize(playerid, CBusterLog[playerid][9], 0.400000, 1.600000);
    PlayerTextDrawAlignment(playerid, CBusterLog[playerid][9], 1);
    PlayerTextDrawColor(playerid, CBusterLog[playerid][9], -1);
    PlayerTextDrawSetShadow(playerid, CBusterLog[playerid][9], 0);
    PlayerTextDrawSetOutline(playerid, CBusterLog[playerid][9], 0);
    PlayerTextDrawBackgroundColor(playerid, CBusterLog[playerid][9], 255);
    PlayerTextDrawFont(playerid, CBusterLog[playerid][9], 1);
    PlayerTextDrawSetProportional(playerid, CBusterLog[playerid][9], 1);
    PlayerTextDrawSetShadow(playerid, CBusterLog[playerid][9], 0);

    CBusterLog[playerid][10] = CreatePlayerTextDraw(playerid, 535.611047, 295.499938, "unknown");
    PlayerTextDrawLetterSize(playerid, CBusterLog[playerid][10], 0.333001, 1.868333);
    PlayerTextDrawAlignment(playerid, CBusterLog[playerid][10], 1);
    PlayerTextDrawColor(playerid, CBusterLog[playerid][10], -1);
    PlayerTextDrawSetShadow(playerid, CBusterLog[playerid][10], 0);
    PlayerTextDrawSetOutline(playerid, CBusterLog[playerid][10], 0);
    PlayerTextDrawBackgroundColor(playerid, CBusterLog[playerid][10], 255);
    PlayerTextDrawFont(playerid, CBusterLog[playerid][10], 2);
    PlayerTextDrawSetProportional(playerid, CBusterLog[playerid][10], 1);
    PlayerTextDrawSetShadow(playerid, CBusterLog[playerid][10], 0);



    return 1;
}

public OnPlayerSpawn(playerid) {
    //reset setiap player spawn

    if (!IsValidActor(BotSpawn)) {
        BotSpawn = CreateActor(1, 1964.4355, 1342.9908, 16.5883, 92.3358);
        DarahBot = 100.0;
        SetActorInvulnerable(BotSpawn, false);
        SetActorHealth(BotSpawn, INFINITY);
    }

    PlayerTextDrawShow(playerid, CBusterLog[playerid][0]);
    PlayerTextDrawShow(playerid, CBusterLog[playerid][1]);
    PlayerTextDrawShow(playerid, CBusterLog[playerid][2]);
    PlayerTextDrawShow(playerid, CBusterLog[playerid][9]);

    GivePlayerWeapon(playerid, 24, 99999);
    GivePlayerWeapon(playerid, 25, 99999);
    return 1;
}

public OnPlayerGiveDamageActor(playerid, damaged_actorid, Float:amount, weaponid, bodypart) {
    new 
        WeaponName[32],
        TellPlayer[70],
        Float:PercentageDamage = (weaponid == 25) ? ((floatabs(amount) / 150.0) * 100) : ((floatabs(amount) / 140.0) * 100),
        Float:TotalDarah = (1.0 - (PercentageDamage / 100)) * DarahBot,
        Float:bX, Float:bY, Float:bZ;

    GetActorPos(damaged_actorid, bX, bY, bZ);

    GetWeaponName(weaponid, WeaponName, 32);

    PlayerTextDrawHide(playerid, CBusterLog[playerid][3]);
    PlayerTextDrawHide(playerid, CBusterLog[playerid][4]);
    PlayerTextDrawHide(playerid, CBusterLog[playerid][5]);
    PlayerTextDrawHide(playerid, CBusterLog[playerid][6]);
    PlayerTextDrawHide(playerid, CBusterLog[playerid][7]);
    PlayerTextDrawHide(playerid, CBusterLog[playerid][8]);
    PlayerTextDrawHide(playerid, CBusterLog[playerid][10]);

    format(TellPlayer, sizeof(TellPlayer), "Bot ID: ~g~%d", damaged_actorid);
    PlayerTextDrawSetString(playerid, CBusterLog[playerid][3], TellPlayer);

    format(TellPlayer, sizeof(TellPlayer), "Health: ~g~%.1f", TotalDarah);
    PlayerTextDrawSetString(playerid, CBusterLog[playerid][4], TellPlayer);

    format(TellPlayer, sizeof(TellPlayer), "Damage: ~g~%.1f pB", amount);
    PlayerTextDrawSetString(playerid, CBusterLog[playerid][5], TellPlayer);

    format(TellPlayer, sizeof(TellPlayer), "Using: ~g~%s", WeaponName);
    PlayerTextDrawSetString(playerid, CBusterLog[playerid][6], TellPlayer);

    format(TellPlayer, sizeof(TellPlayer), "Bodypart: ~g~%s", gBodyPart[bodypart]);
    PlayerTextDrawSetString(playerid, CBusterLog[playerid][7], TellPlayer);

    format(TellPlayer, sizeof(TellPlayer), "Distance: ~g~%.1f", GetPlayerDistanceFromPoint(playerid, bX, bY, bZ));
    PlayerTextDrawSetString(playerid, CBusterLog[playerid][8], TellPlayer);

    format(TellPlayer, sizeof(TellPlayer), "%.1f %%", PercentageDamage);
    PlayerTextDrawSetString(playerid, CBusterLog[playerid][10], TellPlayer);

    PlayerTextDrawShow(playerid, CBusterLog[playerid][3]);
    PlayerTextDrawShow(playerid, CBusterLog[playerid][4]);
    PlayerTextDrawShow(playerid, CBusterLog[playerid][5]);
    PlayerTextDrawShow(playerid, CBusterLog[playerid][6]);
    PlayerTextDrawShow(playerid, CBusterLog[playerid][7]);
    PlayerTextDrawShow(playerid, CBusterLog[playerid][8]);
    PlayerTextDrawShow(playerid, CBusterLog[playerid][10]);

    /*
    format(TellPlayer, sizeof(TellPlayer),
        "| Bot ID: %d | Health: %.1f %%%% | Damage: %.1f per Bullet | Using: %d | On Bodypart: %s (%.1f %%%%) |", 
        damaged_actorid,
        TotalDarah,
        amount,
        weaponid,
        gBodyPart[bodypart],
        PercentageDamage
    );
    */
    //convert dulu kalau udah dipake, biar supaya bisa update darah
    DarahBot = TotalDarah;
    return 1;
}

public OnPlayerCommandText(playerid, cmdtext[]) {
    if (!strcmp(cmdtext, "/resetlog", true)) {
        DarahBot = 100.0;

        PlayerTextDrawHide(playerid, CBusterLog[playerid][3]);
        PlayerTextDrawHide(playerid, CBusterLog[playerid][4]);
        PlayerTextDrawHide(playerid, CBusterLog[playerid][5]);
        PlayerTextDrawHide(playerid, CBusterLog[playerid][6]);
        PlayerTextDrawHide(playerid, CBusterLog[playerid][7]);
        PlayerTextDrawHide(playerid, CBusterLog[playerid][8]);
        PlayerTextDrawHide(playerid, CBusterLog[playerid][10]);
        return 1;
    }
    if (!strcmp(cmdtext, "/clean", true)) {
        for (new i = 0; i < 15; i ++) {
            SendClientMessage(playerid, -1, " ");
        }
        return 1;
    }
    return 0;
}

public OnPlayerDisconnect(playerid, reason) {
    ResetPlayerWeapons(playerid);
    DestroyActor(BotSpawn);
    return 1;
}