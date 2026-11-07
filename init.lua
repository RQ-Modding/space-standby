-- During ally skill select, Space uses Standby (384) when equipped and usable.
-- Otherwise Space keeps Magnum Cancel (cursor remap / wait advance / auto-stop).
-- Engine only wraps select + checkKey; policy is Lua.

local STANDBY = rq.ids.skill.STANDBY
local SPACE = 32

rq.log("Space → Standby when equipped+usable; else Cancel")

if not rq.battle.install() then
  error("space-standby: rq.battle.install failed (see logs/rqmod.log)")
end

rq.battle.on_select_key(function(ctx)
  if ctx.key ~= SPACE then
    return nil
  end
  local a = rq.battle.actor()
  if not a or not rq.battle.skill_usable(a, STANDBY) then
    return nil
  end
  return STANDBY
end)
