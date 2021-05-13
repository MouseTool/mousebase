--- MouseBase player class.
--- @class MbPlayer:EventEmitter
--- @field public name string @The player's A801 name
--- @field public nameId string @The player's A801 name, transformed as a consistent name identifier
--- @field public isSouris boolean @Whether the player is a souris (guest)
--- @field public inRoom boolean @Whether the player is currently in the room
local Player = require("EventEmitter"):extend("MbPlayer")

local nickname801 = require("@mousetool/nickname801")
local nickname801_isSouris = nickname801.isSouris
local nickname801_idName = nickname801.idName

local roomGet = tfm.get.room

--- @param name string The name of the player
--- @param inRoom boolean|nil Whether the player is in the room
Player._init = function(self, name, inRoom)
    Player._parent._init(self)

    self.name = name
    self.nameId = nickname801_idName(name)
    self.isSouris = nickname801_isSouris(name)
    self.inRoom = inRoom or false
end

--- Retrieves the indexed playerList of the player.
--- @return TfmPlayer
Player.getTfmPlayer = function(self)
    return roomGet.playerList[self.name]
end

--- Displays a chat message to the player.
--- @param messsge string
Player.chatMsg = function(self, messsge)
    tfm.exec.chatMessage(messsge, self.name)
end

return Player
