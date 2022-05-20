CMD:handsup(playerid, params[]) { SetPlayerSpecialAction(playerid,10); return 1;}
CMD:fu(playerid, params[]) { ApplyAnimation(playerid,"PED","fucku",4.0,0,0,0,0,0); return 1; }
CMD:eat(playerid, params[]) { ApplyAnimation(playerid, "FOOD", "EAT_Burger", 3.0, 0, 0, 0, 0, 0); return 1;}
CMD:piss(playerid, params) { SetPlayerSpecialAction(playerid, SPECIAL_ACTION_PISSING); return 1; }
CMD:sit(playerid, params) { LoopingAnim(playerid,"ped","SEAT_down",4.0,0,0,0,1,0); return 1; }
CMD:wave(playerid, params) { LoopingAnim(playerid,"ON_LOOKERS","wave_loop",4.0,1,0,0,0,0); return 1; }
CMD:drunk(playerid, params) { LoopingAnim(playerid,"PED","WALK_DRUNK",4.1,1,1,1,1,1); return 1; }
CMD:kiss(playerid, params) { ApplyAnimation(playerid,"KISSING","Playa_Kiss_01",4.0,0,0,0,0,0); return 1; }
CMD:cry(playerid, params) { LoopingAnim(playerid,"GRAVEYARD","mrnF_loop",4.0,1,0,0,0,0); return 1; }
CMD:hide(playerid, params) { LoopingAnim(playerid, "ped", "cower", 3.0, 1, 0, 0, 0, 0); return 1; }
CMD:smoke(playerid, params) { LoopingAnim(playerid,"SMOKING","M_smklean_loop",4.0,1,0,0,0,0); return 1; }


CMD:animhelp(playerid, params)
{
    SendClientMessage(playerid, color_purple, "___________Animation List___________");
    SendClientMessage(playerid, color_white, "/handsup, /fu, /eat, /piss, /sit, /wave");
    SendClientMessage(playerid, color_white, "/drunk, /kiss, /cry, /hide, /smoke");
    SendClientMessage(playerid, color_purple, "To stop a animation use {FFFFFF}(/sa)");
    return 1;
}

CMD:sa(playerid, params)
{
    if(IsAdminFrozen[playerid] == 1)
    return SendClientMessage(playerid, color_error, "You cannot use this command at this moment.");

    TogglePlayerControllable(playerid, 1);
    ClearAnimations(playerid);
    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
    ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.0, 0, 0, 0, 0, 0, 1);
    return 1;
}

stock Peeing(playerid)
{
	return GetPlayerSpecialAction(playerid) == SPECIAL_ACTION_PISSING;
}

stock LoopingAnim(playerid,animlib[],animname[], Float:Speed, looping, lockx, locky, lockz, lp)
{
    ApplyAnimation(playerid, animlib, animname, Speed, looping, lockx, locky, lockz, lp);
}