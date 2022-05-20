CMD:capture(playerid, params[])
{
	if(!IsPlayerInDynamicArea(playerid, turflimit, 0)){
		SendClientMessage(playerid, color_red, "[Error]{FFFFFF}: You have to be in the zone in order to capture it");
		return 1;
	}

	if(caping == 1){
		SendClientMessage(playerid, color_red, "[Error]{FFFFFF}: This turf is already being Captured");
		return 1;
	}

    if(GSF[playerid] && IsPlayerInDynamicArea(playerid, turflimit, 0))
	{
		if(capedbygsf == 1){
			SendClientMessage(playerid, color_red, "[Error]{FFFFFF} This Turf is already Captured by your Team.");
			return 1;
		}

		new string[128];
		new name[MAX_PLAYER_NAME];
    	GetPlayerName(playerid, name, sizeof(name));
		GangZoneFlashForAll(turf, color_green);
		format(string, sizeof(string), "[Gang Wars]{FFFFFF}: GS9 is being captured by {2B8A11}%s for Grove Street",name);
	    SendGwarMessage(COLOR_GROVE, string);
		turftime = SetTimerEx("TurfTime", 60000, false, "i", playerid);
		PLAYERCAP [playerid] = 1;
		caping = 1;
		gsfcaping = 1;

	    foreach(new i : Player)
	    {
	        if(GSF[i])
	        {
	        	new stringtd[100];
				format(stringtd, sizeof(stringtd), "Time Left: ~y~60~w~ Seconds");
				TextDrawSetString(td_timertext, stringtd);

	            ShowPlayerProgressBar(i, td_timerprogress);

	            TextDrawShowForPlayer(i, td_timertext);
	            TextDrawShowForPlayer(i, td_timerbg);
	        }
	    }

	}
	
	if(LSV[playerid] && IsPlayerInDynamicArea(playerid, turflimit, 0))
	{
        if(capedbylsv == 1){
			SendClientMessage(playerid, color_red, "[Error]{FFFFFF} This Turf is already Captured by your Team.");
			return 1;
		}
		new string[128];
		new name[MAX_PLAYER_NAME];
    	GetPlayerName(playerid, name, sizeof(name));
		GangZoneFlashForAll(turf, color_yellow);
		format(string, sizeof(string), "[Gang Wars]{FFFFFF}: GS9 is being captured by {F7D60A}%s for Los Santos Vagos",name);
	    SendGwarMessage(COLOR_VAGOS, string);
		turftime = SetTimerEx("TurfTime", 60000, false, "i", playerid);
		PLAYERCAP [playerid] = 1;
		caping = 1;
		lsvcaping = 1;

	    foreach(new i : Player)
	    {
	        if(LSV[i])
	        {
	        	new stringtd[100];
				format(stringtd, sizeof(stringtd), "Time Left: ~y~60~w~ Seconds");
				TextDrawSetString(td_timertext, stringtd);

	            ShowPlayerProgressBar(i, td_timerprogress);

	            TextDrawShowForPlayer(i, td_timertext);
	            TextDrawShowForPlayer(i, td_timerbg);
	        }
	    }

	}

	if(NBA[playerid] && IsPlayerInDynamicArea(playerid, turflimit, 0))
	{
        if(capedbynba == 1){
			SendClientMessage(playerid, color_red, "[Error]{FFFFFF} This Turf is already Captured by your Team.");
			return 1;
		}
		new string[128];
		new name[MAX_PLAYER_NAME];
    	GetPlayerName(playerid, name, sizeof(name));
		GangZoneFlashForAll(turf, COLOR_BALLAS);
		format(string, sizeof(string), "[Gang Wars]{FFFFFF}: GS9 is being captured by {e803fc}%s for Kilo Tray Ballas",name);
	    SendGwarMessage(COLOR_BALLAS, string);
		turftime = SetTimerEx("TurfTime", 60000, false, "i", playerid);
		PLAYERCAP [playerid] = 1;
		caping = 1;
		nbacaping = 1;

	    foreach(new i : Player)
	    {
	        if(NBA[i])
	        {
	        	new stringtd[100];
				format(stringtd, sizeof(stringtd), "Time Left: ~y~60~w~ Seconds");
				TextDrawSetString(td_timertext, stringtd);

	            ShowPlayerProgressBar(i, td_timerprogress);

	            TextDrawShowForPlayer(i, td_timertext);
	            TextDrawShowForPlayer(i, td_timerbg);
	        }
	    }

	}
	if(VAR[playerid] && IsPlayerInDynamicArea(playerid, turflimit, 0))
	{
        if(capedbyvar == 1){
			SendClientMessage(playerid, color_red, "[Error]{FFFFFF} This Turf is already Captured by your Team.");
			return 1;
		}

		new string[128];
		new name[MAX_PLAYER_NAME];
    	GetPlayerName(playerid, name, sizeof(name));
		GangZoneFlashForAll(turf, color_cyan);
		format(string, sizeof(string), "[Gang Wars]{FFFFFF}: GS9 is being captured by {0bc3d4}%s for Los Varrios Azcetas",name);
	    SendGwarMessage(COLOR_AZCETAS, string);
		turftime = SetTimerEx("TurfTime", 60000, false, "i", playerid);
		PLAYERCAP [playerid] = 1;
		caping = 1;
		varcaping = 1;

	    foreach(new i : Player)
	    {
	        if(VAR[i])
	        {
	        	new stringtd[100];
				format(stringtd, sizeof(stringtd), "Time Left: ~y~60~w~ Seconds");
				TextDrawSetString(td_timertext, stringtd);

	            ShowPlayerProgressBar(i, td_timerprogress);

	            TextDrawShowForPlayer(i, td_timertext);
	            TextDrawShowForPlayer(i, td_timerbg);
	        }
	    }
	}

	TurfCountdown = 60;
	TurfIdentifier = SetTimer("Turfcount", 1000, true);
	return 1;
}

