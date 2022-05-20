  
/*
------------------------------------------------
|                                              |
|   F L O R I D A   -   D E A T H M A T C H    | 
|                                              |
|       ~  LIL$MOON x REALDIEGOPOPTART  ~	   |
|                                              |
------------------------------------------------
*/
#include <a_samp>
#define SSCANF_NO_NICE_FEATURES
#include <crashdetect>
#include <sscanf2>
#include <zcmd>
#include <a_mysql>
#include <mSelection>
#include <streamer>
#include <foreach>
#include <discord-connector>
#include <afk>
#include <discord-cmd>
#include <progress2>

//------------------------MYSQL CONNECTION--------------------------------------//
new MySQL:ourConnection;


#define SQL_HOSTNAME  "127.0.0.1"

/*
#define SQL_DATABASE  "server_970_a7a"
#define SQL_USERNAME  "server_970"
#define SQL_PASSWORD  "l0pma281rx"
*/


#define SQL_DATABASE  "fdm"
#define SQL_USERNAME  "root"
#define SQL_PASSWORD  ""
//------------------------MYSQL CONNECTION--------------------------------------//

#include "./modu/defines.pwn"
#include "./modu/anticheat/core.pwn"
#include "./modu/anticheat/main.pwn"
#include "./modu/enum.pwn"
#include "./modu/groups/list.pwn"


main()
{
	print("\n----------------------------------");
	print(" F:DM [Beta]");
	print("----------------------------------\n");
}


//modular
#include "./modu/cmds/admin.pwn"
#include "./modu/cmds/player.pwn"
#include "./modu/groups/cmds.pwn"
#include "./modu/groups/main.pwn"
#include "./modu/cmds/anims.pwn"
#include "./modu/discord.pwn"
#include "./modu/stocks.pwn"
#include "./modu/functions.pwn"



