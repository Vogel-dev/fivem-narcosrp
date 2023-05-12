DiscordWebhookSystemInfos = 'https://discordapp.com/api/webhooks/693881537527021608/QLYwbTSb-qYpcQfe82Hyms5AyEz6rLljKPHylA0_kfioyW_vjZW80QjMsP-90i-YH0Lz'
DiscordWebhookKillinglogs = 'https://discordapp.com/api/webhooks/693856521620291631/GBjOIpVoVJYNjw960J_u2SPEhvHBTNczHSrU_WTuWLRlmoPFhdCEThaooxniw-2UWhDL'
DiscordWebhookChat = 'https://discordapp.com/api/webhooks/693881730230255728/o44IM2TRWmw5wMDmtaXMt_DpaKfKKiosi23bJAa0FnzjbF3mHrCwWMTyMoKOe3qKtqNX'

SystemAvatar = 'https://i.imgur.com/3vnUDSl.png'

UserAvatar = 'https://i.imgur.com/3vnUDSl.png'

SystemName = 'narcosrp_logs'


--[[ Special Commands formatting
		 *YOUR_TEXT*			--> Make Text Italics in Discord
		**YOUR_TEXT**			--> Make Text Bold in Discord
	   ***YOUR_TEXT***			--> Make Text Italics & Bold in Discord
		__YOUR_TEXT__			--> Underline Text in Discord
	   __*YOUR_TEXT*__			--> Underline Text and make it Italics in Discord
	  __**YOUR_TEXT**__			--> Underline Text and make it Bold in Discord
	 __***YOUR_TEXT***__		--> Underline Text and make it Italics & Bold in Discord
		~~YOUR_TEXT~~			--> Strikethrough Text in Discord
]]
-- Use 'USERNAME_NEEDED_HERE' without the quotes if you need a Users Name in a special command
-- Use 'USERID_NEEDED_HERE' without the quotes if you need a Users ID in a special command


-- These special commands will be printed differently in discord, depending on what you set it to
SpecialCommands = {
				   {'/ooc', '*[OOC]:*'},
				   {'/911', '**[911]: (CALLER ID: [ USERNAME_NEEDED_HERE | USERID_NEEDED_HERE ])**'},
				   {'/twt', '***[TWEET]***:'},
				   {'/dw', '**[DW]**:'},
				   {'/ad', '**[AD]**:'},
				   {'/print', '**[AD]**:'},
				   --{'/me', '**[ME]**:'},
				   --{'/do', '*[DO]*:'},
				  }

						
-- These blacklisted commands will not be printed in discord
BlacklistedCommands = {
					  -- '/giveitem',
					   --'/giveweapon',
					  -- '/setmoney',
					  }

-- These Commands will use their own webhook
OwnWebhookCommands = {
					  {'/AnotherCommand', 'WEBHOOK_LINK_HERE'},
					  {'/AnotherCommand2', 'WEBHOOK_LINK_HERE'},
					 }

-- These Commands will be sent as TTS messages
TTSCommands = {
			   --'/dw',
			   '/Whatever2',
			  }

