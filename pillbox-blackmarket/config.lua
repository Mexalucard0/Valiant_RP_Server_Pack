Config = {}

Config.AlignMenu = "center"
Config.DisplayMarkerDistance = 5.0 -- Distance you need to be under to see marker.
Config.Location = vector3(309.4, -561.0, 43.28) -- Location of shop.

Config.SellableItems = {
    {
        ["isItem"] = true, -- true if it is an item, false for weapon.
        ["item"] =  "bandage", -- the item/weapon spawn name.
        ["label"] = "Bandages", -- label for menu.
        ["price"] = 1, -- The price.
        ["amount"] = 100 -- The amount of the item/weapon in the shop.
    },
    {
        ["isItem"] = true, -- true if it is an item, false for weapon.
        ["item"] =  "medikit", -- the item/weapon spawn name.
        ["label"] = "Medical Kit", -- label for menu.
        ["price"] = 1, -- The price.
        ["amount"] = 100 -- The amount of the item/weapon in the shop.
    },
    {
        ["isItem"] = true, -- true if it is an item, false for weapon.
        ["item"] =  "mixapero", -- the item/weapon spawn name.
        ["label"] = "Smoothie", -- label for menu.
        ["price"] = 1, -- The price.
        ["amount"] = 100 -- The amount of the item/weapon in the shop.
    },  
             
}