new g_Object[59]; // 14 is MOTD

new DCC_Channel:g_ReportLogChannel;
new DCC_Channel:g_SupportLogChannel;
new DCC_Channel:g_BotCommandsChannel;
new DCC_Channel:g_PlayerLogChannel;
new DCC_Channel:g_AntiCheatChannel;
new DCC_Channel:g_DeveloperChannel;

//-------TextDraws----//
//Sprunk
new Text:sprunkbk;
new Text:sprunkred;
new Text:sprunkh;
new Text:sprunkval;
new Text:sprunkown;
new Text:sprunknme;
new Text:sprunktype;

// main td?

new Text:Textdraw0;
new Text:Textdraw1;
new Text:Textdraw2;
new Text:Textdraw3;
new Text:Textdraw4;

// hit marker
new Text:HitMarker;
new hittimer;

// gmx td

new Text:gmxtd;

// td ccc
new Text:ccc_Textdraw5;
new Text:ccc_Textdraw6;
new Text:ccc_Textdraw7;
new Text:ccc_Textdraw8;

// timer td
new Text:td_timerbg;
new Text:td_timertext;
new PlayerBar:td_timerprogress;

// stats td
//Variables
//new PlayerText:StatsScoreTD[MAX_PLAYERS];
new PlayerText:StatsKDTD[MAX_PLAYERS];
new PlayerText:StatsModeTD[MAX_PLAYERS];
new PlayerText:StatsNameTD[MAX_PLAYERS];
//new PlayerText:StatsSkinTD[MAX_PLAYERS];
new PlayerText:LocationTD[MAX_PLAYERS];

// annouce td//
new Text:annoucegreen;
new Text:annoucetext;
new ServerIsAnnoucing;

//Tickets//
new ActiveSupport[MAX_PLAYERS];
new BeingHandledSupport[MAX_PLAYERS];
new HandlingAdminSupport[MAX_PLAYERS];


//Settings//
new togpm[MAX_PLAYERS];
new publicoff[MAX_PLAYERS];
new showconnect[MAX_PLAYERS];
new showlocation[MAX_PLAYERS];
new showhitmarker[MAX_PLAYERS];

//----------Vehicles---------------//
//gwar//
new pLastUsed[MAX_PLAYERS];
new gwar_grove[10];
new gwar_ballas[10];
new gwar_azceta[10];
new gwar_vagos[11];
//vip gwar//
new gwar_azcetavip[1];
new gwar_grovevip[1];
new gwar_ballasvip[1];
new gwar_vagosvip[1];
//cop chase//
new copchase_police[13];
new copchase_criminal[13];


new ISCBUGING[MAX_PLAYERS];
//----------CreatePickup-----------//
new CopChasePickup;
new GwarSprunkPickup[5];
//-----------------DUEL----------//
new bool:InvitedDuel[MAX_PLAYERS];
new IdDuel[MAX_PLAYERS];
new Counting = 5;
new CountDueling[5][5] ={"~r~1","~b~2","~p~3","~y~4","~g~5"};
new Gun[MAX_PLAYERS];
// GetPlayerStatus, ect;
new ModeDetectionResults[MAX_PLAYERS];
new pAduty[MAX_PLAYERS];
new ExpireDuelId[MAX_PLAYERS];
new JustSpawnedTimerId[MAX_PLAYERS];

//------------------Dm Areas / Lobby Vars----------------------------//
new INL[MAX_PLAYERS]; // In lobby Status
new INGWR[MAX_PLAYERS];  // in Gang war status
new LVPD[MAX_PLAYERS]; // in LVpd arena status
new WDM[MAX_PLAYERS]; // in Ware house dm status
new INDM[MAX_PLAYERS]; // in Dm status 

//actors
new Actordm; 
new Actorgwr;
new Actorvs;
new Actorcopchase;

new INRCDM[MAX_PLAYERS]; // in rc ground dm status
new PDM[MAX_PLAYERS]; //in Pleasure dm status
new SDM[MAX_PLAYERS]; // in sniper dm status
new GDM[MAX_PLAYERS]; // in Ghost town dm area status

// ------- Gang war Vars -----------//
new GSF[MAX_PLAYERS]; // In GSF team status
new NBA[MAX_PLAYERS]; // In NBA team status
new LSV[MAX_PLAYERS];  // in LSV team status
new VAR[MAX_PLAYERS];  // in Various team Status
new turflimit;
new turf;
new PLAYERCAP[MAX_PLAYERS];
new caping;
new caped; // Turf is capped
new nbacaping; // NBA are Captureing
new varcaping;  // VAR are capturing
new lsvcaping;// LSV are capturing
new gsfcaping ;  // GSF are capturing
new capedbynba; // Turf is captured by NBA
new capedbylsv; // Turf is captured by GSF
new capedbyvar; // Turf is captured by VAR
new capedbygsf; // Turf is captured by LSV
new turftime; 
new KILLSPREE[MAX_PLAYERS];
new IsAdminFrozen[MAX_PLAYERS];
new bool:JustSpawned[MAX_PLAYERS];
new TurfIdentifier;
new DeathgametextIdent[MAX_PLAYERS];
new Timetorespawn[MAX_PLAYERS];
new TurfCountdown;
//
new GmxTimer;
//