CMD:gwar(playerid, params[])
{
	new playerState = GetPlayerState(playerid);
	if (playerState == PLAYER_STATE_WASTED)
	{
	SendClientMessage(playerid, color_purple, "Can't use this Cmd while you are dead");
	return 1;
    }

	if(INDM[playerid]){
	SendClientMessage(playerid, color_purple, "You have to be in lobby to use this command {FFFFFF}(/lobby)");
	return 1;
	}
	
	ShowPlayerDialog(playerid, 3, DIALOG_STYLE_LIST, "{EE28EB}[F:DM] {FFFFFF}Gang Wars", "{37EE28}Grove Street Families\n{EE28EE}Kilo Tray Ballas\n{28EEED}Los Varrios Azcetas\n{DDEE28}Los Santos Vagos", "Select", "Cancel");	
	return 1;
}
//=====================Lobby==================================//

CMD:lobby(playerid, params[])
{
	if(PlayerInfo[playerid][pLoggedin] == false)
	{
		SendClientMessage(playerid, color_red, "[Retart Alert]{FFFFFF}: What the fuck are you trying to do? Log in first.");
		return 0;
	}
    
	if(PLAYERCAP[playerid]){
		SendClientMessage(playerid, color_red, "[Error]{FFFFFF}:You Can't use This Command while your capturing.");
		return 1;
	}

	new playerState = GetPlayerState(playerid);
	if(playerState == PLAYER_STATE_WASTED && IdDuel[playerid] != 0)
	{
	SendClientMessage(playerid, color_purple, "[Error] {FFFFFF}Can't use this command while you are dead");
	return 1;
    } 

    SetPlayerName(playerid, PlayerInfo[playerid][pAccName]);

	new rand = random(9);

	switch(rand)
	{
		case 0:
		{
		SetPlayerPos(playerid, 376.1006,2469.7708,16.5846);
		SetPlayerHealth(playerid, 100);
		SetPlayerArmour(playerid, 0);
		ResetPlayerWeapons(playerid);
		GivePlayerWeapon(playerid, 24, 10000);
		SetPlayerSkin(playerid, PlayerInfo[playerid][pSkin]);
	    }
	    case 1:
	    {
		SetPlayerPos(playerid, 370.5598,2469.9504,16.5846);
		SetPlayerHealth(playerid, 100);
		SetPlayerArmour(playerid, 0);
		ResetPlayerWeapons(playerid);
		GivePlayerWeapon(playerid, 24, 10000);
		SetPlayerSkin(playerid, PlayerInfo[playerid][pSkin]);
	    }
	    case 2:
	    {
		SetPlayerPos(playerid, 365.4152,2470.1277,16.5846);
		SetPlayerHealth(playerid, 100);
		SetPlayerArmour(playerid, 0);
		ResetPlayerWeapons(playerid);
		GivePlayerWeapon(playerid, 24, 10000);
		SetPlayerSkin(playerid, PlayerInfo[playerid][pSkin]);
	    }
	    case 3:
	    {
		SetPlayerPos(playerid, 365.7121,2475.5298,16.5846);
		SetPlayerHealth(playerid, 100);
		SetPlayerArmour(playerid, 0);
		ResetPlayerWeapons(playerid);
		GivePlayerWeapon(playerid, 24, 10000);
	    }
	    case 4:
	    {
		SetPlayerPos(playerid, 370.2319,2475.3789,16.5846);
		SetPlayerHealth(playerid, 100);
		SetPlayerArmour(playerid, 0);
		ResetPlayerWeapons(playerid);
		GivePlayerWeapon(playerid, 24, 10000);
		SetPlayerSkin(playerid, PlayerInfo[playerid][pSkin]);
	    }
	    case 5:
	    {
		SetPlayerPos(playerid, 375.3858,2474.9541,16.5846);
		SetPlayerHealth(playerid, 100);
		SetPlayerArmour(playerid, 0);
		ResetPlayerWeapons(playerid);
		GivePlayerWeapon(playerid, 24, 10000);
		SetPlayerSkin(playerid, PlayerInfo[playerid][pSkin]);
	    }
	    case 6:
	    {
		SetPlayerPos(playerid, 372.9134,2467.5376,16.5846);
		SetPlayerHealth(playerid, 100);
		SetPlayerArmour(playerid, 0);
		ResetPlayerWeapons(playerid);
		GivePlayerWeapon(playerid, 24, 10000);
		SetPlayerSkin(playerid, PlayerInfo[playerid][pSkin]);
	    }
	    case 7:
	    {
		SetPlayerPos(playerid, 368.3280,2462.5168,16.5846);
		SetPlayerHealth(playerid, 100);
		SetPlayerArmour(playerid, 0);
		ResetPlayerWeapons(playerid);
		GivePlayerWeapon(playerid, 24, 10000);
		SetPlayerSkin(playerid, PlayerInfo[playerid][pSkin]);
	    }
	    case 8:
	    {
		SetPlayerPos(playerid, 376.0320,2461.6362,16.5846);
		SetPlayerHealth(playerid, 100);
		SetPlayerArmour(playerid, 0);
		ResetPlayerWeapons(playerid);
		GivePlayerWeapon(playerid, 24, 10000);
		SetPlayerSkin(playerid, PlayerInfo[playerid][pSkin]);
	    }
	    
	}

	INL [playerid] = 1;
    GSF [playerid] = 0;
    NBA [playerid] = 0;
    LSV [playerid] = 0;
    INGWR [playerid] = 0;
    VAR [playerid] = 0;
    LVPD [playerid] = 0;
    WDM [playerid] = 0;
    INDM [playerid] = 0;
    INRCDM [playerid] = 0;
    PDM [playerid] = 0;
    SDM [playerid] = 0;
    GDM [playerid] = 0;
	COPPOLICE [playerid] = 0;
	COPLEO [playerid] = 0;
	COPFBI [playerid] = 0;
	COPHRT [playerid] = 0;
	COPCRIM [playerid] = 0;
	INCOP [playerid] = 0;
	COPVOL [playerid] = 0;
	IdDuel [playerid] = false;
	InvitedDuel [playerid] = false;

	
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
	    if(IsPlayerConnected(i))
	    {
	        HidePlayerProgressBar(i, td_timerprogress);
	    }
	}

	TextDrawHideForAll(td_timertext);
	TextDrawHideForAll(td_timerbg);

	CheckPlayerColor(playerid);
	SetPlayerTeam(playerid, 1);
    RemovePlayerAttachedObject(playerid, 8);
    RemovePlayerAttachedObject(playerid, 9);
	SetPlayerInterior(playerid, 0);
	SetPlayerVirtualWorld(playerid, 0);
	SetPlayerWorldBounds(playerid, 20000.0000, -20000.0000, 20000.0000, -20000.0000);
	SendClientMessage(playerid, color_pink, "[Lobby]{FFFFFF}: You have been sent to the lobby.");
	return 1;
}
//===============================LVPD============================================================================================//