public OnGameModeInit()
{
	mysql_log(ALL);
    ourConnection = mysql_connect(SQL_HOSTNAME, SQL_USERNAME, SQL_PASSWORD, SQL_DATABASE);

    if(mysql_errno() == 0)
    {
        printf ("[DATABASE]: Connection established to MYSQL", SQL_DATABASE);
    }
    else
    {
        printf ("[DATABASE]: Connection failed to MYSQL", SQL_DATABASE);
        SendRconCommand("Exit");
        return 0;
    }

	// Modulars
	#include "./modu/textdraws/global.pwn"
	#include "./modu/create.pwn" 

//===============SKINS========================================//
	//Login Skins:
    joinskin = LoadModelSelectionMenu("a_skins.txt");
	//Gang War:
    gsfskin  = LoadModelSelectionMenu("g_gsf.txt");
    lsvskin  = LoadModelSelectionMenu("g_lsv.txt");   
    varskin  = LoadModelSelectionMenu("g_var.txt");
    nbaskin  = LoadModelSelectionMenu("g_nba.txt");
	//Police Chase:
	fbiskin = LoadModelSelectionMenu("c_fbi.txt");
	policeskin = LoadModelSelectionMenu("c_police.txt");

	SetTimer("Vehiclesrespawn", 120000, true);


	ShowPlayerMarkers(PLAYER_MARKERS_MODE_STREAMED);
    SetGameModeText("Florida Deathmatch");
    DisableInteriorEnterExits();

	//discord find shit
	if (_:g_BotCommandsChannel == 0)
		g_BotCommandsChannel = DCC_FindChannelById("826431428061429796");
	if (_:g_ReportLogChannel == 0)
		g_ReportLogChannel = DCC_FindChannelById("827402805710028811");
	if (_:g_SupportLogChannel == 0)
		g_SupportLogChannel = DCC_FindChannelById("827402863947939890");
	if(_:g_PlayerLogChannel == 0)
		g_PlayerLogChannel = DCC_FindChannelById("827681273697927259");
	if(_:g_AntiCheatChannel == 0)
		g_AntiCheatChannel = DCC_FindChannelById("862456844923568132");
	if(_:g_DeveloperChannel == 0)
		g_DeveloperChannel = DCC_FindChannelById("826432235635867669");

	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{

	if(PlayerInfo[playerid][pLoggedin] == false)
	{
     	SetSpawnInfo(playerid, 0, 0, 563.3157, 3315.2559, 0, 269.15, 0, 0, 0, 0, 0, 0);
     	TogglePlayerSpectating(playerid, true);
     	TogglePlayerSpectating(playerid, false);
     	SetPlayerCamera(playerid);
    	return 1;
 	}
	SetSpawnInfo(playerid, 0, PlayerInfo[playerid][pSkin], 2098.5088,1159.1156,11.6484, 65.2418, 0, 0, 0, 0, 0, 0);
 	SpawnPlayer(playerid);
	SetPlayerTeam(playerid, 1);
    return 0;
}


public OnPlayerConnect(playerid)
{
	//textdraws
	#include "./modu/textdraws/player.pwn"
//-------------------------[GS9 Exterior Removed Objects]----------------------//
	RemoveBuildingForPlayer(playerid, 1412, 1917.3203, -1797.4219, 13.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1912.0547, -1797.4219, 13.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1906.7734, -1797.4219, 13.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1927.8516, -1797.4219, 13.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1922.5859, -1797.4219, 13.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1938.3906, -1797.4219, 13.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1933.1250, -1797.4219, 13.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1676, 1941.6563, -1778.4531, 14.1406, 0.25);
	RemoveBuildingForPlayer(playerid, 1676, 1941.6563, -1774.3125, 14.1406, 0.25);
	RemoveBuildingForPlayer(playerid, 1676, 1941.6563, -1771.3438, 14.1406, 0.25);
	RemoveBuildingForPlayer(playerid, 1676, 1941.6563, -1767.2891, 14.1406, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1951.6094, -1821.1250, 13.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1951.6094, -1815.8594, 13.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1951.6094, -1810.5938, 13.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1951.6094, -1805.3281, 13.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1948.9844, -1797.4219, 13.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1943.6875, -1797.4219, 13.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1951.6094, -1800.0625, 13.8125, 0.25);
	//Removes vending machines
    RemoveBuildingForPlayer(playerid, 1302, 0.0, 0.0, 0.0, 6000.0);
    RemoveBuildingForPlayer(playerid, 1209, 0.0, 0.0, 0.0, 6000.0);
    RemoveBuildingForPlayer(playerid, 955, 0.0, 0.0, 0.0, 6000.0);
    RemoveBuildingForPlayer(playerid, 1775, 0.0, 0.0, 0.0, 6000.0);
    RemoveBuildingForPlayer(playerid, 1776, 0.0, 0.0, 0.0, 6000.0);
//==================MIlleclaouns ========================================//
    SetPlayerCamera(playerid);
	publicoff[playerid] = false;
	CheckPlayerColor(playerid); 
	new existCheck[248];	
	mysql_format(ourConnection, existCheck, sizeof(existCheck), "SELECT * FROM fdm_accounts WHERE acc_name = '%e'", ReturnName(playerid));
	mysql_tquery(ourConnection, existCheck, "LogPlayerIn", "i", playerid);
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	if(PlayerInfo[playerid][pLoggedin] == true)
	{
		SetPlayerName(playerid, PlayerInfo[playerid][pAccName]);
	}

    new string[128];
    new name[MAX_PLAYER_NAME];
    GetPlayerName(playerid, name, sizeof(name));
    format(string, sizeof(string), "[Connection] {FFFFFF}Player {0a25f5}%s {FFFFFF}has left the server. ",name);
    SendConnectMessage(color_blue, string);
	ResetStatus(playerid);
    RemovePlayerAttachedObject(playerid, 8);
    RemovePlayerAttachedObject(playerid, 9);
    //UpdatePlayerGroupStatus(playerid);

	if(PLAYERCAP[playerid]){

		new shit[128];
		GetPlayerName(playerid, name, sizeof(name));
        format(shit, sizeof(shit), "[Gang War]{FFFFFF}: %s Failed to Capture the turf. (Logged off)", name);
        SendGwarMessage(color_orange, shit);
		KillTimer(turftime);
		GangZoneStopFlashForAll(turf);
    	TurfCountdown = 60;
	    KillTimer(TurfIdentifier);
	    PLAYERCAP [playerid] = 0;
     	caping = 0;
        gsfcaping = 0;
        nbacaping = 0;
        lsvcaping = 0;
        varcaping = 0;
	    return 1;
	}
	return 1;
}

public OnPlayerSpawn(playerid)
{
	JustSpawned[playerid] = true;
	JustSpawnedTimerId[playerid] = SetTimerEx("JustSpawnedTimer", 5000, false, "i", playerid);
	if(INCOP[playerid]){
		SetTimerEx("UnfreezeTimer", 3000, false, "i", playerid);
		TogglePlayerControllable(playerid, 0);
		SetPlayerPos(playerid, 1565.2571,-1685.1045,62.1910);
		SetPlayerWantedLevel(playerid, 0);
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
	}
	if(GSF[playerid]){
		SetPlayerSkin(playerid, PlayerInfo[playerid][gSkin]);
		new g_loc = random(3);
        SetPlayerPos(playerid, GsfLocations[g_loc][0], GsfLocations[g_loc][1], GsfLocations[g_loc][2]);
        cmd_gangwarweapontable(playerid, "");
		SetPlayerTeam(playerid, 1);
	}
	if(NBA[playerid]){
		SetPlayerSkin(playerid, PlayerInfo[playerid][nSkin]);
		new n_loc = random(3);
        SetPlayerPos(playerid, NbaLocations[n_loc][0], NbaLocations[n_loc][1], NbaLocations[n_loc][2]);
        cmd_gangwarweapontable(playerid, "");
		SetPlayerTeam(playerid, 2);
	}
	if(LSV[playerid]){
		SetPlayerSkin(playerid, PlayerInfo[playerid][lSkin]);
		new l_loc = random(2);
		SetPlayerPos(playerid, LsvLocations[l_loc][0], LsvLocations[l_loc][1], LsvLocations[l_loc][2]);
		cmd_gangwarweapontable(playerid, "");
		SetPlayerTeam(playerid, 4);
	}
	if(VAR[playerid]){
		SetPlayerSkin(playerid, PlayerInfo[playerid][vSkin]);
		new v_loc = random(3);
		SetPlayerPos(playerid, VarLocations[v_loc][0], VarLocations[v_loc][1], VarLocations[v_loc][2]);
		cmd_gangwarweapontable(playerid, "");
		SetPlayerTeam(playerid, 3);

	}
	if(SDM[playerid]){
		new s_loc = random(4);
        SetPlayerPos(playerid, SdmLocations[s_loc][0], SdmLocations[s_loc][1], SdmLocations[s_loc][2]);
	    SetPlayerInterior(playerid, 15);
	    ResetPlayerWeapons(playerid);
	    SetPlayerHealth(playerid, 100);
	    SetPlayerArmour(playerid, 100);
	    GivePlayerWeapon(playerid, 34, 999);
		SetPlayerTeam(playerid, NO_TEAM);
	}
	if(GDM[playerid]){
		new g_loc = random(5);
        SetPlayerPos(playerid, GdmLocations[g_loc][0], GdmLocations[g_loc][1], GdmLocations[g_loc][2]);
        ResetPlayerWeapons(playerid);
        SetPlayerHealth(playerid, 100);
        SetPlayerArmour(playerid, 100);
        GivePlayerWeapon(playerid, 24, 999);
        GivePlayerWeapon(playerid, 33, 999);
        GivePlayerWeapon(playerid, 25, 999);
		SetPlayerTeam(playerid, NO_TEAM);
	}
	if(PDM[playerid]){
		new p_loc = random(5);
        SetPlayerPos(playerid, PdmLocations[p_loc][0], PdmLocations[p_loc][1], PdmLocations[p_loc][2]);
		SetPlayerInterior(playerid, 3);
		ResetPlayerWeapons(playerid);
		GivePlayerWeapon(playerid, 30, 10000);
		GivePlayerWeapon(playerid, 24, 999);
		SetPlayerHealth(playerid, 100);
		SetPlayerArmour(playerid, 100);
		SetPlayerTeam(playerid, NO_TEAM);
	}
	if(INRCDM[playerid]){
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
	SetPlayerTeam(playerid, NO_TEAM);
	}
    if(LVPD[playerid]){
        new d_loc = random(5);
        SetPlayerPos(playerid, LvpdLocations[d_loc][0], LvpdLocations[d_loc][1], LvpdLocations[d_loc][2]);
    	SetPlayerInterior(playerid, 3);
	    GivePlayerWeapon(playerid, 24, 1000);
	    SetPlayerHealth(playerid, 100);
	    SetPlayerArmour(playerid, 100);
		SetPlayerTeam(playerid, NO_TEAM);

    }
	if(WDM[playerid]){
        new w_loc = random(4);
        SetPlayerPos(playerid, WdmLocations[w_loc][0], WdmLocations[w_loc][1], WdmLocations[w_loc][2]);
 		SetPlayerInterior(playerid, 1);
   		ResetPlayerWeapons(playerid);
   		SetPlayerHealth(playerid, 100);
		SetPlayerArmour(playerid, 100);
		GivePlayerWeapon(playerid, 24, 1000);
		GivePlayerWeapon(playerid, 25, 100000);
		SetPlayerTeam(playerid, NO_TEAM);
    }
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	SetPlayerScore(killerid, PlayerInfo[killerid][pScore] + 1);
    GivePlayerMoney(killerid, 500);    PlayerInfo[killerid][pMoney] += 500;
	PlayerInfo[killerid][pKills] += 1;
	PlayerInfo[playerid][pDeaths] += 1;
	PlayerInfo[killerid][pScore] += 1;
	TogglePlayerSpectating(playerid, 1);
    PlayerSpectatePlayer(playerid, killerid); 
	SetTimerEx("Spectating", 3000, false, "d", playerid);
	new s[30];
	Timetorespawn[playerid] = 3;
	format(s, sizeof(s),"You're respawning in %d seconds", Timetorespawn);
	GameTextForPlayer(playerid, s, 1000, 4);
	DeathgametextIdent[playerid] = SetTimerEx("Deathgametext", 1000, true,"d",playerid);
	PlayerInfo[playerid][pDeaths] += 1;
    new insert[200];
    mysql_format(ourConnection, insert, sizeof(insert), "UPDATE `fdm_accounts` SET `acc_score`='%d', `acc_money`='%d', `acc_kills`='%d' WHERE `acc_dbid`='%d'", PlayerInfo[killerid][pScore], PlayerInfo[killerid][pMoney], PlayerInfo[killerid][pKills],PlayerInfo[killerid][pDBID]); 
	mysql_tquery(ourConnection, insert);
    mysql_format(ourConnection, insert, sizeof(insert), "UPDATE `fdm_accounts` SET `acc_deaths`='%d' WHERE `acc_dbid`='%d'", PlayerInfo[playerid][pDeaths], PlayerInfo[playerid][pDBID]);
	mysql_tquery(ourConnection, insert);
	if(LVPD[killerid] || WDM[killerid] || INRCDM[killerid] || PDM[killerid] || SDM[killerid] || GDM[killerid])
	{
		PlayerInfo[killerid][pArenakills] += 1;
		UpdateArenaKills(killerid);
	}
	if(INGWR[killerid])
	{
		PlayerInfo[killerid][pGwarkills] += 1;
		UpdateGwarKills(killerid);
	}

    RemovePlayerAttachedObject(playerid, 8);
    RemovePlayerAttachedObject(playerid, 9);
	SendClientMessage(playerid, color_pink,"[Death]{FFFFFF}: you are being respawned.");
	SendDeathMessage(killerid, playerid, reason);
	if(PLAYERCAP[playerid])
	{
		GangZoneStopFlashForAll(turf);
		SendGwarMessage(color_orange, "[Gang War]{FFFFFF}: Turf Capturer has been killed, Failed to Capture the turf.");
		KillTimer(turftime);
		TurfCountdown = 60;
	    KillTimer(TurfIdentifier);
		caping = 0;
		PLAYERCAP [playerid] = 0;
        gsfcaping = 0;
        nbacaping = 0;
        lsvcaping = 0;
        varcaping = 0;
	    
	}
	if(InvitedDuel[playerid] == true ||  InvitedDuel[killerid] == true )
    {
        new Float:healthkiller;
        new namekiller[24],string[44];
        GetPlayerName(killerid, namekiller, 24);
        GetPlayerHealth(killerid,healthkiller);
        format(string, sizeof(string), "[Duel] {FFFFFF}Player{0aedf5}%s {FFFFFF}has won a duel versus {0aedf5}%s",namekiller,ReturnName(playerid));
        SendClientMessageToAll(color_cyan, string);
		RemovePlayerAttachedObject(playerid, 8);
    	RemovePlayerAttachedObject(playerid, 9);
    	PlayerInfo[killerid][pDuelkills] += 1;
    	SetPlayerVirtualWorld(playerid, 0);
    	SetPlayerVirtualWorld(killerid, 0);
    	UpdateDuelKills(killerid);
		cmd_lobby(playerid, "");
        InvitedDuel[killerid] = false;
        InvitedDuel[playerid] = false;
        IdDuel[playerid] = false;
        IdDuel[killerid] = false;
        healthkiller = 0;
        ApplyAnimation(killerid,"PED","fucku",4.0,0,0,0,0,0);
		return cmd_lobby(killerid, "");
    }
	KILLSPREE [killerid] += 1;
	if(KILLSPREE[playerid] > 4){
		new message[200];
		format(message, sizeof(message), "[F:DM] {FFFFFF}Player {f50a0e}%s {FFFFFF}has destroyed {f50a0e}%s's %d {FFFFFF}killing spree.", ReturnName(killerid), ReturnName(playerid), KILLSPREE[playerid]);
		SendClientMessageToAll(color_red, message);
	}
	KILLSPREE [playerid] = 0;
	if(KILLSPREE[killerid] == 2){
		GameTextForPlayer(killerid, "~b~Double Kill", 2000, 6);
	}
	if(KILLSPREE[killerid] == 3){
        GameTextForPlayer(killerid, "~y~Triple Kill", 2000, 6);
	}
	if(KILLSPREE[killerid] == 4){
        GameTextForPlayer(killerid, "~r~Quadra Kill", 2000, 6);
	}
	if(KILLSPREE[killerid] == 5){
        GameTextForPlayer(killerid, "~r~Unstoppable", 2000, 6);
		new message[120];
		format(message, sizeof(message), "[F:DM] {FFFFFF}Player {f0fc03}%s {FFFFFF}is on {FFFFFF} %d Killing Spree!", ReturnName(killerid), KILLSPREE[killerid]);
		SendClientMessageToAll(color_yellow, message);
	}
	if(KILLSPREE[killerid] == 10){
        GameTextForPlayer(killerid, "~r~Legend", 2000, 6);
		new message[120];
		format(message, sizeof(message), "[F:DM] {FFFFFF}Player {f0fc03}%s {FFFFFF}is on {FFFFFF} %d Killing Spree!", ReturnName(killerid), KILLSPREE[killerid]);
		SendClientMessageToAll(color_yellow, message);
	}
	if(KILLSPREE[killerid] == 15 || KILLSPREE[killerid] == 20 || KILLSPREE[killerid] == 25 ||KILLSPREE[killerid] == 30 || KILLSPREE[killerid] == 35 || KILLSPREE[killerid] == 40 || KILLSPREE[killerid] == 45 || KILLSPREE[killerid] == 50 ||KILLSPREE[killerid] == 55 || KILLSPREE[killerid] == 60  ){
        GameTextForPlayer(killerid, "~r~Dominating", 2000, 6);
		new message[120];
		format(message, sizeof(message), "[F:DM] {FFFFFF}Player {f0fc03}%s {FFFFFF}is on {FFFFFF} %d Killing Spree!", ReturnName(killerid), KILLSPREE[killerid]);
		SendClientMessageToAll(color_yellow, message);
	}
	if(KILLSPREE[killerid] > 60){
        GameTextForPlayer(killerid, "~r~Legend", 2000, 6);
		new message[120];
		format(message, sizeof(message), "[F:DM] {FFFFFF}Player {f0fc03}%s {FFFFFF}is on {FFFFFF} %d Killing Spree!", ReturnName(killerid), KILLSPREE[killerid]);
		SendClientMessageToAll(color_yellow, message);
	}
 	return 1;
}

public OnVehicleSpawn(vehicleid)
{
	return 1;
}
 public OnVehicleDeath(vehicleid, killerid)
{
	SetTimer("Vehicledeath", 50000, false);
	return 1;
}

public OnPlayerText(playerid, text[])
{

    if(PlayerInfo[playerid][pMute] > 0){
        SendClientMessage(playerid, color_red, "You are currently muted.");
        return 0;
    }
    if(PlayerInfo[playerid][pLoggedin] == false)
    {
        SendClientMessage(playerid, color_red, "[Retart Alert]{FFFFFF}: bruv, try logging in first");
        return 0;
    }
	if(publicoff[playerid] == 1)
	{
		SendClientMessage(playerid, color_error, "You have toggled public chat, use /settings to turn it back on.");
	}
	if(PlayerInfo[playerid][pDonator] >= 1 && INGWR[playerid] == 0)
    {
        new vipstring[128];
        format(vipstring, sizeof(vipstring), "[VIP] {%06x}%s (%d){FFFFFF}: %s", GetPlayerColor(playerid) >>> 8 ,ReturnName(playerid), playerid, text);
        SendPublicMessage(color_ask, vipstring);
        return 0;
    }
	else
	{
		new pstring[128];
        format(pstring, sizeof(pstring), "{%06x}%s (%d){FFFFFF}: %s",GetPlayerColor(playerid) >>> 8, ReturnName(playerid), playerid, text);
        SendPublicMessage(color_white, pstring);
	}
    return 0;
}

public OnPlayerTakeDamage(playerid, issuerid, Float:amount, weaponid)
{
	if(pAduty[playerid] == 1){
		SetPlayerHealth(playerid, 100);
	}
    if(issuerid != INVALID_PLAYER_ID) PlayerPlaySound(issuerid,17802,0.0,0.0,0.0), PlayerPlaySound(playerid,1130,0.0,0.0,0.0);

	if(showhitmarker[issuerid] == 1)
    {
        TextDrawShowForPlayer(issuerid, HitMarker);
        hittimer = SetTimerEx("HITTD", 250, true, "%d", issuerid);
    }
    return 1;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
    new playername[MAX_PLAYER_NAME];
    GetPlayerName(playerid, playername, sizeof(playername));
	new thread[120];
    mysql_format(ourConnection, thread, sizeof(thread), "SELECT * FROM fdm_accounts WHERE acc_name = '%e' LIMIT 1", playername);
    mysql_tquery(ourConnection, thread, "OnLoadStatsForGame", "si", playername, playerid);
	return 1;
}
public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	if(IsBallasCar(vehicleid))
	{
		if(NBA[playerid])
		{
			return 1;
		}
		
	    SendClientMessage(playerid, color_pink,"[Vehicle]{FFFFFF}: This vehicle is not for your gang");
        ClearAnimations(playerid);
        return 1;
	}

	if(IsGroveCar(vehicleid))
	{
		if(GSF[playerid])
		{
			return 1;
		}	

		SendClientMessage(playerid, color_pink,"[Vehicle]{FFFFFF}: This vehicle is not for your gang");
        ClearAnimations(playerid);
        return 1;
	}

	if(IsVariosCar(vehicleid))
	{
		if(VAR[playerid])
		{
			return 1;
		}
		SendClientMessage(playerid, color_pink,"[Vehicle]{FFFFFF}: This vehicle is not for your gang");
        ClearAnimations(playerid);
        return 1;
	}	

	if(IsVagosCar(vehicleid))
	{
		if(LSV[playerid])
		{
			return 1;
		}
		SendClientMessage(playerid, color_pink,"[Vehicle]{FFFFFF}: This vehicle is not for your gang");
        ClearAnimations(playerid);
        return 1;
	}		
	
	if(vehicleid >= copchase_police[0] && vehicleid <= copchase_police[12])
	{
	    if(COPLEO[playerid])
	{
	return 1;
	}
	    {
	    	SendClientMessage(playerid, color_blue,"[Vehicle]{FFFFFF}: This vehicle is for Law Enforcment");
	    	ClearAnimations(playerid);
		}
	}
	if(vehicleid >= copchase_criminal[0] && vehicleid <= copchase_criminal[12])
	{
	    if(COPCRIM[playerid])
	{
	return 1;
	}
	    {
	    	SendClientMessage(playerid, color_criminal,"[Vehicle]{FFFFFF}: This vehicle is for Criminals");
	    	ClearAnimations(playerid);
		}
	}
	if(vehicleid >= gwar_vagos[0] && vehicleid <= gwar_vagos[10])
	{
	    if(LSV[playerid])
	{
	return 1;
	}
	    {
	    	SendClientMessage(playerid, color_pink,"[Vehicle]{FFFFFF}: This vehicle is not for your gang");
	    	ClearAnimations(playerid);
		}
	}
	if(vehicleid >= gwar_grovevip[0] && vehicleid <= gwar_grovevip[0])
	{
	    if(GSF[playerid] && PlayerInfo[playerid][pDonator])
	{
	return 1;
	}
	    {
	    	SendClientMessage(playerid, color_ask,"[Donator]{FFFFFF}: You are not a Donator, or this vehicle is not for your gang");
	    	ClearAnimations(playerid);
		}
	}
	if(vehicleid >= gwar_ballasvip[0] && vehicleid <= gwar_ballasvip[0])
	{
	    if(NBA[playerid] && PlayerInfo[playerid][pDonator])
	{
	return 1;
	}
	    {
	    	SendClientMessage(playerid, color_ask,"[Donator]{FFFFFF}: You are not a Donator, or this vehicle is not for your gang");
	    	ClearAnimations(playerid);
		}
	}
	if(vehicleid >= gwar_azcetavip[0] && vehicleid <= gwar_azcetavip[0])
	{
	    if(VAR[playerid] && PlayerInfo[playerid][pDonator])
	{
	return 1;
	}
	    {
	    	SendClientMessage(playerid, color_ask,"[Donator]{FFFFFF}: You are not a Donator, or this vehicle is not for your gang");
	    	ClearAnimations(playerid);
		}
	}
	if(vehicleid >= gwar_vagosvip[0] && vehicleid <= gwar_vagosvip[0])
	{
	    if(LSV[playerid] && PlayerInfo[playerid][pDonator])
	{
	return 1;
	}
	    {
	    	SendClientMessage(playerid, color_ask,"[Donator]{FFFFFF}: You are not a Donator, or this vehicle is not for your gang");
	    	ClearAnimations(playerid);
		}
	}


	return 1;

}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveRaceCheckpoint(playerid)
{
	return 1;
}

