description 'ESX moneywash'

client_scripts {
	'@es_extended/locale.lua',
	'locales/en.lua',
	'config.lua',
	'client/main.lua'
}

server_scripts {
	'@es_extended/locale.lua',
	'locales/en.lua',
	'@mysql-async/lib/MySQL.lua',
	'config.lua',
	'server/main.lua'
}