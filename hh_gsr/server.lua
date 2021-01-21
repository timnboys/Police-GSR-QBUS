QBCore = nil
gsrData = {}

TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

QBCore.Commands.Add("gsr", "Do GSR Test ", {{name ="id ", help="Player ID"}}, true, function(source, args)
    local src = source
    local xPlayer = QBCore.Functions.GetPlayer(src)
    local number = tonumber(args[1])
    if args[1] ~= nil then 
		if xPlayer.PlayerData.job.name == 'police' and type(number) == "number" then
        	CancelEvent()
        	local identifier = GetPlayerIdentifiers(number)[1]
        	if identifier ~= nil then
            	gsrcheck(source, identifier)
        	end
    	else
            TriggerClientEvent("QBCore:Notify", src, 'You must be a cop to use the Gun Powder test', "error", 5000)
    	end
	else
        TriggerClientEvent("QBCore:Notify", src, 'Correct Usage Is: /gsr (player id)', "error", 5000)
	end
end)

AddEventHandler('playerDropped', function()
    local src = source
    local identifier = GetPlayerIdentifiers(src)[1]
    if gsrData[identifier] ~= nil then
        gsrData[identifier] = nil
    end
end)

RegisterNetEvent("GSR:Remove")
AddEventHandler("GSR:Remove", function()
    local src = source
    local identifier = GetPlayerIdentifiers(src)[1]
    if gsrData[identifier] ~= nil then
        gsrData[identifier] = nil
    end
end)

RegisterServerEvent('GSR:SetGSR')
AddEventHandler('GSR:SetGSR', function()
    local src = source
    local identifier = GetPlayerIdentifiers(src)[1]
    gsrData[identifier] = os.time(os.date("!*t")) + Config.gsrTime
end)



function gsrcheck(source, identifier)
    local src = source
    local identifier = identifier
    local Player = QBCore.Functions.GetPlayer(identifier)
    local nameData = Player.PlayerData.charinfo
	Wait(100)
    local fullName = string.format("%s %s", nameData.firstname, nameData.lastname)
    if gsrData[identifier] ~= nil then
        TriggerClientEvent("QBCore:Notify", src, 'Test for '..fullName..' comes back POSITIVE (Has Shot)', "success", 8000)
    else
        TriggerClientEvent("QBCore:Notify", src, 'Test for '..fullName..' comes back NEGATIVE (Has Not Shot)', "error", 8000)
    end
end



QBCore.Functions.CreateCallback('GSR:Status', function(source, cb)
    local src = source
    local identifier = GetPlayerIdentifiers(src)[1]
    if gsrData[identifier] ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

function removeGSR()
    for k, v in pairs(gsrData) do
        if v <= os.time(os.date("!*t")) then
            gsrData[k] = nil
        end
    end
end

function gsrTimer()
    removeGSR()
    SetTimeout(Config.gsrAutoRemove, gsrTimer)
end

gsrTimer()