//cop chase vars
new INCOP[MAX_PLAYERS]; //being in Cop Chase
new COPLEO[MAX_PLAYERS]; //being swat/sapd/fbi
new COPVOL[MAX_PLAYERS];//defined for /r
new COPPOLICE[MAX_PLAYERS]; // for /r
new COPFBI[MAX_PLAYERS]; // for /r
new COPHRT[MAX_PLAYERS];// for /r
new COPCRIM[MAX_PLAYERS]; // criminal
// end of cop chase vars

new playerLogin[MAX_PLAYERS];
//-------------- Skins Vars --------------------//
new joinskin = mS_INVALID_LISTID;
new gsfskin = mS_INVALID_LISTID; 
new nbaskin = mS_INVALID_LISTID;
new lsvskin = mS_INVALID_LISTID;
new varskin = mS_INVALID_LISTID;
new policeskin = mS_INVALID_LISTID;
new fbiskin = mS_INVALID_LISTID;
//-------------account data stuff--------------//

enum P_ACCOUNT_DATA
{
    pDBID,
	gSkin, // grove skins stored
	nSkin, // ////////
	lSkin, // /// 
	vSkin, // //// 
	pAccName[60],
	pMoney,
	pKills,
	pColor,
	pDeaths,
	pScore,
	pArenakills,
	pDuelkills,
	pGwarkills,
	pMute,
	pBan,
	pDonator,
	pBanReason,
	pBanDate,
	pBanAdmin,
	pAdmin,
	pAdminCode,
	pAwarns,
	pAbans,
	pAjails,
	pWarned,
	pJailed,
	pSkin,
	grouppid, //group id
	grouprank[32], // group rank

	bool:pLoggedin
}
new groupid=-1;
new pHandledtickets[MAX_PLAYERS];
new PlayerInfo[MAX_PLAYERS][P_ACCOUNT_DATA];

//--------------------------------///
enum Vector3 {
  Float:x,
  Float:y,
  Float:Z
}