public OnRconCommand(cmd[])
{
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	return 1;
}

public OnObjectMoved(objectid)
{
	return 1;
}

public OnPlayerObjectMoved(playerid, objectid)
{
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	if(pickupid == CopChasePickup)
	{
	SetPlayerPos(playerid, 1565.3887,-1691.4082,62.1910);	
	ShowPlayerDialog(playerid, 6, DIALOG_STYLE_LIST, "{EE28EB}[F:DM] {FFFFFF}Cop Chase", "Criminal\nSAPD\nFBI", "Select", "Close");
	}
	if(pickupid >= GwarSprunkPickup[0] && pickupid <= GwarSprunkPickup[4])
	{
	SetTimerEx("RemoveInfoTD", 2500, false, "i", playerid);
	TextDrawShowForPlayer(playerid, sprunkbk);
	TextDrawShowForPlayer(playerid, sprunkred);
	TextDrawShowForPlayer(playerid, sprunktype);
	TextDrawShowForPlayer(playerid, sprunkh);
	TextDrawShowForPlayer(playerid, sprunknme);
	TextDrawShowForPlayer(playerid, sprunkown);
	TextDrawShowForPlayer(playerid, sprunkval);
	}
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
		if(newkeys & KEY_CTRL_BACK)
		{
			cmd_sprunk(playerid, "\1");
			pLastUsed[playerid] = gettime(); // Prevents spamming. Sometimes keys get messed up and register twice.
		}
        if(newkeys & KEY_FIRE && oldkeys & KEY_CROUCH || newkeys  & KEY_CROUCH && oldkeys & KEY_FIRE)
        {
        	CallLocalFunction("MakeCBug", "i", playerid);

        }
		return 1;
}



