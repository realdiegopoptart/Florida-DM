
DCMD:players(user, channel, params[])
{
    new count = 0;
	new name[24];
	SendDiscordMessage(channel, "**__Online Players:__**");
	for(new i=0; i < MAX_PLAYERS; i++) {
	if(!IsPlayerConnected(i)) continue;
	GetPlayerName(i, name, MAX_PLAYER_NAME);
	{
        new string[250];
        format(string, sizeof(string), "```%s(%d) - %s```", name, i, GetPlayerMode(i));
	    SendDiscordMessage(channel, string);
	    count++; }
	}
	if (count == 0) return SendDiscordMessage(channel, "There are no players online.");
	return 1;
}

DCMD:hello(user, channel, params[]) {

    SendDiscordMessage(channel, "wuddup :Hipepe:");
    return 1;
}

DCMD:admins(user, channel, params[])
{
	new count = 0;
	SendDiscordMessage(channel, "**__Online Admins:__**");
    for(new i=0; i<MAX_PLAYERS; i++)
		{
			if(IsPlayerConnected(i))
			{
				if(PlayerInfo[i][pAdmin] >= 1)
				{			
				new astatus[64];
				if(pAduty[i] == 1)
				{
					astatus = "Administrating";
				}
				else if(pAduty[i] == 0)
				{
					astatus = "Playing";
				}
			 	if(PlayerAFK[i] == true)
				{
					astatus = "Paused";
				}
                new string[500];
				format(string, sizeof(string), "> * %s: %s (%d), Status: %s", GetAdminRank(i), ReturnName(i), i, astatus);
				SendDiscordMessage(channel, string);
				count++;
				}
            }
        }
    if (count == 0) return SendDiscordMessage(channel, "There are no admins online.");
    return 1;
}

DCMD:help(user, channel, params[]) {

    SendDiscordMessage(channel, "```\n\n-players\n-admins\n-stats\n-whenmade\n\n  ~  Florida Deathmatch  ~  ```");
    return 1;
}

DCMD:stats(user, channel, params[]){

	new playername[MAX_PLAYER_NAME];
	if(sscanf(params,"s[24]",playername)){
		return SendDiscordMessage(channel, "``-stats [username]``");
 
	}

	new thread[120];
    mysql_format(ourConnection, thread, sizeof(thread), "SELECT * FROM fdm_accounts WHERE acc_name = '%e' LIMIT 1", playername);
    mysql_tquery(ourConnection, thread, "OnLoadStats", "s", playername);
	return 1;
}

forward OnLoadStats(const playername[]);
public OnLoadStats(const playername[])
{
	new string[300], kills, money, deaths, score; 
    if(!cache_num_rows()){
		DCC_SendChannelMessage(g_BotCommandsChannel, "```This name doesn't exist in our data base```");
        return 1;
    }

    cache_get_value_name_int(0, "acc_kills", kills);
    cache_get_value_name_int(0, "acc_money", money);
    cache_get_value_name_int(0, "acc_deaths", deaths);
    cache_get_value_name_int(0, "acc_score",  score);

	format(string, sizeof(string), "```Player Name: %s\n- Player Kills: %i\n- Player Deaths: %i\n- Player Score: %i ```", playername, kills, deaths, score);
	DCC_SendChannelMessage(g_BotCommandsChannel, string);
	return 1;
}

DCMD:whenmade(user, channel, params[])
{

	new playername[MAX_PLAYER_NAME];
	if(sscanf(params,"s[24]",playername)){
		return SendDiscordMessage(channel, "``-whenmade [username]``");
 
	}

	new thread[120];
    mysql_format(ourConnection, thread, sizeof(thread), "SELECT * FROM fdm_accounts WHERE acc_name = '%e' LIMIT 1", playername);
    mysql_tquery(ourConnection, thread, "OnWhenMade", "s", playername);
	return 1;
}

forward OnWhenMade(const playername[]);
public OnWhenMade(const playername[])
{
	new string[300], made[80]; 
    if(!cache_num_rows()){
		DCC_SendChannelMessage(g_BotCommandsChannel, "```This name doesn't exist in our database```");
        return 1;
    }

	cache_get_value_name(0, "register_date", made, 80);

	format(string, sizeof(string), "``` %s was registed on %s ```", playername, made);
	DCC_SendChannelMessage(g_BotCommandsChannel, string);
	return 1;
}



//keep this at the end of the code
public OnDiscordCommandPerformed(DCC_User:user, DCC_Channel:channel, cmdtext[], success) {

	if(channel != g_BotCommandsChannel) return SendDiscordMessage(channel, "``` Use commands in Commands-Spam Channel. ```");

    if(!success) {
    
        SendDiscordMessage(channel, "This command does not exist!");
    }
    return 1;
}
