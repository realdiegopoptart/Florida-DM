//Player Textdraws


/*
// STATS TEXTDRAWS
    StatsSkinTD[playerid] = CreatePlayerTextDraw(playerid, 454.000000, 396.000000, "Preview_Model");
    PlayerTextDrawFont(playerid, StatsSkinTD[playerid], 5);
    PlayerTextDrawLetterSize(playerid, StatsSkinTD[playerid], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, StatsSkinTD[playerid], 43.500000, 43.500000);
    PlayerTextDrawSetOutline(playerid, StatsSkinTD[playerid], 0);
    PlayerTextDrawSetShadow(playerid, StatsSkinTD[playerid], 0);
    PlayerTextDrawAlignment(playerid, StatsSkinTD[playerid], 1);
    PlayerTextDrawColor(playerid, StatsSkinTD[playerid], -1);
    PlayerTextDrawBackgroundColor(playerid, StatsSkinTD[playerid], 125);
    PlayerTextDrawBoxColor(playerid, StatsSkinTD[playerid], 255);
    PlayerTextDrawUseBox(playerid, StatsSkinTD[playerid], 0);
    PlayerTextDrawSetProportional(playerid, StatsSkinTD[playerid], 1);
    PlayerTextDrawSetSelectable(playerid, StatsSkinTD[playerid], 0);
    PlayerTextDrawSetPreviewModel(playerid, StatsSkinTD[playerid], ReturnSkin(playerid));
    PlayerTextDrawSetPreviewRot(playerid, StatsSkinTD[playerid], -10.000000, 0.000000, -20.000000, 1.000000);
    PlayerTextDrawSetPreviewVehCol(playerid, StatsSkinTD[playerid], 1, 1);

    StatsNameTD[playerid] = CreatePlayerTextDraw(playerid, 499.000000, 398.000000, "realdiegopoptart");
    PlayerTextDrawFont(playerid, StatsNameTD[playerid], 1);
    PlayerTextDrawLetterSize(playerid, StatsNameTD[playerid], 0.174998, 1.000000);
    PlayerTextDrawTextSize(playerid, StatsNameTD[playerid], 586.500000, 57.500000);
    PlayerTextDrawSetOutline(playerid, StatsNameTD[playerid], 0);
    PlayerTextDrawSetShadow(playerid, StatsNameTD[playerid], 0);
    PlayerTextDrawAlignment(playerid, StatsNameTD[playerid], 1);
    PlayerTextDrawColor(playerid, StatsNameTD[playerid], -1);
    PlayerTextDrawBackgroundColor(playerid, StatsNameTD[playerid], 255);
    PlayerTextDrawBoxColor(playerid, StatsNameTD[playerid], 100);
    PlayerTextDrawUseBox(playerid, StatsNameTD[playerid], 1);
    PlayerTextDrawSetProportional(playerid, StatsNameTD[playerid], 1);
    PlayerTextDrawSetSelectable(playerid, StatsNameTD[playerid], 0);

    StatsScoreTD[playerid] = CreatePlayerTextDraw(playerid, 499.000000, 410.000000, "~b~Score: ~w~3434");
    PlayerTextDrawFont(playerid, StatsScoreTD[playerid], 1);
    PlayerTextDrawLetterSize(playerid, StatsScoreTD[playerid], 0.262499, 0.899999);
    PlayerTextDrawTextSize(playerid, StatsScoreTD[playerid], 586.500000, 32.000000);
    PlayerTextDrawSetOutline(playerid, StatsScoreTD[playerid], 1);
    PlayerTextDrawSetShadow(playerid, StatsScoreTD[playerid], 0);
    PlayerTextDrawAlignment(playerid, StatsScoreTD[playerid], 1);
    PlayerTextDrawColor(playerid, StatsScoreTD[playerid], -1);
    PlayerTextDrawBackgroundColor(playerid, StatsScoreTD[playerid], 255);
    PlayerTextDrawBoxColor(playerid, StatsScoreTD[playerid], 50);
    PlayerTextDrawUseBox(playerid, StatsScoreTD[playerid], 1);
    PlayerTextDrawSetProportional(playerid, StatsScoreTD[playerid], 1);
    PlayerTextDrawSetSelectable(playerid, StatsScoreTD[playerid], 0);

    StatsKDTD[playerid] = CreatePlayerTextDraw(playerid, 499.000000, 421.000000, "~b~Kills: ~w~32 ~r~Deaths: ~w~127");
    PlayerTextDrawFont(playerid, StatsKDTD[playerid], 1);
    PlayerTextDrawLetterSize(playerid, StatsKDTD[playerid], 0.187500, 0.799996);
    PlayerTextDrawTextSize(playerid, StatsKDTD[playerid], 586.500000, 17.000000);
    PlayerTextDrawSetOutline(playerid, StatsKDTD[playerid], 1);
    PlayerTextDrawSetShadow(playerid, StatsKDTD[playerid], 0);
    PlayerTextDrawAlignment(playerid, StatsKDTD[playerid], 1);
    PlayerTextDrawColor(playerid, StatsKDTD[playerid], -1);
    PlayerTextDrawBackgroundColor(playerid, StatsKDTD[playerid], 255);
    PlayerTextDrawBoxColor(playerid, StatsKDTD[playerid], 50);
    PlayerTextDrawUseBox(playerid, StatsKDTD[playerid], 1);
    PlayerTextDrawSetProportional(playerid, StatsKDTD[playerid], 1);
    PlayerTextDrawSetSelectable(playerid, StatsKDTD[playerid], 0);

    StatsModeTD[playerid] = CreatePlayerTextDraw(playerid, 499.000000, 431.000000, "~p~Mode: ~w~Gang Wars");
    PlayerTextDrawFont(playerid, StatsModeTD[playerid], 1);
    PlayerTextDrawLetterSize(playerid, StatsModeTD[playerid], 0.220833, 0.750000);
    PlayerTextDrawTextSize(playerid, StatsModeTD[playerid], 586.500000, -248.000000);
    PlayerTextDrawSetOutline(playerid, StatsModeTD[playerid], 1);
    PlayerTextDrawSetShadow(playerid, StatsModeTD[playerid], 0);
    PlayerTextDrawAlignment(playerid, StatsModeTD[playerid], 1);
    PlayerTextDrawColor(playerid, StatsModeTD[playerid], -1);
    PlayerTextDrawBackgroundColor(playerid, StatsModeTD[playerid], 255);
    PlayerTextDrawBoxColor(playerid, StatsModeTD[playerid], 50);
    PlayerTextDrawUseBox(playerid, StatsModeTD[playerid], 1);
    PlayerTextDrawSetProportional(playerid, StatsModeTD[playerid], 1);
    PlayerTextDrawSetSelectable(playerid, StatsModeTD[playerid], 0);
*/