CMD:lvpd(playerid, params[])
{

	if(INDM[playerid]){
	SendClientMessage(playerid, color_purple, "You have to be in lobby to use this command {FFFFFF}(/lobby)");
	return 1;
	}

	new playerState = GetPlayerState(playerid);
	if (playerState == PLAYER_STATE_WASTED)
	{
	SendClientMessage(playerid, color_purple, "[Error] {FFFFFF}Can't use this command while you are dead");
	return 1;
    }
	if(GetLvpdPlayers() == 10) return SendClientMessage(playerid, color_error, "This Arena is Full.");


    new d_loc = random(5);
    SetPlayerPos(playerid, LvpdLocations[d_loc][0], LvpdLocations[d_loc][1], LvpdLocations[d_loc][2]);
	SetPlayerInterior(playerid, 3);
	GivePlayerWeapon(playerid, 24, 1000);
	SetPlayerHealth(playerid, 100);
	SetPlayerArmour(playerid, 100);
	SetPlayerTeam(playerid, NO_TEAM); 
	
	SendClientMessage(playerid, color_purple, "Welcome to LVPD DM, to go back use {FFFFFF}(/lobby)");

	LVPD [playerid] = 1;
	INDM [playerid] = 1;
	WDM [playerid] = 0;
	INRCDM [playerid] = 0;
	SDM [playerid] = 0;
    PDM [playerid] = 0;
    GDM [playerid] = 0;
	INL [playerid] = 0;

    return 1;
}

//=========================[WARE HOUSE DM]===================================================//
//=========================[WARE HOUSE DM]===================================================//

CMD:wdm(playerid, params[])
{

	if(INDM[playerid]){
	SendClientMessage(playerid, color_purple, "You have to be in lobby to use this command {FFFFFF}(/lobby)");
	return 1;
	}
    

	new playerState = GetPlayerState(playerid);
	if (playerState == PLAYER_STATE_WASTED)
	{
	SendClientMessage(playerid, color_purple, "Can't use this Cmd while you are dead");
	return 1;
    }
	if(GetWarehousePlayers() == 10) return SendClientMessage(playerid, color_error, "This Arena is Full.");

    new w_loc = random(4);
    SetPlayerPos(playerid, WdmLocations[w_loc][0], WdmLocations[w_loc][1], WdmLocations[w_loc][2]);
    SetPlayerInterior(playerid, 1);
   	SetPlayerHealth(playerid, 100);
	SetPlayerArmour(playerid, 100);
   	ResetPlayerWeapons(playerid);
	GivePlayerWeapon(playerid, 24, 1000);
	GivePlayerWeapon(playerid, 25, 100000);
	SetPlayerTeam(playerid, NO_TEAM); 
    

	SendClientMessage(playerid, color_purple, "Welcome to Warehouse DM, to go back use {FFFFFF}(/lobby)");
	WDM [playerid] = 1;
	GDM [playerid] = 0;
    INDM [playerid] = 1;
	LVPD [playerid] = 0;
	INRCDM [playerid] = 0;
	INL [playerid] = 0;
    return 1;
}

//=========================[RC GROUNDS DM]===================================================//
//=========================[RC GROUNDS DM]===================================================//

CMD:rcdm(playerid, params[])
{
	new playerState = GetPlayerState(playerid);
	if (playerState == PLAYER_STATE_WASTED)
	{
	SendClientMessage(playerid, color_purple, "Can't use this Cmd while you are dead");
	return 1;
    }

	if(INDM[playerid]){
	SendClientMessage(playerid, color_purple, "You have to be in lobby to use this command {FFFFFF}(/lobby)");
	return 1;
	}
	if(GetRcgPlayers() == 10) return SendClientMessage(playerid, color_error, "This Arena is Full.");

	new r_loc = random(6);
    SetPlayerPos(playerid, RandomLocations[r_loc][0], RandomLocations[r_loc][1], RandomLocations[r_loc][2]);
	SetPlayerInterior(playerid, 10);
	ResetPlayerWeapons(playerid);
	SetPlayerArmour(playerid, 100);
	SetPlayerHealth(playerid, 100);
	GivePlayerWeapon(playerid, 24, 999);
	GivePlayerWeapon(playerid, 27, 999);
	GivePlayerWeapon(playerid, 34, 999);
	GivePlayerWeapon(playerid, 31, 999);
	SendClientMessage(playerid, color_purple, "Welcome to RC Grounds, to go back use {FFFFFF}(/lobby)");
	SetPlayerTeam(playerid, NO_TEAM); 

	INRCDM [playerid] = 1;
	INDM [playerid] = 1;
	GDM [playerid] = 0;
	WDM [playerid] = 0;
	LVPD [playerid] = 0;
	PDM [playerid] = 0;
	SDM [playerid] = 0;
	INL [playerid] = 0;
	return 1;
}

//=========================[Pleasure DM]===================================================//
//=========================[Pleasure DM]===================================================//

CMD:pdm(playerid, params[])
{
	new playerState = GetPlayerState(playerid);
	if (playerState == PLAYER_STATE_WASTED)
	{
	SendClientMessage(playerid, color_purple, "Can't use this Cmd while you are dead");
	return 1;
    }

	if(INDM[playerid]){
	SendClientMessage(playerid, color_purple, "You have to be in lobby to use this command {FFFFFF}(/lobby)");
	return 1;
	}
	if(GetPleasurePlayers() == 10) return SendClientMessage(playerid, color_error, "This Arena is Full.");

    new p_loc = random(5);
    SetPlayerPos(playerid, PdmLocations[p_loc][0], PdmLocations[p_loc][1], PdmLocations[p_loc][2]);
	SetPlayerInterior(playerid, 3);
	ResetPlayerWeapons(playerid);
	GivePlayerWeapon(playerid, 30, 10000);
	GivePlayerWeapon(playerid, 24, 999);
	SetPlayerHealth(playerid, 100);
	SetPlayerArmour(playerid, 100);
	SendClientMessage(playerid, color_purple, "Welcome to Pleasure Domes DM, to go back use {FFFFFF}(/lobby)");
	SetPlayerTeam(playerid, NO_TEAM); 

    SDM [playerid] = 0;
	PDM [playerid] = 1;
	INL [playerid] = 0;
	INRCDM [playerid] = 0;
	INDM [playerid] = 1;
	WDM [playerid] = 0;
	LVPD [playerid] = 0;
	GDM [playerid] = 0;
	INL [playerid] = 0;
	return 1;
}
//=========================[ SNIPER DM]===================================================//
//=========================[ SNIPER DM]===================================================//

