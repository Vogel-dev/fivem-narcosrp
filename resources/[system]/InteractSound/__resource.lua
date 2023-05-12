
------
-- InteractSound by Scott
-- Verstion: v0.0.1
------

-- Manifest Version
resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'

-- Client Scripts
client_script 'client/main.lua'

-- Server Scripts
server_script 'server/main.lua'

-- NUI Default Page
ui_page('client/html/index.html')

-- Files needed for NUI
-- DON'T FORGET TO ADD THE SOUND FILES TO THIS!
files({
    'client/html/index.html',
    -- Begin Sound Files Here...
    -- client/html/sounds/ ... .ogg
    'client/html/sounds/on.ogg',
    'client/html/sounds/off.ogg',
	'client/html/sounds/lock.ogg',
    'client/html/sounds/unlock.ogg',
    'client/html/sounds/demo.ogg',
	'client/html/sounds/belt.ogg',
	'client/html/sounds/belton.ogg',
	'client/html/sounds/crash01.ogg',
	'client/html/sounds/seatbelt.ogg',
	'client/html/sounds/heartbeat.ogg',
	'client/html/sounds/kajdanki.ogg'
})
