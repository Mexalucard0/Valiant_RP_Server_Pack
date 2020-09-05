Config = {}

Config.AlignMenu = "center"
Config.DisplayMarkerDistance = 5.0 -- Distance you need to be under to see marker.
Config.Location = vector3(-799.0, 170.68, 76.76) -- Location of shop.

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
        ["item"] =  "rolpaper", -- the item/weapon spawn name.
        ["label"] = "Rolling Papers", -- label for menu.
        ["price"] = 1, -- The price.
        ["amount"] = 100 -- The amount of the item/weapon in the shop.
    },  
             
}