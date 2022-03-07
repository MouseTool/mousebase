local linkedlist = require("@mousetool/linkedlist")

--- Loop and runtime component for Transformice.
local Loop = require("@mousetool/class"):extend "Loop"



--- @class Loop.LoopOptions
-- threshold : in percentage, how much of the cycle runtime until the system tries to postpone tasks (default 85)
-- warnThreshold : in percentage, how much runtime should a task consume until it's warned (default 40)
-- limitPerCycle : runtime limit in milliseconds (default 60)
-- cycleDuration : the duration of a cycle in milliseconds (default 4000)


-- function eventKeyboard()

--         hardbeat.loop.sendTick()
--     hardbeat.loop.queuepoll

--     tfmevent:emit("keyboard")
--         foreach e cb do
--             e()
--         end
-- end

-- timerCb
-- pendngCb
-- evtCb

--- @class Loop.QueueOptions
--- The priority level of `callback`.
--- This option is **currently NO-OP** as phase queues will be drained on FIFO basis until another update.
--- @field priority integer
--- Execute the `callback` in the current tick or never. (default `false`) \
--- If this is `false`, the callback may be allowed to propoagate to the next tick(s).
--- @field nowOrNever boolean
--- Guarantee that the `callback` will only be executed after the current function scope or coroutine that queues this callback (meaning not
--- instantaneously). (default `true`)
--- @field afterScope boolean #
--- @field strictLoop boolean #



--- Schedules a function to be called in the poll phase.
--- @param callbackFnc fun()
--- @param options Loop.QueueOptions
function Loop.queuePoll(callbackFnc, options)
end

--- Schedules a function to be called in the poll phase.
--- @param callbackFnc fun()
--- @param options Loop.QueueOptions
function Loop.queueLoop(callbackFnc, options)
end


--- @alias Loop.TickType
---| '"loop"'
---| '"immediate"'

--- Send a tick to register the runtime usage in the current cycle.
--- @param type Loop.TickType
function Loop.sendTick(type)

end


return Loop
