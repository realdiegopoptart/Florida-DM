stock GivePlayerHealth(playerid, Float:amount)
{
	new Float:health;
	GetPlayerHealth(playerid, health);
	SetPlayerHealth(playerid, (health + amount > 100.0) ? (100.0) : (health + amount));
}

IsVehicleOccupied(vehicleid)
{
    foreach(new i : Player)
    {
        if(IsPlayerInVehicle(i, vehicleid) && GetPlayerState(i) == PLAYER_STATE_DRIVER || IsPlayerInVehicle(i, vehicleid) && GetPlayerState(i) == PLAYER_STATE_PASSENGER)
        {
            return 1;
        }
    }
    return 0;
}

stock PlayerNearSprunk(playerid)
{
	if(IsPlayerInRangeOfPoint(playerid, 1, 2229.7592, -1457.9022, 23.8303)) return 1;
	if(IsPlayerInRangeOfPoint(playerid, 1, 2145.0109, -1645.8503, 15.0804)) return 1;
	if(IsPlayerInRangeOfPoint(playerid, 1, 1929.5269, -1773.1405, 13.4013)) return 1;
	if(IsPlayerInRangeOfPoint(playerid, 1, 2496.6188, -1643.3398, 13.7771)) return 1;
	if(IsPlayerInRangeOfPoint(playerid, 1, 1869.3774, -2035.8093, 13.5413)) return 1;
	return 0;
}

stock GetPlayerMode(playerid)
{
	new string[24];

	switch(ModeDetectionResults[playerid])
	{
	    case 1: string = "Lobby";
	    case 2: string = "Gang Wars";
	    case 3: string = "LVPD DM";
	    case 4: string = "Warehouse DM";
		case 5: string = "RC Ground DM";
		case 6: string = "Jizzy DM";
		case 7: string = "Sniper DM";
		case 8: string = "Ghost DM";
		case 9: string = "Cop Chase";
	}

	return string;
}

stock GetAdminRank(playerid)
{
	new string[50];

	switch(PlayerInfo[playerid][pAdmin])
	{
        case 1: string = "Moderator";
        case 2: string = "Junior Admin";
	    case 3: string = "Senior Admin";
	    case 4: string = "Manager";
	    case 5: string = "Owner";
	}

	return string;
}


stock Bannedskins(skinid)
{
	if(skinid < 1 || skinid > 311) return 0;
	switch(skinid)
	{
	    case 267, 67, 0, 45: return 0;
	}
	return 1;
}


stock ReturnName(playerid)
{
    new playersName[MAX_PLAYER_NAME + 1];
    GetPlayerName(playerid, playersName, sizeof(playersName));
    return playersName;
}

stock ReturnSkin(playerid)
{
    new playerSkin;
    playerSkin = GetPlayerSkin(playerid);
    return playerSkin;
}

stock ReturnIP(playerid)
{
	new
		ipAddress[20];

	GetPlayerIp(playerid, ipAddress, sizeof(ipAddress));
	return ipAddress;
}

stock ReturnDate()
{
	new sendString[90], MonthStr[40], month, day, year;
	new hour, minute, second;

	gettime(hour, minute, second);
	getdate(year, month, day);
	switch(month)
	{
	    case 1:  MonthStr = "January";
	    case 2:  MonthStr = "February";
	    case 3:  MonthStr = "March";
	    case 4:  MonthStr = "April";
	    case 5:  MonthStr = "May";
	    case 6:  MonthStr = "June";
	    case 7:  MonthStr = "July";
	    case 8:  MonthStr = "August";
	    case 9:  MonthStr = "September";
	    case 10: MonthStr = "October";
	    case 11: MonthStr = "November";
	    case 12: MonthStr = "December";
	}

	format(sendString, 90, "%s %d, %d %02d:%02d:%02d", MonthStr, day, year, hour, minute, second);
	return sendString;
}

stock KickEx(playerid)
{
	return SetTimerEx("KickTimer", 100, false, "i", playerid);
}

stock SendClientMessageEx(playerid, color, const str[], {Float,_}:...)
{
	static
	    args,
	    start,
	    end,
	    string[200]
	;
	#emit LOAD.S.pri 8
	#emit STOR.pri args

	if (args > 12)
	{
		#emit ADDR.pri str
		#emit STOR.pri start

	    for (end = start + (args - 12); end > start; end -= 4)
		{
	        #emit LREF.pri end
	        #emit PUSH.pri
		}
		#emit PUSH.S str
		#emit PUSH.C 200
		#emit PUSH.C string
		#emit PUSH.C args
		#emit SYSREQ.C format

		SendClientMessage(playerid, color, string);

		#emit LCTRL 5
		#emit SCTRL 4
		#emit RETN
	}
	return SendClientMessage(playerid, color, str);
}

stock ReturnVehicleName(vehicleid)
{
	new
		model = GetVehicleModel(vehicleid),
		name[32] = "None";

    if (model < 400 || model > 611)
	    return name;

	format(name, sizeof(name), g_arrVehicleNames[model - 400]);
	return name;
}

stock otherplayerids(const string[], &index)
{
    new length = strlen(string);
    while ((index < length) && (string[index] <= ' '))
    {
        index++;
    }
    new offset = index;
    new result[20];
    while ((index < length) && (string[index] > ' ') && ((index - offset) < (sizeof(result) - 1)))
    {
        result[index - offset] = string[index];
        index++;
    }
    result[index - offset] = EOS;
    return result;
}


