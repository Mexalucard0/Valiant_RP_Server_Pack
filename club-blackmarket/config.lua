Config = {}

Config.AlignMenu = "center"
Config.DisplayMarkerDistance = 5.0 -- Distance you need to be under to see marker.
Config.Location = vector3(-796.6, 328.0, 187.32) -- Location of shop.

Config.SellableItems = {
    {
        ["isItem"] = true, -- true if it is an item, false for weapon.
        ["item"] =  "lsdtab", -- the item/weapon spawn name.
        ["label"] = "Tab of LSD", -- label for menu.
        ["price"] = 10, -- The price.
        ["amount"] = 100 -- The amount of the item/weapon in the shop.
    },           
}