public OnPlayerUpdate(playerid)
{
	DetectModeFromPlayer(playerid);
	UpdateStatsTD(playerid);
    return 1; 
}

public OnPlayerStreamIn(playerid, forplayerid)
{
	return 1;
}

public OnPlayerStreamOut(playerid, forplayerid)
{
	return 1;
}

public OnVehicleStreamIn(vehicleid, forplayerid)
{
	return 1;
}

public OnVehicleStreamOut(vehicleid, forplayerid)
{
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    switch (dialogid)
	{
		case DIALOG_REGISTER:
		{
			if(!response)
			{
				SendClientMessage(playerid, color_red, "You were kicked for not registering.");
				KickEx(playerid);
				return 1;
			}

			new insert[200];
			if(strlen(inputtext) > 128 || strlen(inputtext) < 3)
				return	ShowPlayerDialog(playerid, DIALOG_REGISTER, DIALOG_STYLE_PASSWORD, "{EE28EB}[F:DM] {FFFFFF}Welcome to Florida DM", "{FFFFFF}Welcome!\nSeems that you are new here! Please register with a password\n\n{FFFFFF}~ {EE28EB}Florida DM {FFFFFF}~\n\n\
				Your password needs to be greater than 3 and less than 128 characters.", "Register", "Cancel");   

			mysql_format(ourConnection, insert, sizeof(insert), "INSERT INTO fdm_accounts (acc_name, acc_pass, register_ip, register_date) VALUES('%e', sha1('%e'), '%e', '%e')", ReturnName(playerid), inputtext, ReturnIP(playerid), ReturnDate());
			mysql_tquery(ourConnection, insert, "OnPlayerRegister", "i", playerid);
		}
		case DIALOG_LOGIN:
		{
			if (!response)
			{
				SendClientMessage(playerid, color_red, "[!] {FFFFFF}Make sure you login {FD0000}({FFFFFF}kicked{FD0000})");
				return KickEx(playerid);
			}

			new continueCheck[211];
			mysql_format(ourConnection, continueCheck, sizeof(continueCheck), "SELECT acc_dbid FROM fdm_accounts WHERE acc_name = '%e' AND acc_pass = sha1('%e') LIMIT 1", ReturnName(playerid), inputtext);
			mysql_tquery(ourConnection, continueCheck, "LoggingIn", "i", playerid);
			
			return 1;
		}
		case DIALOG_DM:
		{
			if (response)
			{
				switch(listitem)
				{
					case 0: return cmd_lvpd(playerid, "");
					case 1: return cmd_wdm(playerid, "");
					case 2: return cmd_rcdm(playerid, "");
					case 3: return cmd_pdm(playerid, "");
					case 4: return cmd_sdm(playerid, "");
					case 5: return cmd_gdm(playerid, "");
					
				}
			}
		}
		case DIALOG_CHANGEPASSWORD:
		{
			if(!response)
			{
				cmd_settings(playerid,"");
				return 1;
			}

			new insert[200];
			if(strlen(inputtext) > 128 || strlen(inputtext) < 3)
				return SendClientMessage(playerid, color_red,"Password needs to be greater than 3 and less than 128 chars.");
			mysql_format(ourConnection, insert, sizeof(insert), "UPDATE fdm_accounts SET acc_pass = sha1('%e') WHERE acc_dbid = %i", inputtext, PlayerInfo[playerid][pDBID]);
        	mysql_tquery(ourConnection, insert);
        	SendClientMessage(playerid, color_lime, "You have successfully changed your password");

		}
		case DIALOG_SETTINGS:
		{
			if (response)
			{
				switch(listitem)
				{
					case 0:
					{
					ShowPlayerDialog(playerid, 12, DIALOG_STYLE_PASSWORD, "{EE28EB}[F:DM] {FFFFFF}Reset Password", "{FFFFFF}Your password needs to be greater than 3 and less than 128 characters.", "Done", "Cancel");
					}
					case 1:
					{
					if(INL[playerid] != 1){
					SendClientMessage(playerid, color_purple, "You must be in the lobby to use this command {FFFFFF}(/lobby)");
					return 1;
	}
					ShowPlayerDialog(playerid, 11, DIALOG_STYLE_INPUT, "{EE28EB}[F:DM] {FFFFFF}Name Change", "{FFFFFF}It costs $10,000 for a name change\n\nMake sure to change your name in the samp browser.", "Change", "Cancel");
					}
					case 2: 
					{
					if(showconnect[playerid] == 1)
						{
						showconnect[playerid] = false;
						return cmd_settings(playerid, "");
						}
						else
						{
						showconnect[playerid] = true;
						return cmd_settings(playerid, "");
						}
					}
					case 3:
					{
					if(publicoff[playerid] == 0)
						{
						publicoff[playerid] = true;
						return cmd_settings(playerid, "");
						}
						else
						{
						publicoff[playerid] = false;
						return cmd_settings(playerid, "");
						}
					}
					case 4:
					{
					if(togpm[playerid] == 0)
						{
						togpm[playerid] = true;
						return cmd_settings(playerid, "");
						}
						else
						{
						togpm[playerid] = false;
						return cmd_settings(playerid, "");
						}
					}
					case 5:
					{
					if(showlocation[playerid] == 0)
						{
						showlocation[playerid] = true;
						PlayerTextDrawShow(playerid, LocationTD[playerid]);
						return cmd_settings(playerid, "");
						}
						else
						{
						PlayerTextDrawHide(playerid, LocationTD[playerid]);
						showlocation[playerid] = false;
						return cmd_settings(playerid, "");
						}
					}
					case 6:
					{
					if(showhitmarker[playerid] == 0)
						{
						showhitmarker[playerid] = true;
						return cmd_settings(playerid, "");
						}
						else
						{
						showhitmarker[playerid] = false;
						return cmd_settings(playerid, "");
						}
					}
					case 7:
					{

					}
					
				}
			}
		}
		case DIALOG_COLORSHOP:
		{
			if(!response)
			{
				SendClientMessage(playerid, color_red,  "[F:DM] {FFFFFF}The purchase has been canceled ");
			}

			if (response)
			{
				switch(listitem)
				{
					case 0:
					{
						if(PlayerInfo[playerid][pColor] == 1)
						{
							SendClientMessage(playerid, color_pink, "[F:DM] {FFFFFF}You are already using this color.");
							return 1;
						}
						GetPlayerMoney(playerid);
						if(PlayerInfo[playerid][pMoney] < 100000)
						{
							SendClientMessage(playerid, color_pink, "{20f1f5}[F:DM] {FFFFFF}Not enough money");
							return 1;
						}
						else
						{
							new insert[200];
							mysql_format(ourConnection, insert, sizeof(insert), "UPDATE fdm_accounts SET acc_color = 1 WHERE acc_dbid = %e", PlayerInfo[playerid][pDBID]);
							mysql_tquery(ourConnection, insert);
							SetPlayerColor(playerid, shop_pink);
							GivePlayerMoney(playerid, -100000);
							PlayerInfo[playerid][pMoney] -= 100000;
							PlayerInfo[playerid][pColor] = 1;
							UpdateMoney(playerid);	
							SendClientMessage(playerid, color_lime, "[F:DM] {FFFFFF}You have paid 100,000$ and changed your color!");		
						}			
					}
					case 1:
					{
						if(PlayerInfo[playerid][pColor] == 2)
						{
							SendClientMessage(playerid, color_pink, "[F:DM] {FFFFFF}You are already using this color.");
							return 1;
						}
						GetPlayerMoney(playerid);
						if(PlayerInfo[playerid][pMoney] < 100000)
						{
							SendClientMessage(playerid, color_pink, "{20f1f5}[F:DM] {e320f5}Not enough money");
							return 1;
						}
						else
						{
							new insert[200];
							mysql_format(ourConnection, insert, sizeof(insert), "UPDATE fdm_accounts SET acc_color = 2 WHERE acc_dbid = %i", PlayerInfo[playerid][pDBID]);
							mysql_tquery(ourConnection, insert);
							SetPlayerColor(playerid, shop_purple);
							GivePlayerMoney(playerid, -100000);
							PlayerInfo[playerid][pMoney] -= 100000;
							UpdateMoney(playerid);
							PlayerInfo[playerid][pColor] = 2;
							SendClientMessage(playerid, color_lime, "[F:DM] {FFFFFF}You have paid 100,000$ and changed your color!");
						}
					}
					case 2:
					{
						if(PlayerInfo[playerid][pColor] == 3)
						{
							SendClientMessage(playerid, color_pink, "[F:DM] {FFFFFF}You are already using this color.");
							return 1;
						}
						GetPlayerMoney(playerid);
						if(PlayerInfo[playerid][pMoney] < 100000)
						{
							SendClientMessage(playerid, color_pink, "{20f1f5}[F:DM] {e320f5}Not enough money");
							return 1;
						}
						else
						{
							new insert[200];
							mysql_format(ourConnection, insert, sizeof(insert), "UPDATE fdm_accounts SET acc_color = 3 WHERE acc_dbid = %i", PlayerInfo[playerid][pDBID]);
							mysql_tquery(ourConnection, insert);
							SetPlayerColor(playerid, shop_blue);
							GivePlayerMoney(playerid, -100000);
							PlayerInfo[playerid][pMoney] -= 100000;
							UpdateMoney(playerid);
							PlayerInfo[playerid][pColor] = 3;
							SendClientMessage(playerid, color_lime, "[F:DM] {FFFFFF}You have paid 100.000$ and changed your color!");
						}
					}
					case 3:
					{
						if(PlayerInfo[playerid][pColor] == 4)
						{
							SendClientMessage(playerid, color_pink, "[F:DM] {FFFFFF}You are already using this color.");
							return 1;
						}
						GetPlayerMoney(playerid);
						if(PlayerInfo[playerid][pMoney] < 100000)
						{
							SendClientMessage(playerid, color_pink, "{20f1f5}[F:DM] {e320f5}Not enough money");
							return 1;
						}
						else
						{
							new insert[200];
							mysql_format(ourConnection, insert, sizeof(insert), "UPDATE fdm_accounts SET acc_color = 4 WHERE acc_dbid = %i", PlayerInfo[playerid][pDBID]);
							mysql_tquery(ourConnection, insert);
							SetPlayerColor(playerid, shop_cyan);
							GivePlayerMoney(playerid, -100000);
							PlayerInfo[playerid][pMoney] -= 100000;
							PlayerInfo[playerid][pColor] = 4;
							UpdateMoney(playerid);
							SendClientMessage(playerid, color_lime, "[F:DM] {FFFFFF}You have paid 100,000$ and changed your color!");
						}
					}
					case 4:
					{
						if(PlayerInfo[playerid][pColor] == 5)
						{
							SendClientMessage(playerid, color_pink, "[F:DM] {FFFFFF}You are already using this color.");
							return 1;
						}
						GetPlayerMoney(playerid);
						if(PlayerInfo[playerid][pMoney] < 100000)
						{
							SendClientMessage(playerid, color_pink, "{20f1f5}[F:DM] {e320f5}Not enough money");
							return 1;
						}
						else
						{
							new insert[200];
							mysql_format(ourConnection, insert, sizeof(insert), "UPDATE fdm_accounts SET acc_color = 5 WHERE acc_dbid = %i", PlayerInfo[playerid][pDBID]);
							mysql_tquery(ourConnection, insert);
							SetPlayerColor(playerid, shop_green);
							GivePlayerMoney(playerid, -100000);
							PlayerInfo[playerid][pMoney] -= 100000;
							PlayerInfo[playerid][pColor] = 5;
							UpdateMoney(playerid);		
							SendClientMessage(playerid, color_lime, "[F:DM] {FFFFFF}You have paid 100.000$ and changed your color!");
						}
					}
					case 5:
					{
						if(PlayerInfo[playerid][pColor] == 6)
						{
							SendClientMessage(playerid, color_pink, "[F:DM] {FFFFFF}You are already using this color.");
							return 1;
						}
						GetPlayerMoney(playerid);
						if(PlayerInfo[playerid][pMoney] < 100000)
						{
							SendClientMessage(playerid, color_pink, "{20f1f5}[F:DM] {e320f5}Not enough money");
							return 1;
						}
						else
						{
							new insert[200];
							mysql_format(ourConnection, insert, sizeof(insert), "UPDATE fdm_accounts SET acc_color = 6 WHERE acc_dbid = %i", PlayerInfo[playerid][pDBID]);
							mysql_tquery(ourConnection, insert);
							SetPlayerColor(playerid, shop_lime);
							GivePlayerMoney(playerid, -100000);
							PlayerInfo[playerid][pMoney] -= 100000;
							PlayerInfo[playerid][pColor] = 6;
							UpdateMoney(playerid);						
							SendClientMessage(playerid, color_lime, "[F:DM] {FFFFFF}You have paid 100.000$ and changed your color!");
						}
					}
					case 6:
					{
						if(PlayerInfo[playerid][pColor] == 7)
						{
							SendClientMessage(playerid, color_pink, "[F:DM] {FFFFFF}You are already using this color.");
							return 1;
						}
						GetPlayerMoney(playerid);
						if(PlayerInfo[playerid][pMoney] < 100000)
						{
							SendClientMessage(playerid, color_pink, "{20f1f5}[F:DM] {e320f5}Not enough money");
							return 1;
						}
						else
						{
							new insert[200];
							mysql_format(ourConnection, insert, sizeof(insert), "UPDATE fdm_accounts SET acc_color = 7 WHERE acc_dbid = %i", PlayerInfo[playerid][pDBID]);
							mysql_tquery(ourConnection, insert);
							SetPlayerColor(playerid, shop_yellow);
							GivePlayerMoney(playerid, -100000);
							PlayerInfo[playerid][pMoney] -= 100000;
							PlayerInfo[playerid][pColor] = 7;
							UpdateMoney(playerid);
							SendClientMessage(playerid, color_lime, "[F:DM] {FFFFFF}You have paid 100.000$ and changed your color!");
						}
					}
					case 7:
					{
						if(PlayerInfo[playerid][pColor] == 8)
						{
							SendClientMessage(playerid, color_pink, "[F:DM] {FFFFFF}You are already using this color.");
							return 1;
						}
						GetPlayerMoney(playerid);
						if(PlayerInfo[playerid][pMoney] < 100000)
						{
							SendClientMessage(playerid, color_pink, "{20f1f5}[F:DM] {e320f5}Not enough money");
							return 1;
						}
						else
						{
							new insert[200];
							mysql_format(ourConnection, insert, sizeof(insert), "UPDATE fdm_accounts SET acc_color = 8 WHERE acc_dbid = %i", PlayerInfo[playerid][pDBID]);
							mysql_tquery(ourConnection, insert);
							GivePlayerMoney(playerid, -100000);
							PlayerInfo[playerid][pMoney] -= 100000;
							UpdateMoney(playerid);
							PlayerInfo[playerid][pColor] = 8;
							SetPlayerColor(playerid, shop_orange);
							SendClientMessage(playerid, color_lime, "[F:DM] {FFFFFF}You have paid 50.000$ and changed your color!");
						}
					}

				}
			}
		}
		case DIALOG_SETTINGS_NAME:
		{
			if(!response)
			{
				return cmd_settings(playerid, "");
			}
			new insert[200];
			if(strlen(inputtext) > 3 || strlen(inputtext) < 20)
			{
				SendClientMessage(playerid, color_error, "You name cannot be less then 3 or more then 20 charactors");
				return SendClientMessage(playerid, color_error, "Try again with a name that fits the criteria");
			}
			else
			{
			SendClientMessageEx(playerid, color_lime, "You paid $10,000 for the name change");
			SendClientMessageEx(playerid, color_ticket, "Your new name is {FFFFFF}%s",inputtext);
			new string[180];
			format(string, sizeof(string), "[Name Change] %s changed their name to %s!",ReturnName(playerid), inputtext);
			DCC_SendChannelMessage(g_PlayerLogChannel, string);
			SetPlayerName(playerid, inputtext);
        	mysql_format(ourConnection, insert, sizeof(insert), "UPDATE fdm_accounts SET acc_name = %e WHERE acc_dbid = %i", inputtext, PlayerInfo[playerid][pDBID]);
        	mysql_tquery(ourConnection, insert);
			}
		}
		case DIALOG_WPN:
		{
			if(!response)
				return ShowPlayerDialog(playerid, 4, DIALOG_STYLE_LIST, "{EE28EB}[F:DM] {FFFFFF}Choose Your Weapons", "Deagle\tShotgun\nDeagle\tAk47\nDeagle\tSniper", "Select", "Cancel");

			if (response)
			{
				switch(listitem)
				{
					case 0:
					{
						ResetPlayerWeapons(playerid);
						SetPlayerHealth(playerid, 100);
						SetPlayerArmour(playerid, 100);
						GivePlayerWeapon(playerid, 24, 999);
						GivePlayerWeapon(playerid, 25, 999);
					}
					case 1:
					{
						ResetPlayerWeapons(playerid);
						SetPlayerHealth(playerid, 100);
						SetPlayerArmour(playerid, 100);
						GivePlayerWeapon(playerid, 24, 999);
						GivePlayerWeapon(playerid, 30, 2000);
					}
					case 2:
					{
						ResetPlayerWeapons(playerid);
						SetPlayerHealth(playerid, 100);
						SetPlayerArmour(playerid, 100);
						GivePlayerWeapon(playerid, 24, 999);
						GivePlayerWeapon(playerid, 34, 200);
					}
				}
			}

		}

		case DIALOG_GWR:
		{
			if (response)
			{
				switch(listitem)
				{
					case 0:
					{
						ShowModelSelectionMenu(playerid, gsfskin, "Pick your skin!"); 
						
					} 

					case 1:
					{
						ShowModelSelectionMenu(playerid, nbaskin, "Pick your skin!");
					
					}

					case 2: 
					{
						ShowModelSelectionMenu(playerid, varskin, "Pick Your Skin!");
						
					}

					case 3:
					{
						ShowModelSelectionMenu(playerid, lsvskin, "Pick Your Skin!");

					}
					
				}

			}	
		}

		case DIALOG_COP_CHASE:
		{
			if (response)
			{
				switch(listitem)
				{
					case 0:
					{
						SetPlayerColor(playerid, color_criminal);
						SetPlayerPos(playerid, -1490.0017,835.0854,7.1875);
						SetPlayerTeam(playerid, 11);
						SendClientMessage(playerid, color_blue, "[Info]{FFFFFF}: Your goal is to kill all the cops before the timer ends.");
						INCOP [playerid] = 1;
						COPCRIM [playerid] = 1;
						INL [playerid] = 0;
		
					} 
					case 1:
					{
						ShowPlayerDialog(playerid, 7, DIALOG_STYLE_LIST, "{EE28EB}[F:DM] {FFFFFF}Cop Chase: SAPD Duty", "SAPD Volunteer\nSAPD Officer", "Select", "Cancel");
					
					}
					case 2: 
					{
						ShowPlayerDialog(playerid, 8, DIALOG_STYLE_LIST, "{EE28EB}[F:DM] {FFFFFF}Cop Chase: FBI Duty", "FBI Agent\nHRT Duty", "Select", "Cancel");
						
					}
					
				}

			}	
		}
		
		case DIALOG_COP_CHASE_SAPD:
		{
			if (response)
			{
				switch(listitem)
				{
					case 0:
					{
						SetPlayerColor(playerid, COLOR_VOL);
						SetPlayerSkin(playerid, 71);
						SetPlayerTeam(playerid, 10);
						SetPlayerPos(playerid, -1576.8077,678.3936,7.1875);
						TextDrawShowForPlayer(playerid, Textdraw0);
						TextDrawShowForPlayer(playerid, Textdraw1);
						TextDrawShowForPlayer(playerid, Textdraw2);
						TextDrawShowForPlayer(playerid, Textdraw3);
						TextDrawShowForPlayer(playerid, Textdraw4);
						TextDrawShowForPlayer(playerid, ccc_Textdraw5);
						TextDrawShowForPlayer(playerid, ccc_Textdraw6);
						TextDrawShowForPlayer(playerid, ccc_Textdraw7);
						TextDrawShowForPlayer(playerid, ccc_Textdraw8);
						SetTimerEx("RemoveInfoTD", 6000, false, "i", playerid);
						PlayerPlaySound(playerid,1150,0.0,0.0,0.0);
						COPLEO [playerid] = 1;
						COPVOL [playerid] = 1;
						INCOP [playerid] = 1;
						INDM [playerid] = 1;
						INL [playerid] = 0;
					}
					case 1:
					{
//						if(PlayerInfo[playerid][pScore] < 30)
//							{
//								return SendClientMessage(playerid, color_blue, "[Cop Chase]{FFFFFF}: You must be level 30 to use this");
//							}
						ShowModelSelectionMenu(playerid, policeskin, "SAPD Duty"); 

					}
					
				}

			}	
		}

		case DIALOG_COP_CHASE_FBI:
		{
			if (response)
			{
				switch(listitem)
				{
					case 0:
					{
//						if(PlayerInfo[playerid][pScore] < 50)
//							{
//								return SendClientMessage(playerid, color_blue, "[Cop Chase]{FFFFFF}: You must be level 50 to use this");
//							}
						ShowModelSelectionMenu(playerid, fbiskin, "FBI Duty"); 
					}
					case 1:
					{
	//					if(PlayerInfo[playerid][pScore] < 75)
	//						{
	//							return SendClientMessage(playerid, color_blue, "[Cop Chase]{FFFFFF}: You must be level 75 to use this");
	//						}
						SetPlayerColor(playerid, color_blue);
						SetPlayerSkin(playerid, 287);
						SetPlayerTeam(playerid, 10);
						SetPlayerPos(playerid, -1638.1818,656.6777,7.1875);
						SetPlayerAttachedObject(playerid, 8, 19777, 1, 0.1678, -0.1677, 0.0000, 93.0998, 10.8999, -86.6997, 0.6610, 0.5730, 0.6980, 0xFFFFFFFF, 0xFFFFFFFF); // FBILogo attached to the Army Skin
				        SetPlayerAttachedObject(playerid, 9, 19777, 1, 0.0348, 0.2160, 0.0000, -91.9000, 18.6000, -91.8000, 0.7929, 0.7059, 1.0000, 0xFFFFFFFF, 0xFFFFFFFF); // FBILogo attached to the Army Skin
					
						TextDrawShowForPlayer(playerid, Textdraw0);
						TextDrawShowForPlayer(playerid, Textdraw1);
						TextDrawShowForPlayer(playerid, Textdraw2);
						TextDrawShowForPlayer(playerid, Textdraw3);
						TextDrawShowForPlayer(playerid, Textdraw4);
						TextDrawShowForPlayer(playerid, ccc_Textdraw5);
						TextDrawShowForPlayer(playerid, ccc_Textdraw6);
						TextDrawShowForPlayer(playerid, ccc_Textdraw7);
						TextDrawShowForPlayer(playerid, ccc_Textdraw8);

						SetTimerEx("RemoveMainTD", 8000, false, "i", playerid);
						PlayerPlaySound(playerid,1150,0.0,0.0,0.0);	
						COPLEO [playerid] = 1;
						COPHRT [playerid] = 1;
						INCOP [playerid] = 1;
						INL [playerid] = 0;

					}
					
				}

			}	
		}

		case DIALOG_DUEL:
		{
		    if (response){
					new name[MAX_PLAYER_NAME], string[500];
					GetPlayerName(playerid, name, sizeof(name));
					format(string, sizeof(string), "[Duel]{FFFFFF}: %s accepted the duel, starting in 3 seconds.",name);
					SendClientMessage(IdDuel[playerid],0xF6F600AA,string);
					SendClientMessage(playerid,0xF6F600AA,"[Duel]{FFFFFF}: You accepted the duel. Starting in 3 seconds.");
					SetTimerEx("GoDuel",3000,false,"ii",playerid,IdDuel[playerid]);
					KillTimer(ExpireDuelId[IdDuel[playerid]]);

				}
		}	
		case DIALOG_GROUP_INVITE:
		{
	    new str[128];
	    if(!response)
	    {
	        format(str,sizeof(str),"%s has declined your invite.",ReturnName(playerid));
//	        SendClientMessage(groupvariables[playerid][0],color_red,str);
			SendClientMessage(playerid,color_red," You have declined the invite.");
//			groupvariables[playerid][0] = -1;
//			groupvariables[playerid][1] = 0;
	    }
	    if(response)
	    {
	        format(str,sizeof(str),"%s has accepted your invite.",ReturnName(playerid));
	        //SendClientMessage(groupvariables[playerid][0],color_wt,str);
			SendClientMessage(playerid,color_red,"You have accepted the invite.");
//			PlayerInfo[playerid][grouppid] = PlayerInfo[groupvariables[playerid][0]][grouppid];
//			groupvariables[playerid][0] = -1;
//			groupvariables[playerid][1] = 0;
	    }
		}
	}

	return 1;
}