CMD:sdm(playerid, params[])
{


	new playerState = GetPlayerState(playerid);
	if (playerState == PLAYER_STATE_WASTED)
	{
	SendClientMessage(playerid, color_purple, "Can't use this Cmd while you are dead");
	return 1;
    }

	if(INDM[playerid]){
	SendClientMessage(playerid, color_purple, "You have to be in lobby to use this command {FFFFFF}(/lobby)");
	return 1;
	}

	if(GetSniperPlayers() == 10) return SendClientMessage(playerid, color_error, "This Arena is Full.");
	
	new s_loc = random(4);
    SetPlayerPos(playerid, SdmLocations[s_loc][0], SdmLocations[s_loc][1], SdmLocations[s_loc][2]);
	SetPlayerInterior(playerid, 15);
	ResetPlayerWeapons(playerid);
	SetPlayerHealth(playerid, 100);
	SetPlayerArmour(playerid, 100);
	GivePlayerWeapon(playerid, 34, 999);
	SendClientMessage(playerid, color_purple, "Welcome to Sniper DM, to go back use {FFFFFF}(/lobby)");
    SetPlayerTeam(playerid, NO_TEAM); 
    SDM [playerid] = 1;
	PDM [playerid] = 0;
	INL [playerid] = 0;
	INRCDM [playerid] = 0;
	INDM [playerid] = 1;
	WDM [playerid] = 0;
	GDM [playerid] = 0;
	LVPD [playerid] = 0;
	return 1;
}

//=========================[GHOST TOWN DM]===================================================//
//=========================[GHOST TOWN DM]===================================================//

CMD:gdm(playerid, params[])
{
	new playerState = GetPlayerState(playerid);
	if (playerState == PLAYER_STATE_WASTED)
	{
	SendClientMessage(playerid, color_purple, "Can't use this command while you are dead");
	return 1;
    }

	if(INDM[playerid]){
	SendClientMessage(playerid, color_purple, "You have to be in lobby to use this command {FFFFFF}(/lobby).");
	return 1;
	}

	if(GetGhostPlayers() == 10) return SendClientMessage(playerid, color_error, "This Arena is Full.");

	new g_loc = random(5);
    SetPlayerPos(playerid, GdmLocations[g_loc][0], GdmLocations[g_loc][1], GdmLocations[g_loc][2]);
    ResetPlayerWeapons(playerid);
    SetPlayerHealth(playerid, 100);
    SetPlayerArmour(playerid, 100);
    GivePlayerWeapon(playerid, 24, 999);
    GivePlayerWeapon(playerid, 33, 999);
    GivePlayerWeapon(playerid, 25, 999);
    SetPlayerWorldBounds(playerid, -331, -477, 2297.5, 2170.5); 
    SendClientMessage(playerid, color_purple, "Welcome to Ghost Town DM, to go back use {FFFFFF}(/lobby)");
	SetPlayerTeam(playerid, NO_TEAM); 

    SDM [playerid] = 0;
	PDM [playerid] = 0;
	INL [playerid] = 0;
	INRCDM [playerid] = 0;
	INDM [playerid] = 1;
	WDM [playerid] = 0;
	LVPD [playerid] = 0;
	GDM [playerid] = 1;
	return 1;
}

CMD:gangwarweapontable(playerid, params[])
{
	ShowPlayerDialog(playerid, 4, DIALOG_STYLE_LIST, "{EE28EB}[F:DM] {FFFFFF}Choose Your Weapons", "Deagle\tShotgun\nDeagle\tAk47\nDeagle\tSniper", "Select", "Cancel");
    return 1;
}

CMD:kill(playerid, params[])
{
	SetPlayerHealth(playerid,0);
    return 1;
}

CMD:discord(playerid, params[])
{
	SendClientMessage(playerid, color_lime, "{019CA2}[Discord] {F20E94}Join our discord server: {FFFFFF}https://discord.gg/CgqB6wVmF6");
	return 1;
}

CMD:skin(playerid, params[])
{
	new playerState = GetPlayerState(playerid);
	if (playerState == PLAYER_STATE_WASTED)
	{
	SendClientMessage(playerid, color_purple, "Can't use this Cmd while you are dead");
	return 1;
    }

	if(INL[playerid] != 1){
	SendClientMessage(playerid, color_purple, "You have to be in lobby to use this command {FFFFFF}(/lobby).");
	return 1;
	}

	ShowModelSelectionMenu(playerid, joinskin, "Pick A Skin");
	return 1;
}


