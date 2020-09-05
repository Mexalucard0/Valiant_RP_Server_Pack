# Trailers

## Notes
- Trailers allows players to attach vehicles to any configured trailer in-game.
- Trailers support is extremely simple to add, with minimal configuration needed to work perfectly (copy paste the current examples and change the model).
- Store trailers with attached vehicles at pre-defined deposit points.
- Proper trailer attaching, sticking the vehicle in the exact location you placed it on the trailer (with no weird rotation or position offsets).
- Ownership protection (other players cannot store your trailers or remove a vehicle from them).
- Specified jobs (in the config file) can remove/detach vehicles from any trailer (police or mechanic by default).
- NOTE: No trailer models are supplied with this mod. You will be responsible for acquiring and configuring your own trailers (support for configuration given through discord).

## Installation
- Drag folder into server resources folder.
- Start mod in server.cfg
- Set credentials correctly in credentials.lua (related to your modit.store receipt and email)
- Configure the mod for your server through the config.lua
- The mod may take up to 24 hours to authorize. It is automatic, and you will not need to contact us before the 24 hour period is over.
- If you are not authorized past the 24 hour mark, contact us on the discord:
- https://discord.gg/4S7FcFs

## Usage
- All controls are visual in-game, there should be no further explaination required for basic use.
- To store a trailer, the player must be near a deposit marker and be looking in the direction of a trailer.
- You can add your own trailers in the cfg.lua under the 'trailer_models' table.
- Your trailer TYPE (column in the database) must be a "trailer" in order for the vehicle to be accessible at the trailer points.

## Requirements
- ESX

## Disclaimer
The entire server-side of this script is remote loaded. You will not be able to edit or view the contents in any way.
This is a security measure to prevent retrading/reselling of our products. Please consider the implications of this disclaimer before purchasing.