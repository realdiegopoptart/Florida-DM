#if defined _nex_ac_lang_included
	#endinput
#endif
#define _nex_ac_lang_included

new
	SUSPICION_1[] =			"[POPTART AC] Suspicion on the ID %d. Reason code: %03d%s",
	SUSPICION_2[] =			"[POPTART AC] Suspicion on the IP %s. Reason code: %03d%s",
	VERSION_WARNING[] =		"[POPTART AC] This version of the anticheat is not suitable for the server version",
	CFG_OPENING_ERROR[] =	"[POPTART AC] Error creating/opening %s!",

#if defined DEBUG
	DEBUG_CODE_1[] =		"[POPTART AC DEBUG] ID %d exceeded %d flood attempts. Public ID: %d",
	DEBUG_CODE_2[] =		"[POPTART AC DEBUG] Invalid version by ID %d. Version: %s",
	DEBUG_CODE_3[] =		"[POPTART AC DEBUG] ID %d exceeded %d connections from 1 IP-address",
	DEBUG_CODE_4[] =		"[POPTART AC DEBUG] Bad RCON login by IP %s using password %s",
	DEBUG_CODE_5[] =		"[POPTART AC DEBUG] ID %d used NOP %s",
#endif

//	KICK_MSG[] =			"You were kicked on suspicion of using cheats (#%03d)",
	MAX_CONNECTS_MSG[] =	"You exceeded the max number of connections from 1 IP-address",
	UNKNOWN_CLIENT_MSG[] =	"WARNING: This version of the client is not suitable for playing on the server",

	LOADED_MSG_1[] =		" POPTART AC has been loaded",
	LOADED_MSG_2[] =		" Anticheat version: %s",
	LOADED_MSG_3[] =		" Author: realdiegopoptart",

	STATS_STRING_1[] =		" Florida DM ~ Anticheat Records",
	STATS_STRING_2[] =		" Detected and prevented:",
	STATS_STRING_3[] =		"  %d cheating attempts",
	STATS_STRING_4[] =		"  %d hacking attempts",
	STATS_STRING_5[] =		"  %d crashing attempts",
	STATS_STRING_6[] =		"  %d flooding attempts",
	STATS_STRING_7[] =		"  %d attacks",
	STATS_STRING_8[] =		" Total detected and punished %d cheaters";