CMD:duel(playerid, params[])
{
	new gun;
    new id;
    new string[128];
	if(INL[playerid] != 1){
		SendClientMessage(playerid, color_red, "[Error]{FFFFFF}: What? Are you trying to send a duel while you're not in the lobby?");
		return 1;
	}
    if(InvitedDuel[playerid] == true) return SendClientMessage(playerid,0xF41917AA,"[Duel]{FFFFFF}: You already offered someone to duel");
    
	if(sscanf(params, "uk<weapon>", id, gun))
	return SendClientMessage(playerid,0xF41917AA,"[Duel]{FFFFFF}: You must enter the ID of the player (/duel [playerid] [Weapon id])");

	if(INL[id] != 1){
		SendClientMessage(playerid, color_red, "[Error]{FFFFFF}: This player is not in the lobby.");
		return 1;
	}

    if(id == playerid) return SendClientMessage(playerid,0xF41917AA,"[Duel]{FFFFFF}: You can't invite yourself to a duel");

    if(InvitedDuel[id] == true) return SendClientMessage(playerid,0xF41917AA,"[Duel]{FFFFFF}: That player is already dueling");
	
	Gun [playerid] = gun;
    new name[MAX_PLAYER_NAME];
    GetPlayerName(playerid, name, sizeof(name));
	SendClientMessage(playerid,color_yellow,"[Duel]{FFFFFF}: You invited them to a Duel, wait for that player to respond."); 
    format(string, sizeof(string), "%s is inviting you to a Duel\n Duel offer will expire in 15 seconds.",name);
    ShowPlayerDialog(id,DIALOG_DUEL,DIALOG_STYLE_MSGBOX,"{EE28EB}[F:DM] {FFFFFF}Duel",string,"Accept", "Deny");
    GameTextForPlayer(id,"~r~DUEL!", 2500, 3);
    InvitedDuel[id] = true;
    IdDuel[id] = playerid;
    SendClientMessageEx(playerid, -1, "%i", Gun[playerid]);
    ExpireDuelId[playerid] = SetTimerEx("ExpireDuel",30000,false,"ii",id,playerid);
    return 1;
}

CMD:t(playerid, params[])
{
	if(PlayerInfo[playerid][pMute] > 0){
		SendClientMessage(playerid, color_red, "You're Muted.");
		return 0;
	}
	if(!INGWR[playerid]){
		SendClientMessage(playerid, color_error, "[Eerror] You're not in Gang war Mode.");
		return 1;
	}
	if(isnull(params))
	{
	    return SendClientMessage(playerid, color_cyan, "[Usage]{FFFFFF}: /t [text]");
	}
	if(NBA[playerid])	
	{
		new string[128];
		format(string, sizeof(string), "{EE28EE}[Team Radio] {FFFFFF}%s: %s", PlayerInfo[playerid][pAccName], params);
		SendBallasMessage(COLOR_BALLAS, string);
		return 1;
	}
	if(GSF[playerid])	
	{
		new string[128];
		format(string, sizeof(string), "{2B8A11}[Team Radio] {FFFFFF}%s: %s", PlayerInfo[playerid][pAccName], params);
		SendGroveMessage(COLOR_GROVE, string);
		return 1;
	}
	if(LSV[playerid])	
	{
		new string[128];
		format(string, sizeof(string), "{F7D60A}[Team Radio] {FFFFFF}%s: %s", PlayerInfo[playerid][pAccName], params);
		SendVagosMessage(COLOR_VAGOS, string);
		return 1;
	}
	if(VAR[playerid])	
	{
		new string[128];
		format(string, sizeof(string), "{0bc3d4}[Team Radio] {FFFFFF}%s: %s", PlayerInfo[playerid][pAccName], params);
		SendVariosMessage(COLOR_VAGOS, string);
		return 1;
	}
	return 1;
}

CMD:r(playerid, params[])
{
	if(PlayerInfo[playerid][pMute] > 0){
		SendClientMessage(playerid, color_red, "You're Muted.");
		return 0;
	}
	if(isnull(params))
	{
	    return SendClientMessage(playerid, color_blue, "[Usage]{FFFFFF}: /r [text]");
	}
	if(!COPLEO[playerid])
    {
        return SendClientMessage(playerid, color_blue, "[Error]{FFFFFF}:You are not a cop");
	}
	if(COPVOL[playerid])
	{
		new string[128];
		format(string, sizeof(string), "{3D59CC}[Radio]{8FA5FF} SAPD Volunteer %s: %s", ReturnName(playerid), params);
		SendLEOMessage(color_blue, string);
		return 1;
	}
	if(COPPOLICE[playerid])
	{
		new string[128];
		format(string, sizeof(string), "{3D59CC}[Radio]{8FA5FF} SAPD Officer %s: %s", ReturnName(playerid), params);
		SendLEOMessage(color_blue, string);
		return 1;
	}
	if(COPFBI[playerid])
	{
		new string[128];
		format(string, sizeof(string), "{3D59CC}[Radio]{8FA5FF} FBI Agent %s: %s", ReturnName(playerid), params);
		SendLEOMessage(color_blue, string);
		return 1;
	}
	if(COPHRT[playerid])
	{
		new string[128];
		format(string, sizeof(string), "{3D59CC}[Radio]{8FA5FF} HRT Agent %s: %s", ReturnName(playerid), params);
		SendLEOMessage(color_blue, string);
		return 1;
	}
	return 1;
}


CMD:mode(playerid, params[])
{
	new string[42];
	format(string, sizeof(string), "%s is in %s",ReturnName(playerid), GetPlayerMode(playerid));
	SendClientMessage(playerid ,color_cyan, string);
	return 1;
}

// BIND COMMANDS

CMD:b(playerid, params[])
{
	if(!COPLEO[playerid])
    {
        return SendClientMessage(playerid, color_blue, "[Error]{FFFFFF}: You are not a cop");
	}
	if(COPLEO[playerid])
	{
		SendClientMessage(playerid, color_blue, "[Cop Chase]{FFFFFF}: /b(1-3)");
		SendClientMessage(playerid, color_blue, "[Cop Chase]{FFFFFF}: Example: /b2");
		return 1;
	}
	return 1;
}

CMD:b1(playerid, params[])
{
	if(!COPLEO[playerid])
    {
        return SendClientMessage(playerid, color_blue, "[Error]{FFFFFF}: You are not a cop");
	}
	if(COPVOL[playerid] || COPPOLICE[playerid])
	{
		SetPlayerChatBubble(playerid,"o<: This is the POLICE DEPARTMENT - DO NOT MOVE and PUT YOUR HANDS UP!", 0xE65C00FF, 100.0, 8000);
		SendClientMessage(playerid, color_blue, "{E65C00}[Server]{FFFFFF}: The message ''PULL OVER to the SIDE of the ROAD!'' has appeared above your head");
	}
	if(COPFBI[playerid] || COPHRT[playerid])
	{
		SetPlayerChatBubble(playerid, "o<: This is the FBI - PULL OVER to the SIDE of the ROAD!", 0xE65C00FF, 100.0, 8000);
		SendClientMessage(playerid, color_blue, "{E65C00}[Server]{FFFFFF}: The message ''PULL OVER to the SIDE of the ROAD!'' has appeared above your head");
	}
	return 1;
}

