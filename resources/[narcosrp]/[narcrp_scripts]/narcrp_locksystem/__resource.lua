resource_manifest_version "05cfa83c-a124-4cfa-a768-c24a5811d8f9"

client_scripts {
    '@es_extended/locale.lua',
    "config/shared.lua",
    "client/VehicleManager_CL.lua",
    "client/client.lua",
    'locales/en.lua',
    'locales/pl.lua'
}

server_scripts {
    '@es_extended/locale.lua',
	'@mysql-async/lib/MySQL.lua',
    "config/shared.lua",
    "server/chatCommand.lua",
    "server/server.lua",
    'locales/en.lua',
    'locales/pl.lua'
}

ui_page 'client/html/index.html'

files {
    'client/html/index.html',
    'client/html/sounds/lock.ogg',
    'client/html/sounds/unlock.ogg'
}