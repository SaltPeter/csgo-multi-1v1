#include <sourcemod>
#include <clientprefs>

bool readyPlayerOne = false;
bool readyPlayerTwo = false;
int playerOneScore = 0;
int playerTwoScore = 0;

public Plugin:myinfo = {
	name = "DraftProMM",
	author = "xrlk",
	description = "A 1v1 money match plugin.",
	version = "0.1",
	url = "https://csgodraftpro.com"
}

/** sm_guns command **/
public Action Command_Guns(int client, int args) {
	
}

public OnPluginStart() {
	
	// Event hooks
	HookEvent("player_spawn", OnPlayerSpawn);
	
	// Set !guns command.
	RegConsoleCmd("sm_guns", Command_Guns, "Displays gun selection menu.");
}

/*
* Once the player picks a team and spawns, they're given the "!guns" notification.
* aka after the player has been set up
* When a player spawns on their respective team, they're given the default pistol and a knife.
* Command shortcuts are: !m4a4 !m4a1 !m4a1s !m4a1-s !m4 !m4silenced !ak47
* !usp45 !usp-45 !usp !p2000 !p2k !glock !deagle
*/

public Action GunHandler(int client) {
	PrintToChat(client, "\x01\x0B\x05[MM]\x01 Type \x05!guns\x01 to select your loadout.");
	/*
	* Store player's gun preferences as a cookie in the server.
	* Add the player's gun preferences to the their user table in the database (MySql).
	* 
	* 
	* 
	* 
	* 
	*/
}

public Action OnClientSayCommand(int client, const char[] command, const char[] sArgs) {
    char gunsChatCommands[][] = { "gun", "guns", ".gun", ".guns", "!gun", "!guns", "gnus" };

    for (int i = 0; i < sizeof(gunsChatCommands); i++) {
        if (strcmp(sArgs[0], gunsChatCommands[i], false) == 0) {
			
			
			/* Block the client's messsage from broadcasting */
 			return Plugin_Handled;
        }
    }

	/* Let say continue normally */
	return Plugin_Continue;
}

/**
* Player spawn event - gives the appropriate weapons to a player for his arena.
* Warning: do NOT assume this is called before or after the round start event!
*/
public Action OnPlayerSpawn(Event event, const char[] name, bool dontBroadcast) {
	int client = GetClientOfUserId(event.GetInt("userid"));
	GunHandler(client);
}
