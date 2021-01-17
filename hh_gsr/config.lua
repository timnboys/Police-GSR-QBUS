Config = {}

Config.gsrUpdate                = 2 * 1000          -- Change first number only, how often a new shot is logged dont set this to low keep it above 1 min - raise if you experience performance issues (default: 1 min).
Config.waterClean               = true              -- Set to false if you dont want water to clean off GSR from people who shot
Config.waterCleanTime           = 30 * 1000         -- Change first number only, Set time in water needed to clean off GSR (default: 30 sec).
Config.gsrTime                  = 30 * 60           -- Change The first number only, if you want the GSR to be auto removed faster output is minutes (default: 30 min).
Config.gsrAutoRemove            = 10 * 60 * 1000    -- Change first number only, to set the auto clean up in minuets (default: 10 min).
Config.gsrUpdateStatus          = 7 * 60 * 1000     -- Change first number only, to change how often the client updates hasFired variable dont set it very high... 5-10 min should be fine. (default: 5 min).

Config.weaponChecklist = {
    --Get models id here : https://pastebin.com/0wwDZgkF
    ---YOU CAN ADD MORE
	0x3656C8C1, -- StunGun
	0x678B81B1, -- NightStick
	0x84BD7BFD, -- CrowBar
    0x60EC506, 	-- Fire Extinguisher
    0x34A67B97, --PetrolCan
    0x4E875F73, --Hammer
    0x958A4A8F, --Bat
    0xD8DF3C3C, --Knuckle
    0xF9DCBF2D, --Hatchet
}
