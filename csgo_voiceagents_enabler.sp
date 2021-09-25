#include <sourcemod>
#include <sdktools>

char Master[][] =
{
	"models/player/custom_player/legacy/ctm_st6_varianti.mdl",
	"models/player/custom_player/legacy/ctm_fbi_variantb.mdl",
	"models/player/custom_player/legacy/tm_balkan_varianth.mdl",
	"models/player/custom_player/legacy/tm_leet_variantf.mdl",
}

#define DATA "1.0"

public Plugin myinfo =
{
	name = "[CS:GO] Franug Voice Agents Enabler",
	author = "Franc1sco franug",
	description = "Voice Agents",
	version = DATA,
	url = "http://steamcommunity.com/id/franug"
}

public void OnPluginStart()
{
	AddNormalSoundHook(VoiceLineSounds);
}

public Action:VoiceLineSounds(clients[64], &numClients, String:sample[PLATFORM_MAX_PATH], &client, &channel, &Float:volume, &level, &pitch, &flags)
{
	if(!IsValidClient(client) || !IsPlayerAlive(client))
		return Plugin_Continue;
		
	char model[128];
	GetClientModel(client, model, sizeof(model));
	
	int modelindex = getMasterModel(model);
	
	if(modelindex == 0)
		return Plugin_Continue;
		
	if(StrContains(sample, "player\\vo\\", false) == -1)
		return Plugin_Continue;		

	int iParts;
	char sParts[36][255];
	if((iParts = ExplodeString(sample, "\\", sParts, sizeof(sParts), sizeof(sParts[]))) <= 7)
	{
		int i = 0;
		for(i = 0; i < iParts; ++i)
		{
			if(i == 3)//Voice name path goes here.
			{
				char Output[64];
				char Tempp[64];
				strcopy(Tempp, sizeof(Tempp), sParts[i]);
				strcopy(Output, sizeof(Output), sParts[i]);
				PostEditSoundPath(Output, Output, 64);
				ReplaceString(sample, sizeof(sample), Tempp, Output);
				break;
			}
		}
		int replaces = 0;
		switch(modelindex)
		{
			case 4:
			{
				replaces += ReplaceString(sample, sizeof(sample), "anarchist", "leet_epic");
				replaces += ReplaceString(sample, sizeof(sample), "balkan", "leet_epic");
				replaces += ReplaceString(sample, sizeof(sample), "leet", "leet_epic");
				replaces += ReplaceString(sample, sizeof(sample), "phoenix", "leet_epic");
				replaces += ReplaceString(sample, sizeof(sample), "separatist", "leet_epic");	
				if (replaces == 0)return Plugin_Continue; // prevent work on epic models already bought
				char gg[255];
				PostEditSoundPath(sample, gg, 255);
				char Temp[255];
				strcopy(Temp, sizeof(Temp), gg);
				//PrintToChat(client, "antes %s",Temp);
				replaces += ReplaceString(Temp, sizeof(Temp), "__no", "_");
				replaces += ReplaceString(Temp, sizeof(Temp), "___", "_");
				replaces += ReplaceString(Temp, sizeof(Temp), "__", "_");
				replaces += ReplaceString(Temp, sizeof(Temp), "negative", "disagree");
				replaces += ReplaceString(Temp, sizeof(Temp), "request_request_", "request_");
				replaces += ReplaceString(Temp, sizeof(Temp), "sees_area_sees_area_sees_area_clear", "sees_area_clear");
				//PrintToChat(client, "despues %s",Temp);
				PrecacheSound(Temp);
				EmitSoundToAll(Temp, client, channel, level, flags, volume);
				return Plugin_Changed;
			}		
			case 3:
			{
				replaces += ReplaceString(sample, sizeof(sample), "anarchist", "balkan_epic");
				replaces += ReplaceString(sample, sizeof(sample), "balkan", "balkan_epic");
				replaces += ReplaceString(sample, sizeof(sample), "leet", "balkan_epic");
				replaces += ReplaceString(sample, sizeof(sample), "phoenix", "balkan_epic");
				replaces += ReplaceString(sample, sizeof(sample), "separatist", "balkan_epic");
				char gg[255];
				PostEditSoundPath(sample, gg, 255);
				replaces += ReplaceString(sample, sizeof(sample), gg, "");
	
				char Temp[255];
				strcopy(Temp, sizeof(Temp), gg);
				replaces += ReplaceString(Temp, sizeof(Temp), "___", "_");
				replaces += ReplaceString(Temp, sizeof(Temp), "__", "_");
				replaces += ReplaceString(Temp, sizeof(Temp), "request_request_", "request_");
				replaces += ReplaceString(Temp, sizeof(Temp), "sees_area_sees_area_sees_area_clear_", "sees_area_clear_");
				//replaces += ReplaceString(Temp, sizeof(Temp), "+player", "player");
				if (replaces == 0)return Plugin_Continue;
				
				PrecacheSound(Temp);
				EmitSoundToAll(Temp, client, channel, level, flags, volume);
				return Plugin_Handled;
			}	
			case 1:
			{
				replaces += ReplaceString(sample, sizeof(sample), "fbihrt", "seal_epic");
				replaces += ReplaceString(sample, sizeof(sample), "gign", "seal_epic");
				replaces += ReplaceString(sample, sizeof(sample), "idf", "seal_epic");
				replaces += ReplaceString(sample, sizeof(sample), "sas", "seal_epic");
				replaces += ReplaceString(sample, sizeof(sample), "swat", "seal_epic");
				replaces += ReplaceString(sample, sizeof(sample), "seal", "seal_epic");
				char gg[255];
				PostEditSoundPath(sample, gg, 255);
				char Temp[255];
				strcopy(Temp, sizeof(Temp), gg);
				replaces += ReplaceString(Temp, sizeof(Temp), "___", "_");
				replaces += ReplaceString(Temp, sizeof(Temp), "__", "_");
				replaces += ReplaceString(Temp, sizeof(Temp), "request_request_", "request_");
				replaces += ReplaceString(Temp, sizeof(Temp), "sees_area_sees_area_sees_area_clear_", "sees_area_clear_");
				if (replaces == 0)return Plugin_Continue;	
				
				PrecacheSound(Temp);
				EmitSoundToAll(Temp, client, channel, level, flags, volume);
				return Plugin_Changed;
			}	
			case 2:
			{
				
				replaces += ReplaceString(sample, sizeof(sample), "fbihrt", "fbihrt_epic");
				replaces += ReplaceString(sample, sizeof(sample), "gign", "fbihrt_epic");
				replaces += ReplaceString(sample, sizeof(sample), "idf", "fbihrt_epic");
				replaces += ReplaceString(sample, sizeof(sample), "sas", "fbihrt_epic");
				replaces += ReplaceString(sample, sizeof(sample), "swat", "fbihrt_epic");
				replaces += ReplaceString(sample, sizeof(sample), "seal", "fbihrt_epic");
				char gg[255];
				PostEditSoundPath(sample, gg, 255);
				char Temp[255];
				strcopy(Temp, sizeof(Temp), gg);
				//PrintToChat(client, "antes %s",Temp);
				replaces += ReplaceString(Temp, sizeof(Temp), "___", "_");
				replaces += ReplaceString(Temp, sizeof(Temp), "__", "_");
				replaces += ReplaceString(Temp, sizeof(Temp), "request_request_", "request_");
				replaces += ReplaceString(Temp, sizeof(Temp), "sees_area_sees_area_clear_", "sees_area_clear_");
				char fire[24];
				Format(fire, sizeof(fire), "takingfire_0%i", GetRandomInt(1, 7));
				replaces += ReplaceString(Temp, sizeof(Temp), "takingfire_11", fire);
				replaces += ReplaceString(Temp, sizeof(Temp), "takingfire_12", fire);

				if (replaces == 0)return Plugin_Continue;
				
				//PrintToChat(client, "despues %s",Temp);
				
				PrecacheSound(Temp);
				
				EmitSoundToAll(Temp, client, channel, level, flags, volume);
				return Plugin_Changed;
			}
			default:
				return Plugin_Continue;
		}		
	}
	return Plugin_Continue;
} 

