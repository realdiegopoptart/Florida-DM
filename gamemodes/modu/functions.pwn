
public OnQueryError(errorid, const error[], const callback[], const query[], MySQL:handle)
{
	new string[82];
	format(string, sizeof(string), "[AdmCmd]: A MySQL error occurred (error %i). Details has been sent to the developers", errorid);
	SendAdminMessage(color_banned, string);

	new stringd[2048];
	format(stringd, sizeof(stringd), "[%s]\n\nError ID: **%i**\nCallback: **%s**\n\n**Query**: %s\nError: **%s**\n\n<@342126796705103872>", GetDate(), errorid, callback, query, error);
	DCC_SendChannelMessage(g_DeveloperChannel, stringd);
	return 1;
}

//--------------- W/o Category Functions -------------------------//
forward LoadModeColor(playerid);
public LoadModeColor(playerid)
{
	if(INL[playerid] || SDM[playerid] || PDM[playerid] || LVPD[playerid] || WDM[playerid] || INRCDM[playerid] || GDM[playerid])//1
	{
		CheckPlayerColor(playerid);
		return 1;
	}
	if(COPPOLICE[playerid] || COPFBI[playerid] || COPHRT[playerid])//2
	{
		SetPlayerColor(playerid, color_blue);
		return 1;
	}
	if(COPVOL[playerid])//3
	{
		SetPlayerColor(playerid, COLOR_VOL);
		return 1;
	}
	if(COPCRIM[playerid])//4
	{
		SetPlayerColor(playerid, color_criminal);
		return 1;
	}
	if(GSF[playerid])//4
	{
		SetPlayerColor(playerid, COLOR_GROVE);
		return 1;
	}
	if(NBA[playerid])//9
	{
		SetPlayerColor(playerid, COLOR_BALLAS);
		return 1;
	}
	if(LSV[playerid])//9
	{
		SetPlayerColor(playerid, COLOR_VAGOS);
		return 1;
	}
	if(VAR[playerid])//9
	{
		SetPlayerColor(playerid, COLOR_AZCETAS);
		return 1;
	}
	return 1;
}
forward SetToGmx();
public SetToGmx()
{
	SendRconCommand("gmx");
    return 1;
}
forward ClearChatbox(playerid, lines);
public ClearChatbox(playerid, lines)
{
	if (IsPlayerConnected(playerid))
	{
		for(new i=0; i<lines; i++)
		{
			SendClientMessage(playerid, color_banned, " ");
		}
	}
	return 1;
}

forward Deathgametext(playerid);
public Deathgametext(playerid)
{
	if(Timetorespawn[playerid] == 0){
		KillTimer(DeathgametextIdent[playerid]);
		return 1;
	}
	Timetorespawn[playerid] -= 1;
	new s[30];
	format(s, sizeof(s),"You're respawning in %d seconds", Timetorespawn);
	GameTextForPlayer(playerid, s, 1000, 4);
	return 1;
}


forward JustSpawnedTimer(playerid);
public JustSpawnedTimer(playerid)
{
	JustSpawned[playerid] = false;
	KillTimer(JustSpawnedTimerId[playerid]);
	return 1;
}

forward Spectating(playerid);
public Spectating(playerid)
{
	TogglePlayerSpectating(playerid, 0);
	SpawnPlayer(playerid);
	return 1;
}




forward DetectModeFromPlayer(playerid);
public DetectModeFromPlayer(playerid)
{
	if(INL[playerid])//1
	{
		ModeDetectionResults [playerid] = 1;
		return 1;
	}
	if(INGWR[playerid])//2
	{
		ModeDetectionResults [playerid] = 2;
		return 1;
	}
	if(LVPD[playerid])//3
	{
		ModeDetectionResults [playerid] = 3;
		return 1;
	}
	if(WDM[playerid])//4
	{
		ModeDetectionResults [playerid] = 4;
		return 1;
	}
	if(INRCDM[playerid])//5 | in rc ground dm status
	{
		ModeDetectionResults [playerid] = 5;
		return 1;
	}
	if(PDM[playerid])//6
	{
		ModeDetectionResults [playerid] = 6;
		return 1;
	}
	if(SDM[playerid])//7
	{
		ModeDetectionResults [playerid] = 7;
		return 1;
	}
	if(GDM[playerid])//8
	{
		ModeDetectionResults [playerid] = 8;
		return 1;
	}
	if(INCOP[playerid])//9
	{
		ModeDetectionResults [playerid] = 9;
		return 1;
	}
	return 1;
}


//--------------- C Bug Functions --------------------------------//

forward MakeCBug(playerid);
public MakeCBug(playerid)
{

    if(ISCBUGING[playerid] == 0)
    {
		new Float:slx, Float:sly, Float:slz;
	    GetPlayerPos(playerid, slx, sly, slz);
	    SetPlayerPos(playerid, slx, sly, slz+1);

	    GameTextForPlayer(playerid, "C-Bug is not allowed", 2000, 3);
	    TogglePlayerControllable(playerid, 0);
	    PlayerPlaySound(playerid, 1130, 0.0, 0.0, 0.0);

	    ISCBUGING [playerid] = 1;
	    SetTimerEx("CbugTime", 2000, false, "d", playerid);
	}
	else
	{
		// do nothing
	}
    return 1;
}

forward CbugTime(playerid);
public CbugTime(playerid)
{
    TogglePlayerControllable(playerid, 1);	
    SetTimerEx("AntiFlyCbug", 1500, false, "d", playerid);
    return 1;
}

forward AntiFlyCbug(playerid);
public AntiFlyCbug(playerid)
{
	ISCBUGING [playerid] = 0;
	return 1;
}
//----------------- GWAR TURF Functions --------------------------//

forward TurfTime(playerid);
public TurfTime(playerid)
{
	if(gsfcaping == 1){
		GangZoneStopFlashForPlayer(playerid, turf);
		GangZoneShowForAll(turf, color_green);
		SendGwarMessage(COLOR_GROVE, "[Gang War]{FFFFFF}: Turf has been captured by Grove Street Team.");
		SendClientMessage(playerid, color_purple, "[Info]{FFFFFF}: You successfully captured the turf. You gained a level.");

		new ownerstring[80];
    	format(ownerstring, sizeof(ownerstring), "~b~Owner: ~w~Grove Street");
    	TextDrawSetString(sprunkown, ownerstring);

		new namestring[80];
    	format(namestring, sizeof(namestring), "~g~Grove's Sprunk ~w~-~y~ GSF");
    	TextDrawSetString(sprunknme, namestring);

		if(GSF[playerid]){
		SetPlayerScore(playerid, PlayerInfo[playerid][pScore] + 1);
		UpdateScore(playerid);

           
      
		capedbygsf = 1;
		capedbyvar = 0;
		capedbylsv = 0;
		capedbynba = 0;
		PLAYERCAP [playerid] = 0;
		caping = 0;
		gsfcaping = 0;
        nbacaping = 0;
        lsvcaping = 0;
        varcaping = 0;
		caped = 1;
		}	
	}

	if(nbacaping == 1){
		GangZoneStopFlashForPlayer(playerid, turf);
		GangZoneShowForAll(turf, color_purple);
		SendGwarMessage(COLOR_BALLAS, "[Gang War]{FFFFFF}: Turf has been captured by Kilo Tray Ballas.");
		SendClientMessage(playerid, color_purple, "[Info]{FFFFFF}: You successfully captured the turf. You gained a level.");

		new ownerstring[80];
    	format(ownerstring, sizeof(ownerstring), "~b~Owner: ~w~KT Ballas");
    	TextDrawSetString(sprunkown, ownerstring);

		new namestring[80];
    	format(namestring, sizeof(namestring), "~p~Ballas' Sprunk ~w~-~r~ We finna own this");
    	TextDrawSetString(sprunknme, namestring);

		if(NBA[playerid]){
		SetPlayerScore(playerid, PlayerInfo[playerid][pScore] + 1);
		UpdateScore(playerid);
		capedbygsf = 0;
		capedbyvar = 0;
		capedbylsv = 0;
		capedbynba = 1;
		PLAYERCAP [playerid] = 0;
		caping = 0;
		gsfcaping = 0;
        nbacaping = 0;
        lsvcaping = 0;
        varcaping = 0;
		caped = 1;
		}			
	}
	if(varcaping == 1){
		GangZoneStopFlashForPlayer(playerid, turf);
		GangZoneShowForAll(turf, color_cyan);
		SendGwarMessage(COLOR_AZCETAS, "[Gang War]{FFFFFF}: Turf has been captured by Los Varrios Azcetas.");
		SendClientMessage(playerid, color_purple, "[Info]{FFFFFF}: You successfully captured the turf. You gained a level.");

		new ownerstring[80];
    	format(ownerstring, sizeof(ownerstring), "~b~Owner: ~w~Las Aztecas");
    	TextDrawSetString(sprunkown, ownerstring);

		new namestring[80];
    	format(namestring, sizeof(namestring), "~b~Los Sprunks ~w~- Good Tasting Sprunk");
    	TextDrawSetString(sprunknme, namestring);

		if(VAR[playerid]){
		SetPlayerScore(playerid, PlayerInfo[playerid][pScore] + 1);
		UpdateScore(playerid);
		PLAYERCAP [playerid] = 0;
		capedbygsf = 0;
		capedbyvar = 1;
		capedbylsv = 0;
		capedbynba = 0;
		PLAYERCAP [playerid] = 0;
		caping = 0;
		gsfcaping = 0;
        nbacaping = 0;
        lsvcaping = 0;
        varcaping = 0;
		caped = 1;
		}			
	}
	if(lsvcaping == 1){
		GangZoneStopFlashForPlayer(playerid, turf);
		GangZoneShowForAll(turf, color_yellow);
		SendGwarMessage(COLOR_VAGOS, "[Gang War]{FFFFFF}: Turf has been captured by Los Santos Vagos.");
		SendClientMessage(playerid, color_purple, "[Info]{FFFFFF}: You successfully captured the turf. You gained a level.");

		new ownerstring[80];
    	format(ownerstring, sizeof(ownerstring), "~b~Owner: ~w~Los Vagos");
    	TextDrawSetString(sprunkown, ownerstring);

		new namestring[80];
    	format(namestring, sizeof(namestring), "~y~El Sprunk ~w~- LSV Owned");
    	TextDrawSetString(sprunknme, namestring);

		if(LSV[playerid]){
		SetPlayerScore(playerid, PlayerInfo[playerid][pScore] + 1);
		UpdateScore(playerid);
		capedbygsf = 0;
		capedbyvar = 0;
		capedbylsv = 1;
		capedbynba = 0;
		PLAYERCAP [playerid] = 0;
		caping = 0;
		gsfcaping = 0;
        nbacaping = 0;
        lsvcaping = 0;
        varcaping = 0;
		caped = 1;

		}			
	}


    return 1;
}

