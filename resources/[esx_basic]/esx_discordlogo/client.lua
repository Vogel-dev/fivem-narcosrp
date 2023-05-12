Citizen.CreateThread(function()
	while true do
        --This is the Application ID (Replace this with you own)
		SetDiscordAppId(693850216201453708)

        --Here you will have to put the image name for the "large" icon.
		SetDiscordRichPresenceAsset('discord_bot')
        
        --(11-11-2018) New Natives:

        --Here you can add hover text for the "large" icon.
        SetDiscordRichPresenceAssetText('🔪 NarcosRP - Kryminogenny Serwer RolePlay')
       
        --Here you will have to put the image name for the "small" icon.
        SetDiscordRichPresenceAssetSmall('discord_bot')

        --Here you can add hover text for the "small" icon.
        SetDiscordRichPresenceAssetSmallText('discord.gg/hwyDkaJ')

        --It updates every one minute just in case.
		Citizen.Wait(60000)
	end
end)