//SendSpecialMessage
stock SendGwarMessage(color, message[])
{
    for(new i = 0; i < MAX_PLAYERS; i++)
    {
        if(INGWR[i])
         {
            SendClientMessage(i, color, message);
        }
    }
	return 1;
} 

stock SendLEOMessage(color, message[]) 
{ 
    for(new i = 0; i < MAX_PLAYERS; i++)
    {
        if(COPLEO[i] > 0)
         {
            SendClientMessage(i, color, message);
        }
    }
	return 1;
}

stock GetLvpdPlayers()
{
    new players;
    foreach(new i : Player)
    {
        if( LVPD[i] /*== arena*/)
        {
            players++;
        }
    }
    return players;
}

stock GetWarehousePlayers()
{
    new players;
    foreach(new i : Player)
    {
        if( WDM[i] /*== arena*/)
        {
            players++;
        }
    }
    return players;
}

stock GetPleasurePlayers()
{
    new players;
    foreach(new i : Player)
    {
        if( PDM[i] /*== arena*/)
        {
            players++;
        }
    }
    return players;
}

stock GetSniperPlayers()
{
    new players;
    foreach(new i : Player)
    {
        if( SDM[i] /*== arena*/)
        {
            players++;
        }
    }
    return players;
}

stock GetGhostPlayers()
{
    new players;
    foreach(new i : Player)
    {
        if(GDM[i] /*== arena*/)
        {
            players++;
        }
    }
    return players;
}

stock GetRcgPlayers()
{
    new players;
    foreach(new i : Player)
    {
        if(INRCDM[i] /*== arena*/)
        {
            players++;
        }
    }
    return players;
}

stock SendGroveMessage(color, message[]) 
{ 
    for(new i = 0; i < MAX_PLAYERS; i++)
    {
        if(GSF[i] > 0)
         {
            SendClientMessage(i, color, message);
        }
    }
	return 1;
}

stock SendBallasMessage(color, message[]) 
{ 
    for(new i = 0; i < MAX_PLAYERS; i++)
    {
        if(NBA[i] > 0)
         {
            SendClientMessage(i, color, message);
        }
    }
	return 1;
}

stock SendVariosMessage(color, message[]) 
{ 
    for(new i = 0; i < MAX_PLAYERS; i++)
    {
        if(VAR[i] > 0)
         {
            SendClientMessage(i, color, message);
        }
    }
	return 1;
}

stock SendVagosMessage(color, message[]) 
{ 
    for(new i = 0; i < MAX_PLAYERS; i++)
    {
        if(LSV[i] > 0)
        {
            SendClientMessage(i, color, message);
        }
    }
	return 1;
}

stock SendAdminMessage(color, message[]) 
{ 
    for(new i = 0; i < MAX_PLAYERS; i++)
    {
        if(PlayerInfo[i][pAdmin] > 0)
        {
            SendClientMessage(i, color, message);
        }
    }
	return 1;
}

stock SendPublicMessage(color, message[]) 
{ 
    for(new i = 0; i < MAX_PLAYERS; i++)
    {
        if(publicoff[i] == 0)
        {
            SendClientMessage(i, color, message);
        }
    }
	return 1;
}

stock SendConnectMessage(color, message[]) 
{ 
    for(new i = 0; i < MAX_PLAYERS; i++)
    {
        if(showconnect[i] == 1)
        {
            SendClientMessage(i, color, message);
        }
    }
	return 1;
}

stock SendDonatorMessage(color, message[]) 
{ 
    for(new i = 0; i < MAX_PLAYERS; i++)
    {
        if(PlayerInfo[i][pDonator] > 0)
         {
            SendClientMessage(i, color, message);
        }
    }
	return 1;
}

stock IsNumeric(const string[])
{
	new
		len = strlen(string),
		i;

	if(string[0] == '-') i = 1;

	while(i < len)
	{
	    if(!('0' <= string[i++] <= '9'))
	        return 0;
	}

	return 1;
}

stock TeleportToCoords(playerid, Float:ux, Float:uy, Float:uz, Float:angle, interiorid, worldid)
{
    {
        SetPlayerPos(playerid, ux, uy, uz);
        SetPlayerFacingAngle(playerid, angle);
        SetPlayerInterior(playerid, interiorid);
        SetPlayerVirtualWorld(playerid, worldid);
        SetCameraBehindPlayer(playerid);
    }
}

stock TeleportToPlayer(playerid, playerb)
{
    new
        Float:ux,
        Float:uy,
        Float:uz,
        Float:ua;

    GetPlayerPos(playerb, ux, uy, uz);
    GetPlayerFacingAngle(playerb, ua);

    TeleportToCoords(playerid, ux + 1, uy + 1, uz, ua, GetPlayerInterior(playerb), GetPlayerVirtualWorld(playerb));
}


GetDate()
{
    new date[5], string[24];
    getdate(date[0], date[1], date[2]);
    gettime(date[3], date[4]);
    format(string, sizeof(string), "%i-%02d-%02d %02d:%02d", date[0], date[1], date[2], date[3], date[4]);
    return string;
}