forward Turfcount();
public Turfcount()
{	
	if(TurfCountdown == 0)
	{
		KillTimer(TurfIdentifier);

	    for(new i = 0; i < MAX_PLAYERS; i++)
	    {
	        if(IsPlayerConnected(i))
	        {
	            HidePlayerProgressBar(i, td_timerprogress);
	        }
	    }

	    TextDrawHideForAll(td_timertext);
	    TextDrawHideForAll(td_timerbg);
		return 1;
	}

	TurfCountdown --;
	new stringtd[100];
	format(stringtd, sizeof(stringtd), "Time Left: ~y~%i~w~ Seconds", TurfCountdown);
	TextDrawSetString(td_timertext, stringtd);

	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
	    {
	        SetPlayerProgressBarValue(i, td_timerprogress, TurfCountdown);
	    }
    }

	return 1;
}


//----------------- UPDATE STATS Functions ------------------------//
function: OnLoadStatsForGameForAdmin(playername[], playerid)
{
    new string[800],kills, money, deaths, score, arenakills, duelkills, gwarkills, registerip[20], LastIp[20], date[120];
    if(!cache_num_rows()){
        SendClientMessage(playerid, color_error, "This name doesn't exists in our Data base.");
        return 1;
    }

    cache_get_value_name_int(0, "acc_kills", kills);
    cache_get_value_name_int(0, "Gwar_kills", gwarkills);
    cache_get_value_name_int(0, "Duel_kills", duelkills);
    cache_get_value_name_int(0, "Arena_kills", arenakills);
    cache_get_value_name_int(0, "acc_money", money);
    cache_get_value_name(0, "register_ip", registerip);
    cache_get_value_name_int(0, "acc_deaths", deaths);
    cache_get_value_name_int(0, "acc_score",  score);
    cache_get_value_name(0, "register_date", date);
    cache_get_value_name(0, "Last_Ip", LastIp);
    
    format(string, sizeof(string), "{e600e6}Player Name: {1affff}%s\n- {e600e6}Player Kills: {1affff}%i\n- {e600e6}Player Deaths: {1affff}%i\n- {e600e6}Player Arena kills: {1affff}%i\n- {e600e6}Player Duel kills: {1affff}%i\n- {e600e6}Player Gang war kills: {1affff}%i\n- {e600e6}Player Score: {1affff}%i\n- {e600e6}Player Money: {1affff}%i\n- {e600e6}Player Registration Date: {1affff}%s\n- {e600e6}Registration IP: {1affff}%s\n- {e600e6}Last-used-Ip: {1affff}%s", 
    playername, kills, deaths, arenakills, duelkills, gwarkills, score, money, date, registerip, LastIp);

    ShowPlayerDialog(playerid, 14, DIALOG_STYLE_MSGBOX, "Player stats:", string, "okay", "");
    return 1;
}

forward OnLoadStatsForGame(playername[], playerid);
public OnLoadStatsForGame(playername[], playerid)
{
	new string[500],kills, money, deaths, score, arenakills, duelkills, gwarkills, date[120];
    if(!cache_num_rows()){
		SendClientMessage(playerid, color_error, "This name doesn't exists in our Data base.");
        return 1;
    }
    cache_get_value_name_int(0, "acc_kills", kills);
    cache_get_value_name_int(0, "Gwar_kills", gwarkills);
    cache_get_value_name_int(0, "Duel_kills", duelkills);
    cache_get_value_name_int(0, "Arena_kills", arenakills);
    cache_get_value_name_int(0, "acc_money", money);
    cache_get_value_name_int(0, "acc_deaths", deaths);
    cache_get_value_name_int(0, "acc_score",  score);
    cache_get_value_name(0, "register_date", date);
    format(string, sizeof(string), "{e600e6}Player Name: {1affff}%s\n- {e600e6}Player Kills: {1affff}%i\n- {e600e6}Player Deaths: {1affff}%i\n- {e600e6}Player Score: {1affff}%i\n- {e600e6}Player Registration Date: {1affff}%s\n- {e600e6}Player Arena kills: {1affff}%i\n- {e600e6}Player Duel kills: {1affff}%i\n- {e600e6}Player Gang war kills: {1affff}%i", playername, kills, deaths, score, date, arenakills, duelkills, gwarkills);

    ShowPlayerDialog(playerid, 14, DIALOG_STYLE_MSGBOX, "Player stats:", string, "okay", "");
	return 1;
}

function:UpdateHandledTickets(playerid)
{
	new insert[200];
    mysql_format(ourConnection ,insert, sizeof(insert), "UPDATE fdm_accounts SET Handled_Tickets = %i WHERE acc_name = '%e'", pHandledtickets[playerid], PlayerInfo[playerid][pAccName]);
    mysql_tquery(ourConnection, insert);
    return 1;
}

function:UpdateDuelKills(playerid)
{
	new insert[200];
    mysql_format(ourConnection ,insert, sizeof(insert), "UPDATE fdm_accounts SET Duel_kills = %i WHERE acc_name = '%e'", PlayerInfo[playerid][pDuelkills], PlayerInfo[playerid][pAccName]);
    mysql_tquery(ourConnection, insert);
    return 1;
}

function:UpdateArenaKills(playerid)
{
	new insert[200];
    mysql_format(ourConnection ,insert, sizeof(insert), "UPDATE fdm_accounts SET Arena_kills = %i WHERE acc_name = '%e'", PlayerInfo[playerid][pArenakills], PlayerInfo[playerid][pAccName]);
    mysql_tquery(ourConnection, insert);
    return 1;
}

function:UpdateGwarKills(playerid)
{
	new insert[200];
    mysql_format(ourConnection ,insert, sizeof(insert), "UPDATE fdm_accounts SET Gwar_kills = %i WHERE acc_name = '%e'", PlayerInfo[playerid][pGwarkills], PlayerInfo[playerid][pAccName]);
    mysql_tquery(ourConnection, insert);
    return 1;
}