new locations[9][Vector3] = {
    // place your coords here
    {376.1006,2469.7708,16.5846},
    {370.5598,2469.9504,16.5846},
    {365.4152,2470.1277,16.5846},
    {365.7121,2475.5298,16.5846},
    {370.2319,2475.3789,16.5846},
    {375.3858,2474.9541,16.5846},
    {372.9134,2467.5376,16.5846},
    {368.3280,2462.5168,16.5846},
    {376.0320,2461.6362,16.5846}
};
//-------------------LVPD-------------------------------------------//
new Float:LvpdLocations[5][3] = {
	{289.0496,168.1495,1007.1719},
	{265.7121,177.8508,1003.0234},
	{245.8876,148.6157,1003.0234},
	{239.0486,140.8305,1003.0234},
	{225.1446,141.5526,1003.0234}
};
//--------------------WDM Locations---------------------------------//
new Float:WdmLocations[4][3] = {
	{1404.8436,-37.9528,1000.9127},
	{1408.8740,-9.4860,1000.9225},
	{1370.1227,1.3195,1000.9259},
	{1385.7327,-29.4326,1000.9221}

};
//-----------RCDM Spawn locations---------------------------------//
new Float:RandomLocations[6][3] = {
    {-974.4043,1075.2675,1344.9893},
    {-971.1730,1098.6224,1344.9908},
    {-996.4645,1048.7456,1342.3790},
    {-1052.8442,1047.8080,1343.2664},
    {-1098.9122,1079.4275,1341.8438},
    {-1126.9934,1050.7898,1345.7157}
};
//------------------Pleasuer dm Locations ===================================//
new Float:PdmLocations[5][3] = {
	{-2650.4873,1408.5455,906.2734},
	{-2674.9656,1396.3260,906.4609},
	{-2686.8784,1424.2056,906.4609},
	{-2666.3035,1423.5043,912.4114},
	{-2640.762939,1406.682006,906.460937}
};
//=========================Sniper Dm locations ============================//
new Float:SdmLocations[4][3] = {
	{-1307.2635,951.1805,1036.5547},
	{-1284.2697,979.3960,1036.9832},
	{-1408.8906,1059.7404,1038.5428},
	{-1480.0658,1041.8961,1038.3656}
};
//=========================Ghost town Dm locations ============================//
new Float:GdmLocations[5][3] = {
	{-362.0218,2244.5146,42.4844},
	{-333.5226,2219.1729,42.4883},
	{-359.8234,2197.7471,42.4844},
	{-440.3313,2214.8699,42.4297},
	{-419.8005,2234.0447,42.4297}

};
//=========================Gang war GSF locations ============================//
new Float:GsfLocations[3][3] = {
	{2495.3521,-1689.5631,14.5091},
	{2498.1624,-1652.0914,13.4889},
	{2512.6851,-1669.8492,13.4865}
};
//=========================Gang war NBA locations ============================//
new Float:NbaLocations[3][3] = {
	{2171.6921,-1614.7716,14.3171},
	{2166.4895,-1593.0443,14.3516},
	{2175.8350,-1598.5226,14.3516}

};
//========================= Gang War LSV locations ============================//
new Float:LsvLocations[2][3] = {
	{2232.4470,-1457.5726,24.0085},
	{2254.4854,-1452.8417,23.8281}
};
//========================= GANG WAR VAR locations ============================//
new Float:VarLocations[3][3] = {
	{1892.2242,-2021.6604,13.5469},
	{1872.2274,-2025.3639,13.5544},
	{1870.2988,-2037.4833,13.5469}
};
//-----------Statics----------------------------//
static stock g_arrVehicleNames[][] = {
    "Landstalker", "Bravura", "Buffalo", "Linerunner", "Perrenial", "Sentinel", "Dumper", "Firetruck", "Trashmaster",
    "Stretch", "Manana", "Infernus", "Voodoo", "Pony", "Mule", "Cheetah", "Ambulance", "Leviathan", "Moonbeam",
    "Esperanto", "Taxi", "Washington", "Bobcat", "Whoopee", "BF Injection", "Hunter", "Premier", "Enforcer",
    "Securicar", "Banshee", "Predator", "Bus", "Rhino", "Barracks", "Hotknife", "Trailer", "Previon", "Coach",
    "Cabbie", "Stallion", "Rumpo", "RC Bandit", "Romero", "Packer", "Monster", "Admiral", "Squalo", "Seasparrow",
    "Pizzaboy", "Tram", "Trailer", "Turismo", "Speeder", "Reefer", "Tropic", "Flatbed", "Yankee", "Caddy", "Solair",
    "Berkley's RC Van", "Skimmer", "PCJ-600", "Faggio", "Freeway", "RC Baron", "RC Raider", "Glendale", "Oceanic",
    "Sanchez", "Sparrow", "Patriot", "Quad", "Coastguard", "Dinghy", "Hermes", "Sabre", "Rustler", "ZR-350", "Walton",
    "Regina", "Comet", "BMX", "Burrito", "Camper", "Marquis", "Baggage", "Dozer", "Maverick", "News Chopper", "Rancher",
    "FBI Rancher", "Virgo", "Greenwood", "Jetmax", "Hotring", "Sandking", "Blista Compact", "Police Maverick",
    "Boxville", "Benson", "Mesa", "RC Goblin", "Hotring Racer A", "Hotring Racer B", "Bloodring Banger", "Rancher",
    "Super GT", "Elegant", "Journey", "Bike", "Mountain Bike", "Beagle", "Cropduster", "Stunt", "Tanker", "Roadtrain",
    "Nebula", "Majestic", "Buccaneer", "Shamal", "Hydra", "FCR-900", "NRG-500", "HPV1000", "Cement Truck", "Tow Truck",
    "Fortune", "Cadrona", "SWAT Truck", "Willard", "Forklift", "Tractor", "Combine", "Feltzer", "Remington", "Slamvan",
    "Blade", "Streak", "Freight", "Vortex", "Vincent", "Bullet", "Clover", "Sadler", "Firetruck", "Hustler", "Intruder",
    "Primo", "Cargobob", "Tampa", "Sunrise", "Merit", "Utility", "Nevada", "Yosemite", "Windsor", "Monster", "Monster",
    "Uranus", "Jester", "Sultan", "Stratum", "Elegy", "Raindance", "RC Tiger", "Flash", "Tahoma", "Savanna", "Bandito",
    "Freight Flat", "Streak Carriage", "Kart", "Mower", "Dune", "Sweeper", "Broadway", "Tornado", "AT-400", "DFT-30",
    "Huntley", "Stafford", "BF-400", "News Van", "Tug", "Trailer", "Emperor", "Wayfarer", "Euros", "Hotdog", "Club",
    "Freight Box", "Trailer", "Andromada", "Dodo", "RC Cam", "Launch", "LSPD Cruiser", "SFPD Cruiser", "LVPD Cruiser",
    "Police Rancher", "Picador", "S.W.A.T", "Alpha", "Phoenix", "Glendale", "Sadler", "Luggage", "Luggage", "Stairs",
    "Boxville", "Tiller", "Utility Trailer"
};