public OnPlayerLeaveDynamicArea(playerid, areaid)
{
	if(areaid == turflimit && PLAYERCAP[playerid]){
		SendGwarMessage(color_orange, "[Gang War]{FFFFFF} The Turf Capturer has left the turf and failed to capture it.");
		KillTimer(turftime);
		GangZoneStopFlashForAll(turf);
		TurfCountdown = 60;
	    KillTimer(TurfIdentifier);
	    PLAYERCAP [playerid] = 0;
     	caping = 0;
        gsfcaping = 0;
        nbacaping = 0;
        lsvcaping = 0;
        varcaping = 0;

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
	return 1;
}

public OnPlayerModelSelection(playerid, response, listid, modelid)
{
	if(listid == joinskin)
	{
	    if(!response)
		    return ShowModelSelectionMenu(playerid, joinskin, "Pick A Skin");

        SetCameraBehindPlayer(playerid);
        SetPlayerSkin(playerid, modelid);
		PlayerInfo[playerid][pSkin] = modelid;
        new locVector = random(8);
        SetSpawnInfo(playerid, 0, modelid, locations[locVector][x], locations[locVector][y], locations[locVector][Z],182.5525,24,100000,0,0,0,0 );
        SpawnPlayer(playerid);
		SetPlayerTeam(playerid, 1);
		// show stats td

//		PlayerTextDrawShow(playerid, StatsSkinTD[playerid]);
		PlayerTextDrawShow(playerid, StatsNameTD[playerid]);
//		PlayerTextDrawShow(playerid, StatsScoreTD[playerid]);
		PlayerTextDrawShow(playerid, StatsKDTD[playerid]);
		PlayerTextDrawShow(playerid, StatsModeTD[playerid]);
		CheckPlayerColor(playerid);

		//end of shot td
		if(ServerIsAnnoucing == 1){
			TextDrawShowForPlayer(playerid, annoucegreen);
			TextDrawShowForPlayer(playerid, annoucetext);
			return 1;
		}

		INL [playerid] = 1;
	    if(capedbygsf == 1){
		GangZoneShowForPlayer(playerid, turf, COLOR_GROVE);
		return 1;
	    }
	    if(capedbylsv == 1){
		GangZoneShowForPlayer(playerid, turf, COLOR_VAGOS);
		return 1;
	    }
	    if(capedbyvar == 1){
		GangZoneShowForPlayer(playerid, turf, COLOR_AZCETAS);
		return 1;
	    }
	    if(capedbynba == 1){
		GangZoneShowForPlayer(playerid, turf, COLOR_BALLAS);
		return 1;
	    }
		if(caped == 0){
		GangZoneShowForPlayer(playerid, turf, color_white);
		return 1;
		}
	
	}

	if(listid == policeskin){
		if(!response)
		    return ShowModelSelectionMenu(playerid, policeskin, "SAPD Duty");
		SetPlayerColor(playerid, color_blue);
		SetPlayerSkin(playerid, modelid);
		SetPlayerTeam(playerid, 10);
 		SetPlayerPos(playerid, -1576.8077,678.3936,7.1875);

		TextDrawShowForPlayer(playerid, Textdraw0);
		TextDrawShowForPlayer(playerid, Textdraw1);
		TextDrawShowForPlayer(playerid, Textdraw2);
		TextDrawShowForPlayer(playerid, Textdraw3);
		TextDrawShowForPlayer(playerid, Textdraw4);
		TextDrawShowForPlayer(playerid, ccc_Textdraw5);
		TextDrawShowForPlayer(playerid, ccc_Textdraw6);
		TextDrawShowForPlayer(playerid, ccc_Textdraw7);
		TextDrawShowForPlayer(playerid, ccc_Textdraw8);
		SetTimerEx("RemoveMainTD", 8000, false, "i", playerid);
		PlayerPlaySound(playerid,1150,0.0,0.0,0.0);

		COPPOLICE [playerid] = 1;
		COPLEO [playerid] = 1;
		INCOP [playerid] = 1;
        INL [playerid] = 0;
	}

	if(listid == fbiskin){
		if(!response)
			return ShowModelSelectionMenu(playerid, fbiskin, "FBI Duty");
		SetPlayerColor(playerid, color_blue);
		SetPlayerSkin(playerid, modelid);
		SetPlayerTeam(playerid, 10);
		SetPlayerPos(playerid, -1578.0310,655.3882,7.1875);

		TextDrawShowForPlayer(playerid, Textdraw0);
		TextDrawShowForPlayer(playerid, Textdraw1);
		TextDrawShowForPlayer(playerid, Textdraw2);
		TextDrawShowForPlayer(playerid, Textdraw3);
		TextDrawShowForPlayer(playerid, Textdraw4);
		TextDrawShowForPlayer(playerid, ccc_Textdraw5);
		TextDrawShowForPlayer(playerid, ccc_Textdraw6);
		TextDrawShowForPlayer(playerid, ccc_Textdraw7);
		TextDrawShowForPlayer(playerid, ccc_Textdraw8);
		SetTimerEx("RemoveMainTD", 8000, false, "i", playerid);
		PlayerPlaySound(playerid,1150,0.0,0.0,0.0);

		COPFBI [playerid] = 1;
		COPLEO [playerid] = 1;
		INCOP [playerid] = 1;
        INL [playerid] = 0;

	}

	if(listid == gsfskin){
		if(!response)
		    return ShowModelSelectionMenu(playerid, gsfskin, "Pick A Skin");
		SetPlayerColor(playerid, COLOR_GROVE);
		SetPlayerWorldBounds(playerid, 2653, 1683, -1136.5, -2184.5); 
		SetPlayerSkin(playerid, modelid);
		new message[230];
		format(message, sizeof(message), "[Gang Wars] {FFFFFF}%s has joined Gang War mode [Grove Street]", ReturnName(playerid));
		SendGwarMessage(color_orange, message);
		new name_string[128];
        new name[MAX_PLAYER_NAME + 1];
		GetPlayerName(playerid, name, sizeof(name));
        format(name_string, sizeof(name_string), "[GSF]%s", name);
		SetPlayerName(playerid, name_string);
		PlayerInfo[playerid][gSkin] = modelid;
		new g_loc = random(3);
        SetPlayerPos(playerid, GsfLocations[g_loc][0], GsfLocations[g_loc][1], GsfLocations[g_loc][2]);
        cmd_gangwarweapontable(playerid, "");
		SetPlayerTeam(playerid, 1);
		new string[200];
		format(string, sizeof(string), "[Gang Wars] {d615d6}%s {FFFFFF}has joined Gang war Mode.", ReturnName(playerid));
		SendClientMessageToAll(color_orange, string);
        
		GSF [playerid] = 1;
		INGWR [playerid] = 1;
		INL [playerid] = 0;
	    INDM [playerid] = 1;
	    WDM [playerid] = 0;
	    LVPD [playerid] = 0;
	    INRCDM [playerid] = 0;
	    SDM [playerid] = 0;
	    PDM [playerid] = 0;
	    GDM [playerid] = 0;
	}

	if(listid == nbaskin){
	    if(!response)
		    return ShowModelSelectionMenu(playerid, nbaskin, "Pick A Skin");
		SetPlayerColor(playerid, COLOR_BALLAS);
		SetPlayerWorldBounds(playerid, 2653, 1683, -1136.5, -2184.5); 
		new message[230];
		format(message, sizeof(message), "[Gang Wars] {FFFFFF}%s has joined Gang War mode [Kilo Tray Ballas]", ReturnName(playerid));
		SendGwarMessage(color_orange, message);
		new name_string[128];
        new name[MAX_PLAYER_NAME + 1];
		GetPlayerName(playerid, name, sizeof(name));
        format(name_string, sizeof(name_string), "[KTB]%s", name);
		SetPlayerName(playerid, name_string);
		SetPlayerSkin(playerid, modelid);
		PlayerInfo[playerid][nSkin] = modelid;
		new n_loc = random(3);
        SetPlayerPos(playerid, NbaLocations[n_loc][0], NbaLocations[n_loc][1], NbaLocations[n_loc][2]);
        cmd_gangwarweapontable(playerid, "");
		SetPlayerTeam(playerid, 2);
		new string[200];
		format(string, sizeof(string), "[Gang Wars] {d615d6}%s {FFFFFF}has joined Gang war Mode.", ReturnName(playerid));
		SendClientMessageToAll(color_orange, string);
        NBA [playerid] = 1;
        INGWR [playerid] = 1;
		INL [playerid] = 0;
	    INDM [playerid] = 1;
	    WDM [playerid] = 0;
	    LVPD [playerid] = 0;
	    INRCDM [playerid] = 0;
	    SDM [playerid] = 0;
	    PDM [playerid] = 0;
	    GDM [playerid] = 0;
	}

	if(listid == varskin){
		if(!response)
		    return ShowModelSelectionMenu(playerid, varskin, "Pick A Skin");
		SetPlayerColor(playerid, COLOR_AZCETAS);
		SetPlayerWorldBounds(playerid, 2653, 1683, -1136.5, -2184.5); 
	    SetPlayerSkin(playerid, modelid);
		new message[230];
		format(message, sizeof(message), "[Gang Wars] {FFFFFF}%s has joined Gang War mode [Los Varios Aztecas]", ReturnName(playerid));
		SendGwarMessage(color_orange, message);
		new name_string[128];
        new name[MAX_PLAYER_NAME + 1];
		GetPlayerName(playerid, name, sizeof(name));
        format(name_string, sizeof(name_string), "[VAR]%s", name);
		SetPlayerName(playerid, name_string);
		PlayerInfo[playerid][vSkin] = modelid;
		new v_loc = random(3);
		SetPlayerPos(playerid, VarLocations[v_loc][0], VarLocations[v_loc][1], VarLocations[v_loc][2]);
		cmd_gangwarweapontable(playerid, "");
		SetPlayerTeam(playerid, 3);
		new string[200];
		format(string, sizeof(string), "[Gang War] {d615d6}%s {FFFFFF}has joined Gang war Mode.", ReturnName(playerid));
		SendClientMessageToAll(color_orange, string);
		VAR [playerid] = 1;
		INGWR [playerid] = 1;
		INL [playerid] = 0;
	    INDM [playerid] = 1;
	    WDM [playerid] = 0;
	    LVPD [playerid] = 0;
	    INRCDM [playerid] = 0;
	    SDM [playerid] = 0;
	    PDM [playerid] = 0;
	    GDM [playerid] = 0;

	}

	if(listid == lsvskin){
		if(!response)
		    return ShowModelSelectionMenu(playerid, lsvskin, "Pick A Skin");
		SetPlayerColor(playerid, COLOR_VAGOS);
		SetPlayerWorldBounds(playerid, 2653, 1683, -1136.5, -2184.5); 
		SetPlayerSkin(playerid, modelid);
		new message[230];
		format(message, sizeof(message), "[Gang Wars] {FFFFFF}%s has joined Gang War mode [Los Santos Vagos]", ReturnName(playerid));
		SendGwarMessage(color_orange, message);
		new name_string[128];
        new name[MAX_PLAYER_NAME + 1];
		GetPlayerName(playerid, name, sizeof(name));
        format(name_string, sizeof(name_string), "[LSV]%s", name);
		SetPlayerName(playerid, name_string);
		PlayerInfo[playerid][lSkin] = modelid;
		new l_loc = random(2);
		SetPlayerPos(playerid, LsvLocations[l_loc][0], LsvLocations[l_loc][1], LsvLocations[l_loc][2]);
		cmd_gangwarweapontable(playerid, "");
		SetPlayerTeam(playerid, 4);
		new string[200];
		format(string, sizeof(string), "[Gang Wars] {d615d6}%s {FFFFFF}has joined Gang war Mode.", ReturnName(playerid));
		SendClientMessageToAll(color_orange, string);
		LSV [playerid] = 1;
		INGWR [playerid] = 1;
		INL [playerid] = 0;
	    INDM [playerid] = 1;
	    WDM [playerid] = 0;
	    LVPD [playerid] = 0;
	    INRCDM [playerid] = 0;
	    SDM [playerid] = 0;
	    PDM [playerid] = 0;
	    GDM [playerid] = 0;
	}
	return 1;
}
public OnPlayerGiveDamageActor(playerid, damaged_actorid, Float:amount, weaponid, bodypart)
{
	if(damaged_actorid == Actordm)
	{
		new string1[225];
		new string2[225];
		new string3[225];
		new string4[225];
		new string5[350];
		new string6[350];

	    new string[225]; string =  "{FFFFFF}Arena\t{FFFFFF}Current Players\n";//1
        format(string1, sizeof(string1), "%s{FFFFFF}{3DF6F4}LVPD\t{29953d}%i/10\n", string, GetLvpdPlayers());//2
        format(string2, sizeof(string2), "%s{FFFFFF}{3DF6F4}WareHouse Deathmatch\t{29953d}%i/10\n", string1, GetWarehousePlayers());//3
        format(string3, sizeof(string3), "%s{FFFFFF}{3DF6F4}RC Grounds\t{29953d}%i/10\n", string2, GetRcgPlayers());//4
        format(string4, sizeof(string4), "%s{FFFFFF}{3DF6F4}Pleasure Domes\t{29953d}%i/10\n", string3, GetPleasurePlayers());//5
		format(string5, sizeof(string5), "%s{FFFFFF}{3DF6F4}Sniper Deathmatch\t{29953d}%i/10\n", string4, GetSniperPlayers());//6
		format(string6, sizeof(string6), "%s{FFFFFF}{3DF6F4}Ghost Town\t{29953d}%i/10\n", string5, GetGhostPlayers());//7
        ShowPlayerDialog(playerid, 2, DIALOG_STYLE_TABLIST_HEADERS, "{EE28EB}[F:DM] {FFFFFF}Arena List", string6, "Select", "Cancel");
//		ShowPlayerDialog(playerid, 2, DIALOG_STYLE_TABLIST, "{EE28EB}[F:DM] {FFFFFF}Arena List", "{3DF6F4}LVPD\n{3DF6F4}WareHouse DM\n{3DF6F4}RC Grounds\n{3DF6F4}Pleasure Domes\n{3DF6F4}Sniper DM\n{3DF6F4}Ghost town", "Select", "Close");
    }
    if(damaged_actorid == Actorgwr)
    {
         return cmd_gwar(playerid, "");
    }
    if(damaged_actorid == Actorcopchase)
    {
		SendClientMessage(playerid,color_blue,"[Under Development]{FFFFFF}: Our development team is working on ''Cop Chase''");
		SendClientMessage(playerid,color_blue,"[Under Development]{FFFFFF}: they are trying their hardest to get it finished.");
///		SetTimerEx("UnfreezeTimer", 3000, false, "i", playerid);
///		TogglePlayerControllable(playerid, 0);
///		SetPlayerPos(playerid, 1565.2571,-1685.1045,62.1910);
///		SendClientMessage(playerid, color_blue, "[Cop Chase]{FFFFFF}: Welcome to Cop Chase! (use /lobby to go back)");
///		SendClientMessage(playerid, color_blue, "[Cop Chase]{FFFFFF}: Walk over the Cop icon to get started."); // I think Players prefer LS 
    }
	if(damaged_actorid == Actorvs)
	{
		SendClientMessage(playerid,color_pink,"[Under Development]{FFFFFF}: Our Dev Team is working on the ''Versus'' Mode.");
		SendClientMessage(playerid,color_pink,"[Under Development]{FFFFFF}: they are trying their hardest to get finished.");		
	}
	return 1;
}

public OnPlayerCommandPerformed(playerid, cmdtext[], success)
{
	if(!success)
	{
	    SendClientMessage(playerid, color_error, "That command doesn't exist! Use ''/help'' or ''/ask''");
	}
	return 1;
}

//-------------------- Commands------------------------------//
//============================FUNCTIONS===============================================//
