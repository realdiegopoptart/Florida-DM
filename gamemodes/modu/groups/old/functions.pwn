/* stock LoadGroups()
{
	return mysql_function_query(ourConnection, "SELECT * FROM `fdm_groups`", true, "GroupsInformation", "");
}

stock SendGroupMessage(color, groupID, string[])
{
	for(new i;i<MAX_PLAYERS;i++)
	{
		if(PlayerInfo[i][grouppid] == groupID)
		{
		    SendClientMessage(i, color, string);
		}
	}
	return 1;
}

forward MYSQL_SaveGroups(b);
public MYSQL_SaveGroups(b)
{
    new query[128];
    mysql_format(ourConnection,query, sizeof(query), "UPDATE `fdm_groups` SET `gChat` = %d, `gTag` = %d,`gName` = '%e', `gOwnerName` = '%e' WHERE `gID` = %d",
    GroupInfo[b][gchat],GroupInfo[b][gTAG],GroupInfo[b][gName],GroupInfo[b][gOwnerName],GroupInfo[b][gID]);
    mysql_tquery(ourConnection, query, "", "");
    return 1;
}

forward GroupsInformation();
public GroupsInformation(){

    new rows = cache_num_rows();

    if(rows){

        for(new i; i < rows; i++){

            cache_get_value_name_int(i, "gID", GroupInfo[i][gID]);
            cache_get_value_name(i, "gName", GroupInfo[i][gName]);
            cache_get_value_name(i, "gOwnerName", GroupInfo[i][gOwnerName]);


        }

    }
}

forward GroupCreated(b);
public GroupCreated(b)
{

    GroupInfo[b][gID] = cache_insert_id();
    groupid++;
    printf("New Group is created: [%d]", groupid );
}


/*
stock SetTagforPlayer(playerid,tag[])
{
  new name[MAX_PLAYER_NAME];
  new newname[30];
  GetPlayerName(playerid,name,MAX_PLAYER_NAME);
  format(newname,sizeof(newname),"[%s]%s",tag,name);
  SetPlayerName(playerid,newname);
  return 1;
}














enum groupsDATA
{
	gID,
	gName[128],
	gOwnerName[32],
	gchat,
	gTAG
};
new GroupInfo[MAX_GROUPS][groupsDATA];
new groupvariables[MAX_PLAYERS][2];*/