function:UpdateScore(playerid)
{
	new insert[200];
    mysql_format(ourConnection ,insert, sizeof(insert), "UPDATE fdm_accounts SET acc_score = %i WHERE acc_name = '%e'", PlayerInfo[playerid][pScore], PlayerInfo[playerid][pAccName]);
    mysql_tquery(ourConnection, insert);
	return 1;
}

function:UpdateMoney(playerid)
{
	new insert[200];
    mysql_format(ourConnection ,insert, sizeof(insert), "UPDATE fdm_accounts SET acc_money = %i WHERE acc_name = '%e'", PlayerInfo[playerid][pMoney], PlayerInfo[playerid][pAccName]);
    mysql_tquery(ourConnection, insert);
	return 1;
}

function:UpdatePlayerGroupStatus(playerid)
{
	new insert[250];
    mysql_format(ourConnection, insert, sizeof(insert), "UPDATE fdm_accounts SET groupid = %i WHERE acc_name = '%e'", PlayerInfo[playerid][grouppid], PlayerInfo[playerid][pAccName]);
    mysql_tquery(ourConnection, insert);

    mysql_format(ourConnection, insert, sizeof(insert), "UPDATE fdm_accounts SET grouprank = %s WHERE acc_name = '%e'", PlayerInfo[playerid][grouprank], PlayerInfo[playerid][pAccName]);
    mysql_tquery(ourConnection, insert);
    return 1;
}

//----------------- LOG IN / LOG OFF Functions --------------------//
function:CheckPlayerColor(playerid)
{
	cache_get_value_name_int(0, "acc_color", PlayerInfo[playerid][pColor]);
	if(PlayerInfo[playerid][pColor] == 0){
		SetPlayerColor(playerid, color_white);
		return 1;
	}
	if(PlayerInfo[playerid][pColor] == 1){
		SetPlayerColor(playerid, shop_pink);
		return 1;
	}
	if(PlayerInfo[playerid][pColor] == 2){
		SetPlayerColor(playerid, shop_purple);
		return 1;
	}
	if(PlayerInfo[playerid][pColor] == 3){
		SetPlayerColor(playerid, shop_blue);
		return 1;
	}
	if(PlayerInfo[playerid][pColor] == 4){
		SetPlayerColor(playerid, shop_cyan);
		return 1;
	}
	if(PlayerInfo[playerid][pColor] == 5){
		SetPlayerColor(playerid, shop_green);
		return 1;
	}
	if(PlayerInfo[playerid][pColor] == 6){
		SetPlayerColor(playerid, shop_lime);
		return 1;
	}
	if(PlayerInfo[playerid][pColor] == 7){
		SetPlayerColor(playerid, shop_yellow);
		return 1;
	}
	if(PlayerInfo[playerid][pColor] == 8){
		SetPlayerColor(playerid, shop_orange);
		return 1;
	}
	return 1;
}
function:KickTimer(playerid) { return Kick(playerid); }

function:SetPlayerCamera(playerid)
{
	new rand = random(3);

	switch(rand)
	{
		case 0:
		{
		SetPlayerCameraPos(playerid, 2019.1145, 1202.9185, 42.3246);
		SetPlayerCameraLookAt(playerid, 2019.9889, 1202.4272, 42.2945);
		}
		case 1:
		{
   		SetPlayerCameraPos(playerid, 1701.8396, -1572.9250, 26.6298);
		SetPlayerCameraLookAt(playerid, 1701.2588, -1572.1072, 27.1848);
		}
		case 2:
		{
   		SetPlayerCameraPos(playerid, -2619.1006, 2202.6091, 49.9144);
		SetPlayerCameraLookAt(playerid, -2619.2512, 2201.6155, 50.1043);
		}
	}
	return 1;
}

function:ResetPlayer(playerid)
{ 
	playerLogin[playerid] = 0;
	PlayerInfo[playerid][pLoggedin] = false;
	PlayerInfo[playerid][pSkin] = 0;
	return 1;
}


function:LogPlayerIn(playerid)
{
	new rows;
	cache_get_row_count(rows);
    if(!rows)
    {

		SendClientMessageEx(playerid, color_pink, "[Register]{FFFFFF}: The user ({FD0000}%s{FFFFFF}) you're connected with is not a registered.", ReturnName(playerid));
		SendClientMessage(playerid, color_pink, "[Register]{FFFFFF}: Please register to continue.");
		
		ShowPlayerDialog(playerid, DIALOG_REGISTER, DIALOG_STYLE_PASSWORD, "{EE28EB}[F:DM] {FFFFFF}Welcome to Florida DM", "{FFFFFF}Welcome!\nSeems that you are new here! Please register with a password\n\n{FFFFFF}~ {EE28EB}Florida DM {FFFFFF}~", "Register", "Cancel");
		return 1;
    }

    SendClientMessageEx(playerid, color_cyan, "Welcome to Florida DM, %s {FFFFFF}["SCRIPT_VERSION"]", ReturnName(playerid));
    return ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "{EE28EB}[F:DM] {FFFFFF}Welcome to Florida DM","{FFFFFF}Welcome back to {EE28EB}Florida DM!\n{FFFFFF}Please enter your password to login\n\n{FFFFFF}~ {EE28EB}Florida DM {FFFFFF}~", "Login", "Cancel");
}

function:OnPlayerRegister(playerid)
{
	PlayerInfo[playerid][pDBID] = cache_insert_id();
	format(PlayerInfo[playerid][pAccName], 32, "%s", ReturnName(playerid));
	new thread[120];
	mysql_format(ourConnection, thread, sizeof(thread), "SELECT * FROM fdm_accounts WHERE acc_name = '%e'", ReturnName(playerid));
	mysql_tquery(ourConnection, thread, "Query_LoadAccount", "i", playerid);
	PlayerInfo[playerid][pLoggedin] = true;
	ShowModelSelectionMenu(playerid, joinskin, "Pick A Skin");
}

function:LoggingIn(playerid)
{
	if(!cache_num_rows())
	{
		playerLogin[playerid]++;

		if(playerLogin[playerid] == 3)
		{
		    SendClientMessage(playerid, color_purple, "[Kick]{FFFFFF}: You were kicked for bad password attempts.");
		    return KickEx(playerid);
		}

		return ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "{EE28EB}[F:DM] {FFFFFF}Welcome to Florida DM", "You entered the wrong password!\n\nYou have 3 chances to enter the correct password before you get kicked.\n\n{FFFFFF}~ {EE28EB}Florida DM {FFFFFF}~", "Login", "Cancel");
	}
	new thread[128];
    mysql_format(ourConnection, thread, sizeof(thread), "SELECT * FROM fdm_accounts WHERE acc_name = '%e'", ReturnName(playerid));
    mysql_tquery(ourConnection, thread, "Query_LoadAccount", "i", playerid);
   	new string[128];
    format(string, sizeof(string), "[Connection] {FFFFFF}Player {d615d6}%s {FFFFFF}has joined the server.",ReturnName(playerid));
    SendConnectMessage(color_pink, string);
	format(PlayerInfo[playerid][pAccName], 32, "%s", ReturnName(playerid));
	PlayerInfo[playerid][pLoggedin] = true;
	//SetPlayerWorldBounds(playerid, 20000.0000, -20000.0000, 20000.0000, -20000.0000);
	return 1;
}
function:Query_LoadAccount(playerid)
{
    cache_get_value_name_int(0, "pAdmin", PlayerInfo[playerid][pAdmin]);
    SendClientMessageEx(playerid, color_red, "Admin = %d",PlayerInfo[playerid][pAdmin]);
    cache_get_value_name_int(0, "acc_color", PlayerInfo[playerid][pColor]);
    cache_get_value_name_int(0, "acc_dbid", PlayerInfo[playerid][pDBID]);
    cache_get_value_name_int(0, "pMute", PlayerInfo[playerid][pMute]);
    cache_get_value_name_int(0, "pBan", PlayerInfo[playerid][pBan]);
	cache_get_value_name_int(0, "pDonator", PlayerInfo[playerid][pDonator]);
    cache_get_value_name(0, "pBanReason", PlayerInfo[playerid][pBanReason], 60);
    cache_get_value_name(0, "pBanAdmin", PlayerInfo[playerid][pBanAdmin], 60);
    cache_get_value_name_int(0, "acc_kills", PlayerInfo[playerid][pKills]);
    cache_get_value_name_int(0, "acc_money", PlayerInfo[playerid][pMoney]);
    cache_get_value_name_int(0, "acc_deaths", PlayerInfo[playerid][pDeaths]);
    cache_get_value_name_int(0, "acc_score", PlayerInfo[playerid][pScore]);
    cache_get_value_name_int(0, "Duel_kills", PlayerInfo[playerid][pDuelkills]);
    cache_get_value_name_int(0, "Arena_kills", PlayerInfo[playerid][pArenakills]);
    cache_get_value_name_int(0, "Gwar_kills", PlayerInfo[playerid][pGwarkills]);
    cache_get_value_name_int(0, "Handled_Tickets", pHandledtickets[playerid]);
    cache_get_value_name_int(0, "pWarns", PlayerInfo[playerid][pWarned]);
    cache_get_value_name_int(0, "pJails", PlayerInfo[playerid][pJailed]);
    cache_get_value_name_int(0, "Ajails", PlayerInfo[playerid][pAjails]);
    cache_get_value_name_int(0, "Awarns", PlayerInfo[playerid][pAwarns]);
    cache_get_value_name_int(0, "Abans", PlayerInfo[playerid][pAbans]);
	if(PlayerInfo[playerid][pBan] == 1)
    {
        SendClientMessage(playerid,  color_banned, "=============You are permanently banned============");
        SendClientMessage(playerid,  color_banned, "You are permanently banned.");
        SendClientMessageEx(playerid,color_banned, "Reason: %s", PlayerInfo[playerid][pBanReason]);
        SendClientMessageEx(playerid,color_banned, "Banned by: %s", PlayerInfo[playerid][pBanAdmin]); 
		SendClientMessage(playerid,  color_banned,"");
        SendClientMessage(playerid,  color_banned, "[!] You can appeal your ban on our discord (https://discord.gg/rdaTBA6rgS)");
        SendClientMessage(playerid,  color_banned, "[!] Please do not ban evade or you will not be unbanned.");
        ResetStatus(playerid);
        KickEx(playerid);
        return 1;
    }
    new insert[200];
    new CurrentIp[20];
    GetPlayerIp(playerid, CurrentIp, 20);
    mysql_format(ourConnection, insert, sizeof(insert), "UPDATE fdm_accounts SET Last_Ip = '%s' WHERE acc_dbid = %i", CurrentIp, PlayerInfo[playerid][pDBID]);
    mysql_tquery(ourConnection, insert);
	SetPlayerScore(playerid, PlayerInfo[playerid][pScore]);
	GivePlayerMoney(playerid, PlayerInfo[playerid][pMoney]);
	return 1;
}