CMD:b2(playerid, params[])
{
	if(!COPLEO[playerid])
    {
        return SendClientMessage(playerid, color_blue, "[Error]{FFFFFF}: You are not a cop");
	}
	if(COPVOL[playerid] || COPPOLICE[playerid])
	{
		SetPlayerChatBubble(playerid, "o<: This is the POLICE DEPARTMENT - DO NOT MOVE and PUT YOUR HANDS UP!", 0xE65C00FF, 100.0, 8000);
		SendClientMessage(playerid, color_blue, "{E65C00}[Server]{FFFFFF}: The message ''DO NOT MOVE and PUT YOUR HANDS UP!'' has appeared above your head");
	}
	else if(COPFBI[playerid] || COPHRT[playerid])
	{
		SetPlayerChatBubble(playerid, "o<: This is the FBI - DO NOT MOVE and PUT YOUR HANDS UP!", 0xE65C00FF, 100.0, 8000);
		SendClientMessage(playerid, color_blue, "{E65C00}[Server]{FFFFFF}: The message ''DO NOT MOVE and PUT YOUR HANDS UP!'' has appeared above your head");
	}
	return 1;
}

CMD:b3(playerid, params[])
{
	if(!COPLEO[playerid])
    {
        return SendClientMessage(playerid, color_blue, "[Error]{FFFFFF}: You are not a cop");
	}
	if(COPVOL[playerid] || COPPOLICE[playerid])
	{
		SetPlayerChatBubble(playerid, "o<: This is the POLICE DEPARTMENT - COMPLY or WE WILL USE FORCE!", 0xE65C00FF, 100.0, 8000);
		SendClientMessage(playerid, color_blue, "{E65C00}[Server]{FFFFFF}: The message ''COMPLY or WE WILL USE FORCE!'' has appeared above your head");
	}
	if(COPFBI[playerid] || COPHRT[playerid])
	{
		SetPlayerChatBubble(playerid, "o<: This is the FBI - COMPLY or WE WILL USE FORCE!", 0xE65C00FF, 100.0, 8000);
		SendClientMessage(playerid, color_blue, "{E65C00}[Server]{FFFFFF}: The message ''COMPLY or WE WILL USE FORCE!'' has appeared above your head");
	}
	return 1;
}

CMD:pm(playerid, params[])
{
	new playerb, pmmsg[150], string[150], string1[150];
    if(sscanf(params, "us[150]", playerb, pmmsg))
        return SendClientMessage(playerid, color_cyan, "[Usage]{FFFFFF}: /pm [playerid] [message]");
	if(!IsPlayerConnected(playerb)) return SendClientMessage(playerid, color_red, "This player is not connected.");
	if(togpm[playerid] == 1) return SendClientMessage(playerid, color_error, "You have your PM toggled");
	if(togpm[playerb] == 1) return SendClientMessage(playerid, color_error, "That player has toggled their PMs");
	if(playerb == playerid) return SendClientMessage(playerid, color_error, "You cannot send apm to yourself.");
	
	if(PlayerAFK[playerb])
	{
	format(string, sizeof(string), "{dce31b} PM from %s(%d): %s", PlayerInfo[playerid][pAccName],playerid, pmmsg);
	format(string1, sizeof(string1), "{dce31b} PM Sent to %s(%d): %s",PlayerInfo[playerb][pAccName],playerb, pmmsg);
	SendClientMessage(playerb, color_red, string);
	SendClientMessage(playerid, color_red, string1);
	SendClientMessage(playerid, color_error,"That player is afk, it may take awhile for them to respond.");	
	}
	format(string, sizeof(string), "{dce31b} PM from %s(%d): %s", PlayerInfo[playerid][pAccName],playerid, pmmsg);
	format(string1, sizeof(string1), "{dce31b} PM Sent to %s(%d): %s", PlayerInfo[playerb][pAccName],playerb, pmmsg);
	SendClientMessage(playerb, color_red, string);
	SendClientMessage(playerid, color_red, string1);
	PlayerPlaySound(playerb, 21001, 0.0, 0.0, 10.0);
	return 1;
}

CMD:ask(playerid, params[])
{
	if(PlayerInfo[playerid][pMute] > 0){
		SendClientMessage(playerid, color_red, "You're Muted.");
		return 0;
	}

	if(isnull(params))
	{
	    return SendClientMessage(playerid, color_ask, "[Usage]{FFFFFF}: /ask [text]");
	}

	if(PlayerInfo[playerid][pAdmin] > 1)
	{
		new string[128];
		format(string, sizeof(string), "[Ask] %s %s (%d){FFFFFF}: %s", GetAdminRank(playerid),PlayerInfo[playerid][pAccName],playerid, params);
		SendClientMessageToAll(color_ask, string);
		return 1;
	}
	else
	{
		new string[128];
		format(string, sizeof(string), "[Ask] %s (%d){FFFFFF}: %s", PlayerInfo[playerid][pAccName],playerid, params);
		SendClientMessageToAll(color_ask, string);
		return 1;
	}
}

CMD:admins(playerid, params[])
{
	SendClientMessage(playerid, color_lime, "----------------Online Administrators-------------------");
    for(new i; i<MAX_PLAYERS; i++)
		{
			if(IsPlayerConnected(i))
			{
				if(PlayerInfo[i][pAdmin] >= 1)
				{			
				new astatus[64];
				if(pAduty[i] == 1)
				{
					astatus = "{FD0000}Administrating";
				}
				else if(pAduty[i] == 0)
				{
					astatus = "{FFFFFF}Playing";
				}
			 	if(PlayerAFK[i] == true)
				{
					astatus = "{FFCC00}Paused";
				}
                new string[500];
				format(string, sizeof(string), "* Server %s: %s (%d), Status: %s", GetAdminRank(i), PlayerInfo[i][pAccName], i, astatus);
				SendClientMessage(playerid, color_white, string);
				}
            }
        }
    return 1;
}


