/*
CMD:groupinvite(playerid,params[])
{
	new player,str[128],id=PlayerInfo[playerid][grouppid];
	if(strcmp(GroupInfo[id][gOwnerName],ReturnName(playerid)) != 0) return SendClientMessage(playerid,color_red,"[Error]{FFFFFF}: You are not a owner of any group.");
	if(groupvariables[playerid][1] == 1) return SendClientMessage(playerid,color_red,"[Error]{FFFFF}: You need to wait for their response");
	if(sscanf(params, "u", player)) return SendClientMessage(playerid,color_red,"[Usage]{FFFFFF}: /groupinvite [playerid/name]");
	if(!IsPlayerConnected(player)) return SendClientMessage(playerid,color_red,"[Error]{FFFFFF}: That player has not connected to the server.");
//	if(playerid == player) return SendClientMessage(playerid,color_error,"You can't invite yourself to your own group.");
	if(PlayerInfo[player][grouppid] == PlayerInfo[playerid][grouppid]) return SendClientMessage(playerid,color_red,"[Error]{FFFFFF}: Player is already in your group.");
	groupvariables[player][0] = playerid;
	groupvariables[playerid][1] = 1;
	format(str,sizeof(str),"%s is inviting you to %s",GroupInfo[id][gOwnerName],GroupInfo[id][gName]);
	ShowPlayerDialog(player, 1, DIALOG_STYLE_MSGBOX, "F:DM {FFFFFF}Group Invite", str, "Accept", "Decline");
	UpdatePlayerGroupStatus(player);
	return 1;
}
CMD:wt(playerid,params[])
{
	new str[128],string[128],id=PlayerInfo[playerid][grouppid];
	if(PlayerInfo[playerid][grouppid] == 0) return SendClientMessage(playerid,color_red,"[Error]{FFFFFF}: You must be in a group.");
	if(GroupInfo[id][gchat] == 1) return SendClientMessage(playerid,color_red,"[Error]{FFFFFF}: WT is locked by owner of the group.");
	if(sscanf(params, "s[128]", str)) return SendClientMessage(playerid,color_red,"[Usage]{FFFFFF}: /wt [Group Chat]");
	format(string,sizeof(string),"*** [WT | %s] %s: %s",GroupInfo[id][gName],ReturnName(playerid),str);
	SendGroupMessage(color_wt, id, string);
	return 1;
}
CMD:groupkick(playerid,params[])
{
	new str[128],id=PlayerInfo[playerid][grouppid],player;
 	if(strcmp(GroupInfo[id][gOwnerName],ReturnName(playerid)) != 0) return SendClientMessage(playerid,color_red,"[Error]{FFFFFF}: You are not a owner of any group.");
	if(sscanf(params, "u", player)) return SendClientMessage(playerid,color_red,"[Usage]{FFFFFF}: /groupkick [playerid/name]");
	if(!IsPlayerConnected(player)) return SendClientMessage(playerid,color_red,"[Error]{FFFFFF}: Player hasn't connected to server yet.");
	if(playerid == player) return SendClientMessage(playerid,color_error,"You can't kick yourself out of your own group.");
	if(PlayerInfo[player][grouppid] != PlayerInfo[playerid][grouppid]) return SendClientMessage(playerid,color_red,"[Error]{FFFFFF}: Player is not in your group.");
	format(str,sizeof(str),"[%s]: %s has kicked %s from the group",GroupInfo[id][gName],ReturnName(playerid),ReturnName(player));
	SendGroupMessage(0x8080FFFF, id, str);
	UpdatePlayerGroupStatus(player);
	return 1;
}
CMD:groupmembers(playerid,params[])
{
	new str[168],string[168 * 4];
	if(PlayerInfo[playerid][grouppid] == 0) return SendClientMessage(playerid,color_red,"[Error]{FFFFFF}: You are not in any group.");
	for(new i=0; i < MAX_PLAYERS; i++)
	{
	    if(PlayerInfo[playerid][grouppid] ==PlayerInfo[i][grouppid])
	    {
	        format(str,sizeof(str),"{FFFFFF}Online Members: %s\tID:%d\tRank:%s\n",ReturnName(i),i,PlayerInfo[i][grouprank]);
			strcat(string, str);
	    }
	}
	ShowPlayerDialog(playerid, 2, DIALOG_STYLE_MSGBOX, "F:DM {FFFFFF}Group Members", str, "Close", "");
	return 1;
}
CMD:grouprank(playerid,params[])
{
	new str[32],id=PlayerInfo[playerid][grouppid],player,string[128];

	if(strcmp(GroupInfo[id][gOwnerName],ReturnName(playerid)) != 0) return SendClientMessage(playerid,color_red,"[Error]{FFFFFF}: You are not a group owner.");

	if(sscanf(params, "us[32]", player,str)) return SendClientMessage(playerid,color_red,"[Usage]: /grouprank [playerid/name] [Rank Name]");

	if(!IsPlayerConnected(player)) return SendClientMessage(playerid,color_red,"[Error]{FFFFFF}: Player hasn't connected to server yet.");

	if(PlayerInfo[player][grouppid] != PlayerInfo[playerid][grouppid]) return SendClientMessage(playerid,color_red,"[Error]{FFFFFF}: Player is not in your group.");

    format(PlayerInfo[player][grouprank],32,str);
    format(string,sizeof(string),"%s has changed your group rank to %s",ReturnName(playerid),str);
    SendClientMessage(player,color_wt,string);
    format(string,sizeof(string),"You have changed %s group rank to %s",ReturnName(player),str);
    SendClientMessage(playerid,color_wt,string);
    UpdatePlayerGroupStatus(player);
	return 1;
}
CMD:wtlock(playerid,params[])
{
	new str[128],id=PlayerInfo[playerid][grouppid];
	if(strcmp(GroupInfo[id][gOwnerName],ReturnName(playerid)) != 0) return SendClientMessage(playerid,color_red,"[ERROR]: You are not a owner of any group.");
	if(GroupInfo[id][gchat] == 0)
	{
		GroupInfo[id][gchat] = 1;
		format(str,sizeof(str),"[%s]: %s has locked the group channel.",GroupInfo[id][gName],ReturnName(playerid));
		SendGroupMessage(color_wt, id, str);
	    return 1;
	}
	if(GroupInfo[id][gchat] == 1)
	{
		GroupInfo[id][gchat] = 0;
		format(str,sizeof(str),"[%s]: %s has unlocked the group channel.",GroupInfo[id][gName],ReturnName(playerid));
		SendGroupMessage(color_wt, id, str);
	    return 1;
	}
	return 1;
}
CMD:grouptag(playerid,params[])
{
	new str[5],id=PlayerInfo[playerid][grouppid],string[128];
	if(strcmp(GroupInfo[id][gOwnerName],ReturnName(playerid)) != 0) return SendClientMessage(playerid,color_red,"[Error]{FFFFFF}: You are not a group owner");
	if(sscanf(params, "s[5]",str)) return SendClientMessage(playerid,color_red,"[USAGE]: /grouptag [New Tag]");
//	if(strlen(str) > 1 || strlen(str) < 5 ) return SendClientMessage(playerid,color_red,"[Error]{FFFFFF}: Your group tag must be a maxi 5 characters.");
	format(GroupInfo[id][gTAG],5,str);
	format(string,sizeof(string),"[%s]: %s has changed the Group TAG to %s",GroupInfo[id][gName],ReturnName(playerid),str);
	SendGroupMessage(color_wt, id, string);
	return 1;
}*/