function:ResetStatus(playerid)
{
	INL [playerid] = 1;
	PlayerInfo[playerid][pScore] = 0;
	PlayerInfo[playerid][pMoney] = 0;
	PlayerInfo[playerid][pDonator] = 0;
	PlayerInfo[playerid][pMute] = 0;
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
	publicoff[playerid] = false; // just in case
	togpm[playerid] = false;
	publicoff[playerid] = false;
	showconnect[playerid] = true;
	showhitmarker[playerid] = false;
	showlocation[playerid] = false;
    GDM [playerid] = 0;
	COPPOLICE [playerid] = 0;
	COPLEO [playerid] = 0;
	COPFBI [playerid] = 0;
	COPHRT [playerid] = 0;
	COPCRIM [playerid] = 0;
	ActiveSupport [playerid] = 0;
	PlayerInfo[playerid][pAdmin] = 0;
	HandlingAdminSupport[playerid] = 0;
	BeingHandledSupport[playerid] = 0;
	return 1;
}

//------------------Duel Functions -----------------------------//

forward ExpireDuel(playerid,pid);
public ExpireDuel(playerid,pid)
{
    SendClientMessage(pid,0x1DF6F6AA,"[Duel]{FFFFFF}: Duel Offer expired");
    SendClientMessage(playerid,0x1DF6F6AA,"[Duel]{FFFFFF}: You did not respond in time, Duel offer was expired");
    InvitedDuel[pid] = false;
    InvitedDuel[playerid] = false;
    IdDuel[playerid] = playerid;
    IdDuel[pid] = pid;
    return 1;
}

forward UnfreezeTimer(playerid);
public UnfreezeTimer(playerid)
{
	TogglePlayerControllable(playerid, 1);
    return 1;
}

forward GoDuel(playerid,pid);
public GoDuel(playerid,pid)
{
    //SetPlayerArmor
    //SetPlayerHealth

    //-> Functions for Count x1<-//
	SetPlayerPos(playerid, 1413.1495,-15.9198,1000.9246);
	SetPlayerPos(pid, 1367.6084,-17.7317,1000.9219);
	SetPlayerHealth(playerid, 100);
	SetPlayerHealth(pid, 100);
	SetPlayerArmour(playerid, 100);
	SetPlayerArmour(pid, 100);
	SetPlayerTeam(playerid, NO_TEAM);
	SetPlayerTeam(pid, NO_TEAM);
	SetPlayerInterior(playerid, 1);
	SetPlayerInterior(pid, 1);
	SetPlayerVirtualWorld(playerid, PlayerInfo[playerid][pDBID]);
	SetPlayerVirtualWorld(pid, PlayerInfo[playerid][pDBID]);
    TogglePlayerControllable(playerid,false);
    TogglePlayerControllable(pid,false);
    ExecuteCount(playerid,pid);
    return 1;
}

forward ExecuteCount(playerid,pid);
public ExecuteCount(playerid,pid)
{
    if (Counting > 0)
    {
        GameTextForPlayer(playerid,CountDueling[Counting-1], 2500, 3);
        GameTextForPlayer(pid,CountDueling[Counting-1], 1000, 3);
        Counting--;
        SetTimerEx("GoDuel",1000,false,"ii",playerid,pid);
    }
    else
    {
        GameTextForPlayer(playerid,"~>~~g~Go~w~Go~r~Go~b~Go~<~", 2500, 3);
        GameTextForPlayer(pid,"~>~~g~Go~w~Go~r~Go~b~Go~<~", 2500, 3);
        Counting = 5;
        TogglePlayerControllable(playerid,true);
        TogglePlayerControllable(pid,true);
        ResetPlayerWeapons(playerid);
        ResetPlayerWeapons(pid);
        GivePlayerWeapon(playerid, Gun[pid], 3000);
        GivePlayerWeapon(pid, Gun[pid], 3000);
    }
    return 1;
}

//----------------- Cars Functions -----------------------------//
forward Vehicledeath(vehicleid);
public Vehicledeath(vehicleid)
{
	SetVehicleToRespawn(vehicleid);
}

forward Vehiclesrespawn();
public Vehiclesrespawn()
{
	RespawnBallasCars();
	RespawnGroveCars();
	RespawnVagosCars();
	RespawnVarriosCars();
	SetVehicleToRespawn(gwar_grovevip[0]);
	SetVehicleToRespawn(gwar_ballasvip[0]);
	SetVehicleToRespawn(gwar_vagosvip[0]);
	SetVehicleToRespawn(gwar_azcetavip[0]);
	return 1;
}

function:RespawnVagosCars()
{
	for(new i = 0; i < sizeof(gwar_vagos); i++)
    {
        if(!IsVehicleOccupied(gwar_vagos[i]))
        {
	    	SetVehicleToRespawn(gwar_vagos[i]);
		}

    } 
	return 1;
}

function:RespawnGroveCars()
{
	for(new i = 0; i < sizeof(gwar_grove); i++)
    {
        if(!IsVehicleOccupied(gwar_grove[i]))
        {
	    	SetVehicleToRespawn(gwar_grove[i]);
		}
    } 
	return 1;
}

function:RespawnBallasCars()
{
	for(new i = 0; i < sizeof(gwar_ballas); i++)
    {  
        if(!IsVehicleOccupied(gwar_ballas[i]))
        {
	    	SetVehicleToRespawn(gwar_ballas[i]);
		}
    } 
	return 1;
}

function:RespawnVarriosCars()
{
	for(new i = 0; i < sizeof(gwar_azceta); i++)
    {
        if(!IsVehicleOccupied(gwar_azceta[i]))
        {
	    	SetVehicleToRespawn(gwar_azceta[i]);
		}
    } 
	return 1;
}

function:IsBallasCar(vehicleid)
{
    for(new i = 0; i < sizeof(gwar_ballas); i++)
        if(gwar_ballas[i] == vehicleid)
            return 1;
    return 0;
}

function:IsGroveCar(vehicleid)
{
    for(new i = 0; i < sizeof(gwar_grove); i++)
        if(gwar_grove[i] == vehicleid)
            return 1;
    return 0;
}