CMD:id(playerid, params[])
{
	new count, name[MAX_PLAYER_NAME], playerb = strval(params);

	if(isnull(params))
	{
	    return SendClientMessage(playerid, color_red, "[Usage]{FFFFFF}: /id [playerid/name]");
	}

	if(IsNumeric(params))
	{
		if(IsPlayerConnected(playerb))
		{
			SendClientMessageEx(playerid,color_lime, "Matching Players:");
		    GetPlayerName(playerb, name, sizeof(name));
		    SendClientMessageEx(playerid,color_white, "* %s (%d) - mode: %s",PlayerInfo[playerb][pAccName],playerb, GetPlayerMode(playerb));
		}
		else
		{
		    SendClientMessage(playerid, color_red, "[Error]{FFFFFF}: No player with that {FD0000}ID{FFFFFF}.");
		}
	}
	else if(strlen(params) < 2)
	{
	    SendClientMessage(playerid, color_red, "[Error]{FFFFFF}: Please input at least two characters to search.");
	}
	else
	{
	    foreach(new i : Player)
	    {
	        GetPlayerName(i, name, sizeof(name));
			SendClientMessage(playerid, color_lime, "Matching Players:");
	        if(strfind(name, params, true) != -1)
	        {
				new string[180];
				format(string, sizeof(string), "* %s (%d) - Mode: %s", PlayerInfo[i][pAccName],i,GetPlayerMode(i));
	            count++;
			}
		}

		if(!count)
		{
		    SendClientMessageEx(playerid, color_red, "[Error]{FFFFFF}: No results found for \"%s\". Please narrow your search.", params);
		}
	}

	return 1;
}

CMD:afk(playerid, params[])
{
	new playerb;

	if(sscanf(params, "u", playerb))
	{
	    return SendClientMessage(playerid, color_red, "[Usage]{FFFFFF}: /afk [playerid/name]");
	}
	if(!IsPlayerConnected(playerb))
	{
	    return SendClientMessage(playerid, color_red, "The player specified is disconnected.");
	}

	if(PlayerAFK[playerb] == true)
	{
	    SendClientMessageEx(playerid, color_banned, "[AFK]{FFFFFF}: %s has been AFK for %i seconds.", ReturnName(playerb), gettime()-AFKTime[playerb]);
	}
	else
	{
	    SendClientMessageEx(playerid, color_banned, "[AFK]{FFFFFF}: %s (%d) is not afk (%s)", ReturnName(playerb), playerb, GetPlayerMode(playerb));
	}

	return 1;
}


CMD:vc(playerid, params[])
{
	if(PlayerInfo[playerid][pDonator] == 1)
	{
	if(isnull(params))
    {
    return SendClientMessage(playerid, color_red, "[Donator]{FFFFFF}: /vc [message]");
    }
	new string[88];
	format(string, sizeof(string), "[VIP] Donator %s (%d){FFFFFF}: %s ",PlayerInfo[playerid][pAccName],playerid, params);
	SendDonatorMessage(color_purple, string);
	}
	else
	{
		SendClientMessage(playerid, color_red, "You are not authorized to use this command");
	}
	return 1;
}

CMD:report(playerid, params[])
{

    new playerb, reporttext[120];
    if(sscanf(params, "us[120]", playerb, reporttext))
        return SendClientMessage(playerid, color_red, "[Usage]{FFFFFF}: /report [id] [reason]");

    if(PlayerInfo[playerb][pAdmin] >= 1)
        return SendClientMessage(playerid, color_error, "You cannot report admins, report them on discord");

	new stringd[150];
	new stringr[150];
	SendClientMessageEx(playerid, color_ticket, "You have reported %s Reason: %s", ReturnName(playerb), reporttext);
	format(stringd, sizeof(stringd), "```[Report #%d]: %s(%d) has reported %s(%d) for _%s_```",playerid, ReturnName(playerid), playerid, ReturnName(playerb),playerb, reporttext);
	format(stringr, sizeof(stringr), "[Report #%d]: {FD0000}%s (%d) {FFFFFF}has reported {FD0000}%s(%d) {FFFFFF}for {FD0000}%s",playerid, ReturnName(playerid), playerid, ReturnName(playerb),playerb, reporttext);
	SendAdminMessage(color_error, stringr);
	SendClientMessageEx(playerid, color_ticket, "%s has been reported. The report is #%d in queue", ReturnName(playerb), playerid);
	DCC_SendChannelMessage(g_ReportLogChannel, stringd);
    return 1;
}

CMD:support(playerid, params[])
{
    if(ActiveSupport[playerid] == 1)
	{
        SendClientMessage(playerid, color_ticket, "You already have a support ticket open. Be patient.");
        return 1;
    }

    new support[120];
    if(sscanf(params, "s[120]", support))
        return SendClientMessage(playerid, color_red, "[Usage]{FFFFFF}: /support [message]");

	new stringr[150];
	new stringdiscord[200];
	format(stringdiscord, sizeof(stringdiscord), "```[Support #%d]: %s(%d) support ticket for: %s```",playerid, ReturnName(playerid), playerid, support);
	format(stringr, sizeof(stringr), "[Support #%d]: {FD0000}%s (%d) {FFFFFF}has asked {FD0000}''%s''",playerid, ReturnName(playerid), playerid, support);
	SendAdminMessage(color_error, stringr);
	SendClientMessageEx(playerid, color_ticket, "You made a support ticket. There are currently %d tickets pending.",playerid);
	DCC_SendChannelMessage(g_SupportLogChannel, stringdiscord);
	ActiveSupport[playerid] = 1;
    return 1;
}

