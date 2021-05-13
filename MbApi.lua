--- Main API initializer for Transformice.
--- @class MbApi:EventEmitter
--- @field tfmEvent MbTfmEvent

local MbPlayer = require("MbPlayer")

local cached_api

--- @return MbApi
local createApi = function()
    -- Private vars
    local TfmEvent = require("MbTfmEvent")
    local players = {}

    --- @type MbApi
    local Api = require("EventEmitter"):extend("MbApi")

    Api._init = function(self)
        Api._parent._init(self)
        self.tfmEvent = TfmEvent

        players = {}

        self:hookTfmEvents()
    end

    Api.hookTfmEvents = function(self)
        TfmEvent:onCrucial("NewPlayer", function(pn)
            local p = MbPlayer:new(pn, true)
            players[pn] = p

            self:emit("newPlayer", p)
        end)

        TfmEvent:onCrucial("PlayerLeft", function(pn)
            local p = players[pn]
            if not p then return end

            p.inRoom = false
            players[pn] = nil
        end)

        TfmEvent:onCrucial("Keyboard", function(pn, k, down, xPos, yPos)
            local p = players[pn]
            if not p then return end

            self:emit("keyboard", p, k, down, xPos, yPos)
            p:emit("keyboard", k, down, xPos, yPos)
        end)
    end

    Api.emitExistingPlayers = function(self)
        for name, rp in pairs(tfm.get.room.playerList) do
            local p = MbPlayer:new(name, true)
            players[name] = p

            self:emit("newPlayer", p)
        end
    end

    Api.start = function(self)
        self:emitExistingPlayers()
        self:emit("ready")
    end

    return Api:new()
end

if cached_api then
    error("Tried to create more than one Api instance! This should only be created in the main program file, and optionally cached for future use.")
    return nil
end

return function()
    cached_api = createApi()
    return cached_api
end