/*Player Progress Bars
Requires "progress2" include by Southclaws
Download: https://github.com/Southclaws/progress2/releases */

//Player Textdraws
    StatsNameTD[playerid] = CreatePlayerTextDraw(playerid, 499.000000, 409.000000, "realdiegopoptart");
    PlayerTextDrawFont(playerid, StatsNameTD[playerid], 1);
    PlayerTextDrawLetterSize(playerid, StatsNameTD[playerid], 0.174998, 1.000000);
    PlayerTextDrawTextSize(playerid, StatsNameTD[playerid], 586.500000, 57.500000);
    PlayerTextDrawSetOutline(playerid, StatsNameTD[playerid], 0);
    PlayerTextDrawSetShadow(playerid, StatsNameTD[playerid], 0);
    PlayerTextDrawAlignment(playerid, StatsNameTD[playerid], 1);
    PlayerTextDrawColor(playerid, StatsNameTD[playerid], -1);
    PlayerTextDrawBackgroundColor(playerid, StatsNameTD[playerid], 255);
    PlayerTextDrawBoxColor(playerid, StatsNameTD[playerid], 100);
    PlayerTextDrawUseBox(playerid, StatsNameTD[playerid], 1);
    PlayerTextDrawSetProportional(playerid, StatsNameTD[playerid], 1);
    PlayerTextDrawSetSelectable(playerid, StatsNameTD[playerid], 0);

    StatsKDTD[playerid] = CreatePlayerTextDraw(playerid, 499.000000, 421.000000, "~r~K:D ~w~324/345");
    PlayerTextDrawFont(playerid, StatsKDTD[playerid], 1);
    PlayerTextDrawLetterSize(playerid, StatsKDTD[playerid], 0.187500, 0.799996);
    PlayerTextDrawTextSize(playerid, StatsKDTD[playerid], 586.500000, 17.000000);
    PlayerTextDrawSetOutline(playerid, StatsKDTD[playerid], 1);
    PlayerTextDrawSetShadow(playerid, StatsKDTD[playerid], 0);
    PlayerTextDrawAlignment(playerid, StatsKDTD[playerid], 1);
    PlayerTextDrawColor(playerid, StatsKDTD[playerid], -1);
    PlayerTextDrawBackgroundColor(playerid, StatsKDTD[playerid], 255);
    PlayerTextDrawBoxColor(playerid, StatsKDTD[playerid], 50);
    PlayerTextDrawUseBox(playerid, StatsKDTD[playerid], 1);
    PlayerTextDrawSetProportional(playerid, StatsKDTD[playerid], 1);
    PlayerTextDrawSetSelectable(playerid, StatsKDTD[playerid], 0);

    StatsModeTD[playerid] = CreatePlayerTextDraw(playerid, 499.000000, 431.000000, "~p~Mode: ~w~Gang Wars");
    PlayerTextDrawFont(playerid, StatsModeTD[playerid], 1);
    PlayerTextDrawLetterSize(playerid, StatsModeTD[playerid], 0.220833, 0.750000);
    PlayerTextDrawTextSize(playerid, StatsModeTD[playerid], 586.500000, -248.000000);
    PlayerTextDrawSetOutline(playerid, StatsModeTD[playerid], 1);
    PlayerTextDrawSetShadow(playerid, StatsModeTD[playerid], 0);
    PlayerTextDrawAlignment(playerid, StatsModeTD[playerid], 1);
    PlayerTextDrawColor(playerid, StatsModeTD[playerid], -1);
    PlayerTextDrawBackgroundColor(playerid, StatsModeTD[playerid], 255);
    PlayerTextDrawBoxColor(playerid, StatsModeTD[playerid], 50);
    PlayerTextDrawUseBox(playerid, StatsModeTD[playerid], 1);
    PlayerTextDrawSetProportional(playerid, StatsModeTD[playerid], 1);
    PlayerTextDrawSetSelectable(playerid, StatsModeTD[playerid], 0);



	// GPS
	LocationTD[playerid] = CreatePlayerTextDraw(playerid, 88.000000, 323.000000, "Loading...");
	PlayerTextDrawAlignment(playerid,LocationTD[playerid], 2);
	PlayerTextDrawBackgroundColor(playerid, LocationTD[playerid], 255);
	PlayerTextDrawFont(playerid, LocationTD[playerid], 1);
	PlayerTextDrawLetterSize(playerid, LocationTD[playerid], 0.260000, 1.300000);
	PlayerTextDrawColor(playerid, LocationTD[playerid], -1);
	PlayerTextDrawSetOutline(playerid, LocationTD[playerid], 1);
	PlayerTextDrawSetProportional(playerid, LocationTD[playerid], 1);

    
    // TD Timer
    td_timerprogress = CreatePlayerProgressBar(playerid, 558.000000, 177.000000, 62.000000, 4.000000, -1, 60.000000, 0);