CMD:sprunk(playerid, params[])
{
	if(PlayerNearSprunk(playerid))
	{
		if(NBA[playerid] == 1 && capedbynba == 1)
		{
			GivePlayerHealth(playerid, 25);
			SendClientMessage(playerid, color_ticket, "As per turf benifit, you get to use the Sprunk Machines");
		}
		if(GSF[playerid] == 1 && capedbygsf == 1)
		{
			GivePlayerHealth(playerid, 25);
			SendClientMessage(playerid, color_ticket, "As per turf benifit, you get to use the Sprunk Machines");
		}
		if(VAR[playerid] == 1 && capedbyvar == 1)
		{
			GivePlayerHealth(playerid, 25);
			SendClientMessage(playerid, color_ticket, "As per turf benifit, you get to use the Sprunk Machines");
		}
		if(LSV[playerid] == 1 && capedbylsv == 1)
	    {
			GivePlayerHealth(playerid, 25);
			SendClientMessage(playerid, color_ticket, "As per turf benifit, you get to use the Sprunk Machines");
		}
		if(NBA[playerid] == 1 && capedbynba == 0)
		{
			SendClientMessage(playerid, color_error, "You cannot use the sprunk as your gang does not own a turf");
		}
		if(GSF[playerid] == 1 && capedbygsf == 0)
		{
			SendClientMessage(playerid, color_error, "You cannot use the sprunk as your gang does not own a turf");
		}
		if(VAR[playerid] == 1 && capedbyvar == 0)
		{
			SendClientMessage(playerid, color_error, "You cannot use the sprunk as your gang does not own a turf");
		}
		if(LSV[playerid] == 1 && capedbylsv == 0)
		{
			SendClientMessage(playerid, color_error, "You cannot use the sprunk as your gang does not own a turf");
		}
	}
	return 1;
}


CMD:mygroups(playerid, params[])
{
	SendClientMessageEx(playerid, color_lime, "Group ID: %s",PlayerInfo[playerid][grouppid]);
	SendClientMessageEx(playerid, color_lime, "Group Rank: %s",PlayerInfo[playerid][grouprank]);
	return 1;
}


CMD:settings(playerid, params[])
{
	new dis[64];
	if(showconnect[playerid] == 1)
	{
		dis = "{42D43D}YES";
	}
	else if(showconnect[playerid] == 0)
	{
		dis = "{FF2121}OFF";
	}
	new togpublic[64];
	if(publicoff[playerid] == 0)
	{
		togpublic = "{42D43D}YES";
	}
	else if(publicoff[playerid] == 1)
	{
		togpublic = "{FF2121}OFF";
	}
	new togpms[64];
	if(togpm[playerid] == 0)
	{
		togpms = "{42D43D}ON";
	}
	else if(togpm[playerid] == 1)
	{
		togpms = "{FF2121}OFF";
	}
	new lui[64];
	if(showlocation[playerid] == 1)
	{
		lui = "{42D43D}ON";
	}
	else if(showlocation[playerid] == 0)
	{
		lui = "{FF2121}OFF";
	}
	new hits[64];
	if(showhitmarker[playerid] == 1)
	{
		hits = "{42D43D}ON";
	}
	else if(showhitmarker[playerid] == 0)
	{
		hits = "{FF2121}OFF";
	}
	new string1[225];
	new string2[225];
	new string3[225];
	new string4[225];
	new string5[350];
	new string6[350];
	new string7[350];
//	new string[225]; string =  "{FFFFFF}Option\t{FFFFFF}Status\n";
    format(string1, sizeof(string1), "%s{FFFFFF}Change Password\t\n");
    format(string2, sizeof(string2), "%s{FFFFFF}Change Username\t\n", string1);
    format(string3, sizeof(string3), "%s{FFFFFF}(Dis)connection Messages\t%s\n", string2, dis);
    format(string4, sizeof(string4), "%s{FFFFFF}Public Chat\t%s\n", string3, togpublic);
    format(string5, sizeof(string5), "%s{FFFFFF}Toggle PM\t%s\n", string4, togpms);
	format(string6, sizeof(string6), "%s{FFFFFF}Location UI\t%s\n", string5, lui);
	format(string7, sizeof(string7), "%s{FFFFFF}Hitmarker\t%s\n", string6, hits);
    ShowPlayerDialog(playerid, 10, DIALOG_STYLE_TABLIST, "{EE28EB}[F:DM] {FFFFFF}Settings", string7, "Select", "Close");
	return 1;
}

CMD:distest(playerid, params[])
{
	SendConnectMessage(color_red, "works, on");
	return 1;
}

CMD:help(playerid, params[])
{
 /* if(INGWR[playerid] == 1)
    SendClientMessage(playerid, color_green, "/t, /capture, /sw, /sprunk");
    if(COPLEO[playerid] == 1)
    SendClientMessage(playerid, COLOR_VOL, "/r, /b(1-3), /jail");
    if(PlayerInfo[playerid][pDonator] == 1)
    SendClientMessage(playerid, color_cyan, "/vc");
    return 1;*/
    ShowPlayerDialog(playerid,69,DIALOG_STYLE_MSGBOX,"{EE28EB}[F:DM] {FFFFFF}Help","{FFFFFF}/lobby, /settings, /duel, /report, /support, /id, /admins, /ask\n/animhelp, /afk, /discord, /pm, /stats, /colorshop","Okay","");
    return 1;
}

CMD:colorshop(playerid, params[])
{
	new playerState = GetPlayerState(playerid);
	if (playerState == PLAYER_STATE_WASTED)
	{
	SendClientMessage(playerid, color_error, "Can't use this Cmd while you are dead");
	return 1;
	}
	if(INL[playerid] == 0){
		SendClientMessage(playerid, color_error, "You can only use this cmd if you're in Lobby.");
	}

	ShowPlayerDialog(playerid, 13, DIALOG_STYLE_TABLIST, "{42f5f5}[F:DM]: Color Shop", "{e320f5}Pink\t{26b528}100,000$\n{9c20f5}Purple\t{26b528}100,000$\n{2027f5}Blue\t{26b528}100,000$\n{20f1f5}Light Blue\t{26b528}100,000$\n{0fab22}Green\t{26b528}100,000$\n{7bff29}Lime\t{26b528}100,000$\n{e8ff1c}Yellow\t{26b528}100,000$\n{ff7b1c}Orange\t{26b528}100,000$", "Buy", "cancel");
	return 1;
    
}

CMD:stats(playerid, params[])
{
	new playername[MAX_PLAYER_NAME];
	if(sscanf(params,"s[24]",playername)){
		return SendClientMessage(playerid, color_error, "Usage: /stats [playername]");
 
	}

	new thread[120];
    mysql_format(ourConnection, thread, sizeof(thread), "SELECT * FROM fdm_accounts WHERE acc_name = '%e' LIMIT 1", playername);
    mysql_tquery(ourConnection, thread, "OnLoadStatsForGame", "si", playername, playerid);
	return 1;
}
