local ESX = exports['es_extended']:getSharedObject()

MySQL.ready(
    function()
        local data = tostring(LoadResourceFile(GetCurrentResourceName(), './sql/sql.sql'))
        MySQL.Sync.Query(data, {})
    end
)

RegisterCommand(
    'odbierz',
    function(source, args)
        local xPlayer = ESX.GetPlayerFromId(source);
        local ids = ExtractIdentifiers(source)

        local dbData = MySQL.Sync.query('SELECT * FROM phant_odbierz WHERE identifier = ?', {ids.steam})

        if not dbData then
            dbData = MySQL.Sync.insert(
                'INSERT INTO phant_odbierz (identifier, expires) VALUES (?, ?)',
                {ids.steam, os.time(os.date('!*t'))}
            )
        end

        if dbData.expires > os.time(os.date('!*t')) then
            xPlayer.showNotification('~r~Ten zestaw możesz odebrać dopiero ' ..os.date('%Y-%m-%d %H:%M:%S', dbData.expires));
            return;
        end

        for _, v in pairs(SharedConfig.Items) do
            local percent = math.random(100)

            if percent <= v.chance() then
                if v.type == 'item' then
                    xPlayer.addInventoryItem(v.item, v.count());
                elseif v.type == 'weapon' then
                    xPlayer.addInventoryWeapon(string:upper(v.weapon), v.count(), v.ammo(), true);
                end
            end
        end

        local time = os.time(os.date('!*t')) + SharedConfig.Time();
        

        MySQL.Sync.query('UPDATE phant_odbierz SET expires = ? WHERE identifier = ?', {time, ids.steam})

        xPlayer.showNotification('~g~Odebrałeś/aś zestaw')

    end
)

function ExtractIdentifiers(src)
    local identifiers = {}

    for i = 0, GetNumPlayerIdentifiers(src) - 1 do
        local id = GetPlayerIdentifier(src, i)

        if string.find(id, 'steam:') then
            identifiers['steam'] = id
        elseif string.find(id, 'ip:') then
            identifiers['ip'] = id
        elseif string.find(id, 'discord:') then
            identifiers['discord'] = id
        elseif string.find(id, 'license:') then
            identifiers['license'] = id
        elseif string.find(id, 'license2:') then
            identifiers['license2'] = id
        elseif string.find(id, 'xbl:') then
            identifiers['xbl'] = id
        elseif string.find(id, 'live:') then
            identifiers['live'] = id
        elseif string.find(id, 'fivem:') then
            identifiers['fivem'] = id
        end
    end

    return identifiers
end
