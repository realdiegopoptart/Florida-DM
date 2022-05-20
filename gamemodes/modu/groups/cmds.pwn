CMD:groups(playerid, params[])
{
	SendClientMessage(playerid, -1, "{EE28EB}[F:DM] {FFFFFF}Group List");
	for(new i = 0; i < sizeof(GroupInfo); i ++)
	{

		SendClientMessageEx(playerid, -1, "{EE28EB}Name: {C8C8C8}%s {FFFFFF}| {EE28EB}Tag: {C8C8C8}%s {FFFFFF}| {EE28EB}Leader: {C8C8C8}%s", GroupInfo[i][groupName], GroupInfo[i][groupTag], GroupInfo[i][groupLeader]);
	}
	return 1;
}