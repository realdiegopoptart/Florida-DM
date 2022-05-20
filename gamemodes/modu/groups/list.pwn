// CREATE NEW GROUPS HERE!
/*
Format of {int=groupid, str="group name", str="group tag", str="group message"}
*/

enum groupEnum
{
    groupID,
	groupName[32],
    groupTag[5],
	groupLeader[42]
};

new const GroupInfo[][groupEnum] =
{
	{1, "poptard",    "TARD", "realdiegopoptart"},
	{2, "Test Group", "TEST", "beta testers"}
};