PostEditSoundPath(String:input[], String:output[], int size)
{
	//Many of voice lines are different at the end of the path, sooooooo we have to change them to valid ones.
	ReplaceString(input, 255, "radiobotreponse", "");
	ReplaceString(input, 255, "radiobot", "");
	ReplaceString(input, 255, "positive", "affirmation_");
	ReplaceString(input, 255, "cheer", "cheer_");
	ReplaceString(input, 255, "hold", "request_hold_");
	ReplaceString(input, 255, "affirmative", "affirmation_");
	ReplaceString(input, 255, "agree", "agree_");
	ReplaceString(input, 255, "negative", "negative_");
	ReplaceString(input, 255, "negativeno", "negative_");
	ReplaceString(input, 255, "onarollbrag", "compliment_");
	ReplaceString(input, 255, "preventescapebrag", "compliment_");
	ReplaceString(input, 255, "radiobothold", "request_hold_");
	ReplaceString(input, 255, "radio_followme", "request_follow_me_");
	ReplaceString(input, 255, "radio_locknload", "request_follow_me_");
	ReplaceString(input, 255, "thanks", "thankful_");
	ReplaceString(input, 255, "radio_enemyspotted", "sees_enemy_");
	ReplaceString(input, 255, "radio_needbackup", "request_backup_");
	ReplaceString(input, 255, "followingfriend", "following_friend_");
	ReplaceString(input, 255, "clearedarea", "sees_area_clear_");
	ReplaceString(input, 255, "inposition", "at_position_");
	ReplaceString(input, 255, "spottedloosebomb", "sees_dropped_bomb_");
	ReplaceString(input, 255, "radiobotreponsepositive", "affirmation_");
	ReplaceString(input,255, "followme", "request_follow_me_");
	ReplaceString(input,255, "target", "sees_enemy_");
	ReplaceString(input,255, "underfire", "takingfire_");
	ReplaceString(input,255, "followyou", "following_friend_");
	ReplaceString(input, 255, "clear", "sees_area_clear_");
	ReplaceString(input, 255, "at_position", "omw_position");
	return Format(output, size, "%s", input);
}

int getMasterModel(char[] model)
{
	if(StrContains(model, "models/player/custom_player/legacy/") == -1) // player use a custom model by other plugin
		return 0;
		
	for (int i = 0; i < sizeof(Master); i++)
	{
		if(StrEqual(model, Master[i]))
		{
			return i+1;
		}			
	}
	return 0;
}

public bool IsValidClient(int client)
{
	if (!(1 <= client <= MaxClients) || !IsClientInGame(client))
		return false;
	
	return true;
}
