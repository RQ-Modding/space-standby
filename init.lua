-- During ally skill select, Space uses Standby (384) when equipped and usable.
-- Otherwise Space keeps Magnum Cancel (cursor remap / wait advance / auto-stop).
-- Engine only wraps select + checkKey; policy is Lua.

rq.log("Space → Standby (384) when equipped+usable; else Cancel")

if not rq.battle.install() then
  error("space-standby: rq.battle.install failed (see mods/rqmod.log)")
end

rq.battle.on_select_key(function(ctx)
  if ctx.key ~= 32 then
    return nil
  end
  local a = rq.battle.actor()
  if not a or not rq.battle.skill_usable(a, 384) then
    return nil
  end
  return 384
end)
