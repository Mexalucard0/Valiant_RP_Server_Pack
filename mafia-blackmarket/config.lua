Config = {}

Config.AlignMenu = "center"
Config.DisplayMarkerDistance = 5.0 -- Distance you need to be under to see marker.
Config.Location = vector3(1397.68, 1164.2, 114.32) -- Location of shop.

Config.SellableItems = {
    {
        ["isItem"] = true, -- true if it is an item, false for weapon.
        ["item"] =  "cokebrick", -- the item/weapon spawn name.
        ["label"] = "100G Coke", -- label for menu.
        ["price"] = 1, -- The price.
        ["amount"] = 25 -- The amount of the item/weapon in the shop.
    },
    {
        ["isItem"] = true, -- true if it is an item, false for weapon.
        ["item"] =  "drugbags", -- the item/weapon spawn name.
        ["label"] = "Drug Bags", -- label for menu.
        ["price"] = 1, -- The price.
        ["amount"] = 100 -- The amount of the item/weapon in the shop.
    },
    {
        ["isItem"] = true, -- true if it is an item, false for weapon.
        ["item"] =  "drugscales", -- the item/weapon spawn name.
        ["label"] = "Digital Scale", -- label for menu.
        ["price"] = 1, -- The price.
        ["amount"] = 5 -- The amount of the item/weapon in the shop.
    },  
             
}