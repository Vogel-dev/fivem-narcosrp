resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'
--Tościk#9715

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'config.lua',
	'client/main.lua'
}

ui_page('client/html/index.html')

files({
    'client/html/index.html',
    ---
    'client/html/sounds/cuff.ogg'

})