function:IsVariosCar(vehicleid)
{
    for(new i = 0; i < sizeof(gwar_azceta); i++)
        if(gwar_azceta[i] == vehicleid)
            return 1;
    return 0;
}
function:IsVagosCar(vehicleid)
{
    for(new i = 0; i < sizeof(gwar_vagos); i++)
        if(gwar_vagos[i] == vehicleid)
            return 1;
    return 0;
}

//---------------- Text Draw Functions -------------------------//

forward HITTD(issuerid);
public HITTD(issuerid)
{
    TextDrawHideForPlayer(issuerid, HitMarker);
    KillTimer(hittimer);
    return 1;
}

forward UpdateStatsTD(playerid);
public UpdateStatsTD(playerid)
{
//		new string[255];
//		format(string, sizeof(string), "~b~~h~Score:~w~ %s~n~~b~~h~Kills:~w~ %s~n~~b~~h~Deaths:~w~ %s~n~~b~~h~Mode:~w~ %s", 
//		PlayerInfo[playerid][pScore],PlayerInfo[playerid][pKills],PlayerInfo[playerid][pDeaths],GetPlayerMode(playerid));
		//PlayerTextDrawSetString(playerid,StatsTD2, string);

		//TD Name:
		new stringName[255];
		format(stringName, sizeof(stringName), "%s",PlayerInfo[playerid][pAccName]);
		PlayerTextDrawSetString(playerid,StatsNameTD[playerid], stringName);
/*
		//TD Score:
		new stringScore[255];
		format(stringScore, sizeof(stringScore), "~b~Score: ~w~%s",PlayerInfo[playerid][pScore]);
		PlayerTextDrawSetString(playerid,StatsScoreTD[playerid], stringScore);
*/

		//TD K/D:
		new stringKD[255];              
		format(stringKD, sizeof(stringKD), "~r~K:D ~w~%i/%i",PlayerInfo[playerid][pKills],PlayerInfo[playerid][pDeaths]);
		PlayerTextDrawSetString(playerid,StatsKDTD[playerid], stringKD);

		//TD Mode:
		new stringMode[255];
		format(stringMode, sizeof(stringMode), "~p~Mode: ~w~%s",GetPlayerMode(playerid));
		PlayerTextDrawSetString(playerid,StatsModeTD[playerid], stringMode);


		return 1;
}
forward RemoveInfoTD(playerid); 
public RemoveInfoTD(playerid)
{
	TextDrawHideForPlayer(playerid, Textdraw0);
	TextDrawHideForPlayer(playerid, Textdraw1);
	TextDrawHideForPlayer(playerid, Textdraw2);
	TextDrawHideForPlayer(playerid, Textdraw3);
	TextDrawHideForPlayer(playerid, Textdraw4);

    //cop chase cop
	TextDrawHideForPlayer(playerid, ccc_Textdraw5);
	TextDrawHideForPlayer(playerid, ccc_Textdraw6);
	TextDrawHideForPlayer(playerid, ccc_Textdraw7);
	TextDrawHideForPlayer(playerid, ccc_Textdraw8);

    //cop chase crim

    //gang war sprunk
	TextDrawHideForPlayer(playerid, sprunkbk);
	TextDrawHideForPlayer(playerid, sprunkred);
	TextDrawHideForPlayer(playerid, sprunkh);
	TextDrawHideForPlayer(playerid, sprunkval);
	TextDrawHideForPlayer(playerid, sprunkown);
	TextDrawHideForPlayer(playerid, sprunknme);
	TextDrawHideForPlayer(playerid, sprunktype);
    return 1;
}






//---------------- Anti Cheat Function -------------------------//

