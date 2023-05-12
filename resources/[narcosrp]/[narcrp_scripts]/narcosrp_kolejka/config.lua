Config = {}

----------------------------------------------------
-------- Intervalles en secondes -------------------
----------------------------------------------------

-- Temps d'attente Antispam / Waiting time for antispam
Config.AntiSpamTimer = 6

-- Vérification et attribution d'une place libre / Verification and allocation of a free place
Config.TimerCheckPlaces = 3

-- Mise à jour du message (emojis) et accès à la place libérée pour l'heureux élu / Update of the message (emojis) and access to the free place for the lucky one
Config.TimerRefreshClient = 3

-- Mise à jour du nombre de points / Number of points updating
Config.TimerUpdatePoints = 3

----------------------------------------------------
------------ Nombres de points ---------------------
----------------------------------------------------

-- Nombre de points gagnés pour ceux qui attendent / Number of points earned for those who are waiting
Config.AddPoints = 5

-- Nombre de points perdus pour ceux qui sont entrés dans le serveur / Number of points lost for those who entered the server
Config.RemovePoints = 1

-- Nombre de points gagnés pour ceux qui ont 3 emojis identiques (loterie) / Number of points earned for those who have 3 identical emojis (lottery)
Config.LoterieBonusPoints = 3

-- Accès prioritaires / Priority access
Config.Points = {
	 {'steam:110000104eb808d', 1000},
	 {'steam:11000010fdc8544', 1000},
	 {'steam:110000114f63a7e', 1000}
}

----------------------------------------------------
------------- Textes des messages ------------------
----------------------------------------------------

-- Si steam n'est pas détecté / If steam is not detected
Config.NoSteam = "Autoryzacja Steam nie powiodła spróbuj jeszcze raz (Restart FiveM)"
-- Config.NoSteam = "Steam was not detected. Please (re)launch Steam and FiveM, and try again."

-- Message d'attente / Waiting text
Config.EnRoute = "Czekasz w kolejce już"
-- Config.EnRoute = "You are on the road. You have already traveled"

-- "points" traduits en langage RP / "points" for RP purpose
Config.PointsRP = "sekund/y"
-- Config.PointsRP = "kilometers"

-- Position dans la file / position in the queue
Config.Position = "Twoja pozycja w kasie po bilety  "
-- Config.Position = "You are in position "

-- Texte avant les emojis / Text before emojis
Config.EmojiMsg = "Jeśli emotki się nie zmieniają, uruchom ponownie fiveM'a : "
-- Config.EmojiMsg = "If the emojis are frozen, restart your client: "

-- Quand le type gagne à la loterie / When the player win the lottery
Config.EmojiBoost = "" .. Config.LoterieBonusPoints .. " " .. Config.PointsRP .. " Masz pierszeństwo !!!"
-- Config.EmojiBoost = "!!! Yippee, " .. Config.LoterieBonusPoints .. " " .. Config.PointsRP .. " won !!!"

-- Anti-spam message / anti-spam text
Config.PleaseWait_1 = "🔪Proszę czekać "
Config.PleaseWait_2 = " sekundy, zaraz otworzą kase po bilety!🔪"
-- Config.PleaseWait_1 = "Please wait "
-- Config.PleaseWait_2 = " seconds. The connection will start automatically!"

-- Me devrait jamais s'afficher / Should never be displayed
Config.Accident = "Ups, kolejka została zamknięta, spróbuj ponownie "
-- Config.Accident = "Oops, you just had an accident ... If it happens again, you can inform the support :)"

-- En cas de points négatifs / In case of negative points
Config.Error = " Masz jakiś jakiś błąd z dowodem, żeby go naprawić napisz do administacji!"
-- Config.Error = " ERROR : RESTART THE QUEUE SYSTEM AND CONTACT THE SUPPORT "


Config.EmojiList = {
	'🐌', 
	'🐍',
	'🐎', 
	'🐑', 
	'🐒',
	'🐘', 
	'🐙', 
	'🐛',
	'🐜',
	'🐝',
	'🐞',
	'🐟',
	'🐠',
	'🐡',
	'🐢',
	'🐤',
	'🐦',
	'🐧',
	'🐩',
	'🐫',
	'🐬',
	'🐲',
	'🐳',
	'🐴',
	'🐅',
	'🐈',
	'🐉',
	'🐋',
	'🐀',
	'🐇',
	'🐏',
	'🐐',
	'🐓',
	'🐕',
	'🐖',
	'🐪',
	'🐆',
	'🐄',
	'🐃',
	'🐂',
	'🐁',
	'🔥'
}
