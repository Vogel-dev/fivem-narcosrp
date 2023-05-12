local logs = "https://discordapp.com/api/webhooks/693849123144597595/RFXHgn1tNNumdx6jSxxo39pvIGFXSsr0cMkIIUY9_eVi6Tuz9OcBCje_l11k9n87hA48"
local communityname = "narcosrp_connections"
local communtiylogo = "https://i.imgur.com/3vnUDSl.png" --Must end with .png

AddEventHandler('playerConnecting', function()
local name = GetPlayerName(source)
local ip = GetPlayerEndpoint(source)
local ping = GetPlayerPing(source)
local steamhex = GetPlayerIdentifier(source)
local connect = {
        {
            ["color"] = "56108",
            ["title"] = "Gracz dołączył do serwera",
            ["description"] = "Nick: **"..name.."**\nIP: **"..ip.."**\n Steam Hex: **"..steamhex.."**",
	        ["footer"] = {
                ["text"] = communityname,
                ["icon_url"] = communtiylogo,
            },
        }
    }

PerformHttpRequest(logs, function(err, text, headers) end, 'POST', json.encode({username = "NarcosRP - Połączenia", embeds = connect}), { ['Content-Type'] = 'application/json' })
end)

AddEventHandler('playerDropped', function(reason)
local name = GetPlayerName(source)
local ip = GetPlayerEndpoint(source)
local ping = GetPlayerPing(source)
local steamhex = GetPlayerIdentifier(source)
local disconnect = {
        {
            ["color"] = "16711680",
            ["title"] = "Gracz został rozłączony z serwerem",
            ["description"] = "Nick: **"..name.."** \nPowód: **"..reason.."**\nIP: **"..ip.."**\n Steam Hex: **"..steamhex.."**",
	        ["footer"] = {
                ["text"] = communityname,
                ["icon_url"] = communtiylogo,
            },
        }
    }

    PerformHttpRequest(logs, function(err, text, headers) end, 'POST', json.encode({username = "NarcosRP - Połączenia", embeds = disconnect}), { ['Content-Type'] = 'application/json' })
end)
