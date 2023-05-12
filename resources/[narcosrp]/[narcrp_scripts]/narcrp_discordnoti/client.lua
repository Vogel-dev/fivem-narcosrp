RegisterCommand("discord", function()
    wiad("Oficjalny discord serwera - discord.gg/hwyDkaJ")
end, false)

function wiad(text)
    TriggerEvent('chat:addMessage', {
        template = '<div style="text-shadow: 1.2px 1.2px 1.2px #000000; -webkit-box-shadow: 0px 5px 5px -5px #000000; box-shadow: 0px 5px 5px -5px #000000; padding: 0.35vw; margin: 0.2vw; background-color: rgba(35, 35, 35, 0.5); border-radius: 25px; margin-left: 0; margin-right: 0;"<i class="fab fa-discord"></i> ^5^*  Oficjalny discord serwera - discord.gg/hwyDkaJ^7 </div>',
        args = { text }
    })
end