function:SendReasonCode(playerid, type, code)
{
	if(code == 0){
		new str[300];
		format(str, sizeof(str), "{f50a0e}[Anti-Cheat] {0aedf5}The player: {f0fc03}%s {0aedf5}is using cheats: {f50a0e}Air-Break on foot", ReturnName(playerid));
		new stringb[300];
		format(stringb, sizeof(stringb), "```[Anti-Cheat] The player %s is using cheats: Air-Break on foot```", ReturnName(playerid));
		SendAdminMessage(-1, str);
		DCC_SendChannelMessage(g_AntiCheatChannel, stringb);
		return 1;
	}
	if(code == 1){
		new str[300];
		format(str, sizeof(str), "{f50a0e}[Anti-Cheat] {0aedf5}The player: {f0fc03}%s {0aedf5}is using cheats: {f50a0e}Air-Break in Vehicle", ReturnName(playerid));
		SendAdminMessage(-1, str);
		new stringb[300];
		format(stringb, sizeof(stringb), "```[Anti-Cheat] The player %s is using cheats: Air-Break in Vehicle```", ReturnName(playerid));
		DCC_SendChannelMessage(g_AntiCheatChannel, stringb);

		return 1;
	}
	if(code == 2){
		new str[300];
		format(str, sizeof(str), "{f50a0e}[Anti-Cheat] {0aedf5}The player: {f0fc03}%s {0aedf5}is using cheats: {f50a0e}teleport hack (onfoot) ", ReturnName(playerid));
		SendAdminMessage(-1, str);
		new stringb[300];
		format(stringb, sizeof(stringb), "```[Anti-Cheat] The player %s is using cheats: Teleport hack on foot```", ReturnName(playerid));
		DCC_SendChannelMessage(g_AntiCheatChannel, stringb);
		return 1;
	}
	if(code == 3){
		new str[300];
		format(str, sizeof(str), "{f50a0e}[Anti-Cheat] {0aedf5}The player: {f0fc03}%s {0aedf5}is using cheats: {f50a0e}teleport hack (in vehicle)", ReturnName(playerid));
		SendAdminMessage(-1, str);
		new stringb[300];
		format(stringb, sizeof(stringb), "```[Anti-Cheat] The player %s is using cheats: Air-Break in Vehicle```", ReturnName(playerid));
		DCC_SendChannelMessage(g_AntiCheatChannel, stringb);
		return 1;
	}
	if(code == 4){
		new str[300];
		format(str, sizeof(str), "{f50a0e}[Anti-Cheat] {0aedf5}The player: {f0fc03}%s {0aedf5}is using cheats: {f50a0e}teleport hack (into/between vehicles)", ReturnName(playerid));
		SendAdminMessage(-1, str);
		new stringb[300];
		format(stringb, sizeof(stringb), "```[Anti-Cheat] The player %s is using cheats: Teleport hack between vehciles```", ReturnName(playerid));
		DCC_SendChannelMessage(g_AntiCheatChannel, stringb);
		return 1;
	}
	if(code == 5){
		new str[300];
		format(str, sizeof(str), "{f50a0e}[Anti-Cheat] {0aedf5}The player: {f0fc03}%s {0aedf5}is using cheats: {f50a0e}teleport hack (vehicle to player)", ReturnName(playerid));
		SendAdminMessage(-1, str);
		new stringb[300];
		format(stringb, sizeof(stringb), "```[Anti-Cheat] The player %s is using cheats: Teleport hack Vehicle to player```", ReturnName(playerid));
		DCC_SendChannelMessage(g_AntiCheatChannel, stringb);
		return 1;
	}
	if(code == 6){
		new str[300];
		format(str, sizeof(str), "{f50a0e}[Anti-Cheat] {0aedf5}The player: {f0fc03}%s {0aedf5}is using cheats: {f50a0e}teleport hack (pickups)", ReturnName(playerid));
		SendAdminMessage(-1, str);
		new stringb[300];
		format(stringb, sizeof(stringb), "```[Anti-Cheat] The player %s is using cheats: Teleport hack (pickups)```", ReturnName(playerid));
		DCC_SendChannelMessage(g_AntiCheatChannel, stringb);
		return 1;
	}
	if(code == 7){
		new str[300];
		format(str, sizeof(str), "{f50a0e}[Anti-Cheat] {0aedf5}The player: {f0fc03}%s {0aedf5}is using cheats: {f50a0e}FlyHack (onfoot)", ReturnName(playerid));
		SendAdminMessage(-1, str);
		new stringb[300];
		format(stringb, sizeof(stringb), "```[Anti-Cheat] The player %s is using cheats: Fly hack on foot```", ReturnName(playerid));
		DCC_SendChannelMessage(g_AntiCheatChannel, stringb);
		return 1;
	}
	if(code == 8){
		new str[300];
		format(str, sizeof(str), "{f50a0e}[Anti-Cheat] {0aedf5}The player: {f0fc03}%s {0aedf5}is using cheats: {f50a0e}FlyHack (in vehicle)", ReturnName(playerid));
		SendAdminMessage(-1, str);
		new stringb[300];
		format(stringb, sizeof(stringb), "```[Anti-Cheat] The player %s is using cheats: Fly hack in vehicle```", ReturnName(playerid));
		DCC_SendChannelMessage(g_AntiCheatChannel, stringb);
		return 1;
	}
	if(code == 9){
		new str[300];
		format(str, sizeof(str), "{f50a0e}[Anti-Cheat] {0aedf5}The player: {f0fc03}%s {0aedf5}is using cheats: {f50a0e}SpeedHack (onfoot)", ReturnName(playerid));
		SendAdminMessage(-1, str);
		new stringb[300];
		format(stringb, sizeof(stringb), "```[Anti-Cheat] The player %s is using cheats: SpeedHack on foot```", ReturnName(playerid));
		DCC_SendChannelMessage(g_AntiCheatChannel, stringb);
		return 1;
	}
	if(code == 10){
		new str[300];
		format(str, sizeof(str), "{f50a0e}[Anti-Cheat] {0aedf5}The player: {f0fc03}%s {0aedf5}is using cheats: {f50a0e}SpeedHack (in vehicle)", ReturnName(playerid));
		SendAdminMessage(-1, str);
		new stringb[300];
		format(stringb, sizeof(stringb), "```[Anti-Cheat] The player %s is using cheats: SpeedHack in vehicle```", ReturnName(playerid));
		DCC_SendChannelMessage(g_AntiCheatChannel, stringb);
		return 1;
	}
	if(code == 11){
		new str[300];
		format(str, sizeof(str), "{f50a0e}[Anti-Cheat] {0aedf5}The player: {f0fc03}%s {0aedf5}is using cheats: {f50a0e}Health hack (in vehicle)", ReturnName(playerid));
		SendAdminMessage(-1, str);
		new stringb[300];
		format(stringb, sizeof(stringb), "```[Anti-Cheat] The player %s is using cheats: Health hack in vehicle```", ReturnName(playerid));
		DCC_SendChannelMessage(g_AntiCheatChannel, stringb);
		return 1;
	}
	if(code == 12){
		new str[300];
		format(str, sizeof(str), "{f50a0e}[Anti-Cheat] {0aedf5}The player: {f0fc03}%s {0aedf5}is using cheats: {f50a0e}Health hack (onfoot)", ReturnName(playerid));
		SendAdminMessage(-1, str);
		new stringb[300];
		format(stringb, sizeof(stringb), "```[Anti-Cheat] The player %s is using cheats: Health hack on foot```", ReturnName(playerid));
		DCC_SendChannelMessage(g_AntiCheatChannel, stringb);
		return 1;
	}
	if(code == 13){
		new str[300];
		format(str, sizeof(str), "{f50a0e}[Anti-Cheat] {0aedf5}The player: {f0fc03}%s {0aedf5}is using cheats: {f50a0e}Armour hack", ReturnName(playerid));
		SendAdminMessage(-1, str);
		new stringb[300];
		format(stringb, sizeof(stringb), "```[Anti-Cheat] The player %s is using cheats: Armour hack```", ReturnName(playerid));
		DCC_SendChannelMessage(g_AntiCheatChannel, stringb);
		return 1;
	}
	if(code == 14){
		new str[300];
		format(str, sizeof(str), "{f50a0e}[Anti-Cheat] {0aedf5}The player: {f0fc03}%s {0aedf5}is using cheats: {f50a0e}Money hack", ReturnName(playerid));
		SendAdminMessage(-1, str);
		new stringb[300];
		format(stringb, sizeof(stringb), "```[Anti-Cheat] The player %s is using cheats: Money hack```", ReturnName(playerid));
		DCC_SendChannelMessage(g_AntiCheatChannel, stringb);
		return 1;
	}
	if(code == 15){
		if(JustSpawned[playerid] == true){
			return 1;
		}
		new str[300];
		format(str, sizeof(str), "{f50a0e}[Anti-Cheat] {0aedf5}The player: {f0fc03}%s {0aedf5}is using cheats: {f50a0e}Weapon hack", ReturnName(playerid));
		SendAdminMessage(-1, str);
		new stringb[300];
		format(stringb, sizeof(stringb), "```[Anti-Cheat] The player %s is using cheats: Weapon hack```", ReturnName(playerid));
		DCC_SendChannelMessage(g_AntiCheatChannel, stringb);
		return 1;
	}
	if(code == 16){
		if(JustSpawned[playerid] == true){
			return 1;
		}
		new str[300];
		format(str, sizeof(str), "{f50a0e}[Anti-Cheat] {0aedf5}The player: {f0fc03}%s {0aedf5}is using cheats: {f50a0e}Ammo hack (add)", ReturnName(playerid));
		SendAdminMessage(-1, str);
//		new stringb[300];
//		format(stringb, sizeof(stringb), "```[Anti-Cheat] The player %s is using cheats: Ammo hack (add)```", ReturnName(playerid));
//		DCC_SendChannelMessage(g_AntiCheatChannel, stringb);
		return 1;
	}
	if(code == 17){
		if(JustSpawned[playerid] == true){
			return 1;
		}
		new str[300];
		format(str, sizeof(str), "{f50a0e}[Anti-Cheat] {0aedf5}The player: {f0fc03}%s {0aedf5}is using cheats: {f50a0e}Ammo hack (infinite)", ReturnName(playerid));
		SendAdminMessage(-1, str);
		new stringb[300];
		format(stringb, sizeof(stringb), "```[Anti-Cheat] The player %s is using cheats: Ammo hack (infinite)```", ReturnName(playerid));
		DCC_SendChannelMessage(g_AntiCheatChannel, stringb);
		return 1;
	}
	if(code == 18){
		new str[300];
		format(str, sizeof(str), "{f50a0e}[Anti-Cheat] {0aedf5}The player: {f0fc03}%s {0aedf5}is using cheats: {f50a0e}Special actions hack", ReturnName(playerid));
		SendAdminMessage(-1, str);
		new stringb[300];
		format(stringb, sizeof(stringb), "```[Anti-Cheat] The player %s is using cheats: Special Actions hack```", ReturnName(playerid));
		DCC_SendChannelMessage(g_AntiCheatChannel, stringb);
		return 1;
	}
	if(code == 19){
		new str[300];
		format(str, sizeof(str), "{f50a0e}[Anti-Cheat] {0aedf5}The player: {f0fc03}%s {0aedf5}is using cheats: {f50a0e}GodMode from bullets (onfoot)", ReturnName(playerid));
		SendAdminMessage(-1, str);
		new stringb[300];
		format(stringb, sizeof(stringb), "```[Anti-Cheat] The player %s is using cheats: GodMode from bullets on foot```", ReturnName(playerid));
		DCC_SendChannelMessage(g_AntiCheatChannel, stringb);
		return 1;
	}
	if(code == 20){
		new str[300];
		format(str, sizeof(str), "{f50a0e}[Anti-Cheat] {0aedf5}The player: {f0fc03}%s {0aedf5}is using cheats: {f50a0e}GodMode from bullets", ReturnName(playerid));
		SendAdminMessage(-1, str);
		new stringb[300];
		format(stringb, sizeof(stringb), "```[Anti-Cheat] The player %s is using cheats: GodMode from bullets```", ReturnName(playerid));
		DCC_SendChannelMessage(g_AntiCheatChannel, stringb);
		return 1;
	}
	if(code == 21){
		new str[300];
		format(str, sizeof(str), "{f50a0e}[Anti-Cheat] {0aedf5}The player: {f0fc03}%s {0aedf5}is using cheats: {f50a0e}Invisible hack", ReturnName(playerid));
		SendAdminMessage(-1, str);
		new stringb[300];
		format(stringb, sizeof(stringb), "```[Anti-Cheat] The player %s is using cheats: Invisible hack```", ReturnName(playerid));
		DCC_SendChannelMessage(g_AntiCheatChannel, stringb);
		return 1;
	}
	if(code == 22){
		new str[300];
		format(str, sizeof(str), "{f50a0e}[Anti-Cheat] {0aedf5}The player: {f0fc03}%s {0aedf5}is using cheats: {f50a0e}lagcomp-spoof", ReturnName(playerid));
		SendAdminMessage(-1, str);
		new stringb[300];
		format(stringb, sizeof(stringb), "```[Anti-Cheat] The player %s is using cheats: lagcomp-spoof```", ReturnName(playerid));
		DCC_SendChannelMessage(g_AntiCheatChannel, stringb);
		return 1;
	}
	if(code == 23){
		new str[300];
		format(str, sizeof(str), "{f50a0e}[Anti-Cheat] {0aedf5}The player: {f0fc03}%s {0aedf5}is using cheats: {f50a0e}Tuning hack", ReturnName(playerid));
		SendAdminMessage(-1, str);
		new stringb[300];
		format(stringb, sizeof(stringb), "```[Anti-Cheat] The player %s is using cheats: Tuning hack```", ReturnName(playerid));
		DCC_SendChannelMessage(g_AntiCheatChannel, stringb);
		return 1;
	}
	if(code == 24){
		new str[300];
		format(str, sizeof(str), "{f50a0e}[Anti-Cheat] {0aedf5}The player: {f0fc03}%s {0aedf5}is using cheats: {f50a0e}Parkour mod", ReturnName(playerid));
		SendAdminMessage(-1, str);
		new stringb[300];
		format(stringb, sizeof(stringb), "```[Anti-Cheat] The player %s is using cheats: Parkour mod```", ReturnName(playerid));
		DCC_SendChannelMessage(g_AntiCheatChannel, stringb);
		return 1;
	}
	if(code == 25){
		new str[300];
		format(str, sizeof(str), "{f50a0e}[Anti-Cheat] {0aedf5}The player: {f0fc03}%s {0aedf5}is using cheats: {f50a0e}Quick turn", ReturnName(playerid));
		SendAdminMessage(-1, str);
		new stringb[300];
		format(stringb, sizeof(stringb), "```[Anti-Cheat] The player %s is using cheats: Quick Turn```", ReturnName(playerid));
		DCC_SendChannelMessage(g_AntiCheatChannel, stringb);
		return 1;
	}
	if(code == 26){
		new str[300];
		format(str, sizeof(str), "{f50a0e}[Anti-Cheat] {0aedf5}The player: {f0fc03}%s {0aedf5}is using cheats: {f50a0e}Rapid fire", ReturnName(playerid));
		SendAdminMessage(-1, str);
		new stringb[300];
		format(stringb, sizeof(stringb), "```[Anti-Cheat] The player %s is using cheats: Rapid fire```", ReturnName(playerid));
		DCC_SendChannelMessage(g_AntiCheatChannel, stringb);
		return 1;
	}
	if(code == 27){
		new str[300];
		format(str, sizeof(str), "{f50a0e}[Anti-Cheat] {0aedf5}The player: {f0fc03}%s {0aedf5}is using cheats: {f50a0e}FakeSpawn", ReturnName(playerid));
		SendAdminMessage(-1, str);
		new stringb[300];
		format(stringb, sizeof(stringb), "```[Anti-Cheat] The player %s is using cheats: Fake Spawn```", ReturnName(playerid));
		DCC_SendChannelMessage(g_AntiCheatChannel, stringb);
		return 1;
	}
	if(code == 28){
		new str[300];
		format(str, sizeof(str), "{f50a0e}[Anti-Cheat] {0aedf5}The player: {f0fc03}%s {0aedf5}is using cheats: {f50a0e}FakeKill", ReturnName(playerid));
		SendAdminMessage(-1, str);
		new stringb[300];
		format(stringb, sizeof(stringb), "```[Anti-Cheat] The player %s is using cheats: Fake kill```", ReturnName(playerid));
		DCC_SendChannelMessage(g_AntiCheatChannel, stringb);
		return 1;
	}
	if(code == 29){
		new str[300];
		format(str, sizeof(str), "{f50a0e}[Anti-Cheat] {0aedf5}The player: {f0fc03}%s {0aedf5}is using cheats: {f50a0e}Pro Aim", ReturnName(playerid));
		SendAdminMessage(-1, str);
		new stringb[300];
		format(stringb, sizeof(stringb), "```[Anti-Cheat] The player %s is using cheats: Pro aim```", ReturnName(playerid));
		DCC_SendChannelMessage(g_AntiCheatChannel, stringb);
		return 1;
	}
	if(code == 30){
		new str[300];
		format(str, sizeof(str), "{f50a0e}[Anti-Cheat] {0aedf5}The player: {f0fc03}%s {0aedf5}is using cheats: {f50a0e}CJ run", ReturnName(playerid));
		SendAdminMessage(-1, str);
		new stringb[300];
		format(stringb, sizeof(stringb), "```[Anti-Cheat] The player %s is using cheats: Cj run```", ReturnName(playerid));
		DCC_SendChannelMessage(g_AntiCheatChannel, stringb);
		return 1;
	}
	if(code == 31){
		new str[300];
		format(str, sizeof(str), "{f50a0e}[Anti-Cheat] {0aedf5}The player: {f0fc03}%s {0aedf5}is using cheats: {f50a0e}CarShot", ReturnName(playerid));
		SendAdminMessage(-1, str);
		new stringb[300];
		format(stringb, sizeof(stringb), "```[Anti-Cheat] The player %s is using cheats: CarShot```", ReturnName(playerid));
		DCC_SendChannelMessage(g_AntiCheatChannel, stringb);
		return 1;
	}
	if(code == 32){
		new str[300];
		format(str, sizeof(str), "{f50a0e}[Anti-Cheat] {0aedf5}The player: {f0fc03}%s {0aedf5}is using cheats: {f50a0e}CarJack", ReturnName(playerid));
		SendAdminMessage(-1, str);
		new stringb[300];
		format(stringb, sizeof(stringb), "```[Anti-Cheat] The player %s is using cheats: CarJack```", ReturnName(playerid));
		DCC_SendChannelMessage(g_AntiCheatChannel, stringb);
		return 1;
	}
	if(code == 33){
		new str[300];
		format(str, sizeof(str), "{f50a0e}[Anti-Cheat] {0aedf5}The player: {f0fc03}%s {0aedf5}is using cheats: {f50a0e}UnFreeze", ReturnName(playerid));
		SendAdminMessage(-1, str);
		new stringb[300];
		format(stringb, sizeof(stringb), "```[Anti-Cheat] The player %s is using cheats: UnFreeze```", ReturnName(playerid));
		DCC_SendChannelMessage(g_AntiCheatChannel, stringb);
		return 1;
	}
	if(code == 34){
		new str[300];
		format(str, sizeof(str), "{f50a0e}[Anti-Cheat] {0aedf5}The player: {f0fc03}%s {0aedf5}is using cheats: {f50a0e}AFK Ghost", ReturnName(playerid));
		SendAdminMessage(-1, str);
		new stringb[300];
		format(stringb, sizeof(stringb), "```[Anti-Cheat] The player %s is using cheats: AFK Ghost```", ReturnName(playerid));
		DCC_SendChannelMessage(g_AntiCheatChannel, stringb);
		return 1;
	}
	if(code == 35){
		new str[300];
		format(str, sizeof(str), "{f50a0e}[Anti-Cheat] {0aedf5}The player: {f0fc03}%s {0aedf5}is using cheats: {f50a0e}Full Aiming", ReturnName(playerid));
		SendAdminMessage(-1, str);
		new stringb[300];
		format(stringb, sizeof(stringb), "```[Anti-Cheat] The player %s is using cheats: Full Aiming```", ReturnName(playerid));
		DCC_SendChannelMessage(g_AntiCheatChannel, stringb);
		return 1;
	}
	if(code == 36){
		new str[300];
		format(str, sizeof(str), "{f50a0e}[Anti-Cheat] {0aedf5}The player: {f0fc03}%s {0aedf5}is using cheats: {f50a0e}Fake NPC", ReturnName(playerid));
		SendAdminMessage(-1, str);
		new stringb[300];
		format(stringb, sizeof(stringb), "```[Anti-Cheat] The player %s is using cheats: Fake NPC```", ReturnName(playerid));
		DCC_SendChannelMessage(g_AntiCheatChannel, stringb);
		return 1;
	}
	if(code == 37){
		new str[300];
		format(str, sizeof(str), "{f50a0e}[Anti-Cheat] {0aedf5}The player: {f0fc03}%s {0aedf5}is using cheats: {f50a0e}Reconnect", ReturnName(playerid));
		SendAdminMessage(-1, str);
		new stringb[300];
		format(stringb, sizeof(stringb), "```[Anti-Cheat] The player %s is using cheats: Reconnect```", ReturnName(playerid));
		DCC_SendChannelMessage(g_AntiCheatChannel, stringb);
		return 1;
	}
	if(code == 38){
		new str[300];
		format(str, sizeof(str), "{f50a0e}[Anti-Cheat] {0aedf5}The player: {f0fc03}%s {0aedf5}is using cheats: {f50a0e}High ping", ReturnName(playerid));
		SendAdminMessage(-1, str);
		new stringb[300];
		format(stringb, sizeof(stringb), "```[Anti-Cheat] The player %s is using cheats: High Ping```", ReturnName(playerid));
		DCC_SendChannelMessage(g_AntiCheatChannel, stringb);
		KickEx(playerid);
		SendClientMessage(playerid, color_banned, "You have been kicked for High ping. Fix your net and join the server.");
		return 1;
	}
	if(code == 39){
		new str[300];
		format(str, sizeof(str), "{f50a0e}[Anti-Cheat] {0aedf5}The player: {f0fc03}%s {0aedf5}is using cheats: {f50a0e}Dialog hack", ReturnName(playerid));
		SendAdminMessage(-1, str);
		new stringb[300];
		format(stringb, sizeof(stringb), "```[Anti-Cheat] The player %s is using cheats: Dialog Hack```", ReturnName(playerid));
		DCC_SendChannelMessage(g_AntiCheatChannel, stringb);
		return 1;
	}
	if(code == 40){
		new str[300];
		format(str, sizeof(str), "{f50a0e}[Anti-Cheat] {0aedf5}The player: {f0fc03}%s {0aedf5}is using cheats: {f50a0e}Protection from sandbox", ReturnName(playerid));
		SendAdminMessage(-1, str);
		new stringb[300];
		format(stringb, sizeof(stringb), "```[Anti-Cheat] The player %s is using cheats: Protection from sandbox```", ReturnName(playerid));
		DCC_SendChannelMessage(g_AntiCheatChannel, stringb);
		return 1;
	}
	if(code == 41){
		new str[300];
		format(str, sizeof(str), "{f50a0e}[Anti-Cheat] {0aedf5}The player: {f0fc03}%s {0aedf5}is using cheats: {f50a0e}Protection from invalid version", ReturnName(playerid));
		SendAdminMessage(-1, str);
		new stringb[300];
		format(stringb, sizeof(stringb), "```[Anti-Cheat] The player %s is using cheats: Protection from invalid version```", ReturnName(playerid));
		DCC_SendChannelMessage(g_AntiCheatChannel, stringb);
		return 1;
	}
	if(code == 42){
		new str[300];
		format(str, sizeof(str), "{f50a0e}[Anti-Cheat] {0aedf5}The player: {f0fc03}%s {0aedf5}is using cheats: {f50a0e}Rcon hack", ReturnName(playerid));
		SendAdminMessage(-1, str);
		new stringb[300];
		format(stringb, sizeof(stringb), "```[Anti-Cheat] The player %s is using cheats: Rcon hack```", ReturnName(playerid));
		DCC_SendChannelMessage(g_AntiCheatChannel, stringb);
		return 1;
	}
	if(code == 43){
		new str[300];
		format(str, sizeof(str), "{f50a0e}[Anti-Cheat] {0aedf5}The player: {f0fc03}%s {0aedf5}is using cheats: {f50a0e}Tuning crasher", ReturnName(playerid));
		SendAdminMessage(-1, str);
		new stringb[300];
		format(stringb, sizeof(stringb), "```[Anti-Cheat] The player %s is using cheats: Tuning crasher```", ReturnName(playerid));
		DCC_SendChannelMessage(g_AntiCheatChannel, stringb);
		return 1;
	}
	if(code == 44){
		new str[300];
		format(str, sizeof(str), "{f50a0e}[Anti-Cheat] {0aedf5}The player: {f0fc03}%s {0aedf5}is using cheats: {f50a0e}Invalid seat crasher", ReturnName(playerid));
		SendAdminMessage(-1, str);
		new stringb[300];
		format(stringb, sizeof(stringb), "```[Anti-Cheat] The player %s is using cheats: Invalid Seat crasher```", ReturnName(playerid));
		DCC_SendChannelMessage(g_AntiCheatChannel, stringb);
		return 1;
	}
	if(code == 45){
		new str[300];
		format(str, sizeof(str), "{f50a0e}[Anti-Cheat] {0aedf5}The player: {f0fc03}%s {0aedf5}is using cheats: {f50a0e}Dialog crasher", ReturnName(playerid));
		SendAdminMessage(-1, str);
		new stringb[300];
		format(stringb, sizeof(stringb), "```[Anti-Cheat] The player %s is using cheats: Dialog crasher```", ReturnName(playerid));
		DCC_SendChannelMessage(g_AntiCheatChannel, stringb);
		return 1;
	}
	if(code == 46){
		new str[300];
		format(str, sizeof(str), "{f50a0e}[Anti-Cheat] {0aedf5}The player: {f0fc03}%s {0aedf5}is using cheats: {f50a0e}Attached object crasher", ReturnName(playerid));
		SendAdminMessage(-1, str);
		new stringb[300];
		format(stringb, sizeof(stringb), "```[Anti-Cheat] The player %s is using cheats: Attached object crasher```", ReturnName(playerid));
		DCC_SendChannelMessage(g_AntiCheatChannel, stringb);
		return 1;
	}
	if(code == 47){
		new str[300];
		format(str, sizeof(str), "{f50a0e}[Anti-Cheat] {0aedf5}The player: {f0fc03}%s {0aedf5}is using cheats: {f50a0e}Weapon Crasher", ReturnName(playerid));
		SendAdminMessage(-1, str);
		new stringb[300];
		format(stringb, sizeof(stringb), "```[Anti-Cheat] The player %s is using cheats: Weapon crasher```", ReturnName(playerid));
		DCC_SendChannelMessage(g_AntiCheatChannel, stringb);
		return 1;
	}
	if(code == 48){
		new str[300];
		format(str, sizeof(str), "{f50a0e}[Anti-Cheat] {0aedf5}The player: {f0fc03}%s {0aedf5}is using cheats: {f50a0e}Protection from connection flood in one slot", ReturnName(playerid));
		SendAdminMessage(-1, str);
		new stringb[300];
		format(stringb, sizeof(stringb), "```[Anti-Cheat] The player %s is using cheats: Protection from connection flood in one slot``", ReturnName(playerid));
		DCC_SendChannelMessage(g_AntiCheatChannel, stringb);
		return 1;
	}
	if(code == 49){
		new str[300];
		format(str, sizeof(str), "{f50a0e}[Anti-Cheat] {0aedf5}The player: {f0fc03}%s {0aedf5}is using cheats: {f50a0e}callback functions flood", ReturnName(playerid));
		SendAdminMessage(-1, str);
		new stringb[300];
		format(stringb, sizeof(stringb), "```[Anti-Cheat] The player %s is using cheats: Callback functions flood```", ReturnName(playerid));
		DCC_SendChannelMessage(g_AntiCheatChannel, stringb);
		return 1;
	}
	if(code == 50){
		new str[300];
		format(str, sizeof(str), "{f50a0e}[Anti-Cheat] {0aedf5}The player: {f0fc03}%s {0aedf5}is using cheats: {f50a0e}flood by seat changing", ReturnName(playerid));
		SendAdminMessage(-1, str);
		new stringb[300];
		format(stringb, sizeof(stringb), "```[Anti-Cheat] The player %s is using cheats: Flood seat changing```", ReturnName(playerid));
		DCC_SendChannelMessage(g_AntiCheatChannel, stringb);
		return 1;
	}
	if(code == 51){
		new str[300];
		format(str, sizeof(str), "{f50a0e}[Anti-Cheat] {0aedf5}The player: {f0fc03}%s {0aedf5}is using cheats: {f50a0e}DoS", ReturnName(playerid));
		SendAdminMessage(-1, str);
		new stringb[300];
		format(stringb, sizeof(stringb), "```[Anti-Cheat] The player %s is using cheats: Dos```", ReturnName(playerid));
		DCC_SendChannelMessage(g_AntiCheatChannel, stringb);
		return 1;
	}
	if(code == 52){
		new str[300];
		format(str, sizeof(str), "{f50a0e}[Anti-Cheat] {0aedf5}The player: {f0fc03}%s {0aedf5}is using cheats: {f50a0e}NOPs", ReturnName(playerid));
		SendAdminMessage(-1, str);
		new stringb[300];
		format(stringb, sizeof(stringb), "```[Anti-Cheat] The player %s is using cheats: NOPs```", ReturnName(playerid));
		DCC_SendChannelMessage(g_AntiCheatChannel, stringb);
		return 1;
	}
	return 1;
}


