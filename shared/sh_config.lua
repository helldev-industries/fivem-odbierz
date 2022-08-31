SharedConfig = {};

SharedConfig.Items = {
    -- Skrzyneczka
    {
        type = 'item',
        item = 'crimowa',
        count = function() return math.random(1, 3) end,
        chance = function() return 85 end, -- (%)
    },
    -- Pistolety
    {
        type = 'weaopon',
        item = 'weapon_pistol',
        count = function() return math.random(1, 3) end,
        ammo = function() return math.random(50, 250) end,
        chance = function() return 100 end, -- (%)
    },
    {
        type = 'weaopon',
        item = 'weapon_vintagepistol',
        count = function() return math.random(1, 3) end,
        ammo = function() return math.random(50, 250) end,
        chance = function() return 35 end, -- (%)
    },
    -- Redbull
    {
        type = 'item',
        item = 'kawa',
        count = function() return math.random(3, 35) end,
        chance = function() return 85 end, -- (%)
    },
    -- Magazynek
    {
        type = 'item',
        item = 'clip',
        count = function() return math.random(3, 10) end,
        chance = function() return 100 end, -- (%)
    },
    -- Food
    {
        type = 'item',
        item = 'water',
        count = function() return math.random(3, 25) end,
        chance = function() return 100 end, -- (%)
    },
    {
        type = 'item',
        item = 'bread',
        count = function() return math.random(3, 25) end,
        chance = function() return 100 end, -- (%)
    },
}

SharedConfig.Time = function() return 12 * 60 * 60 * 1000 end