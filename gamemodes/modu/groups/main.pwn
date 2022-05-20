

GetGroupName(playerid)
{
	new name[32];
	if(PlayerInfo[playerid][pGroupid] == 0)
	{
		strcat(name, "None");
		return name;
	}
	else{
		strcat(GroupInfo[PlayerInfo[playerid][pGroupid]][groupName]);
	}
}