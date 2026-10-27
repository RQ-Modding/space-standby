# space-standby

During **ally skill select**, **Space** ends the current unit’s choice with **Standby (384)** when that skill is in an equipped slot with uses remaining and not locked. Otherwise Space keeps Magnum’s normal **Cancel** behavior (`キー_キャンセル`: cursor remap / wait advance / auto-stop).

| Vanilla Magnum | This mod (Lua) |
| --- | --- |
| Space = Cancel in battle UI | Space → Standby **only** when usable |
| Click Standby button | Unchanged |
| No Standby / 0 uses / locked | Space still Cancel |
| Auto battle / enemy / ADV | Unchanged |

## API

```lua
rq.battle.install()
rq.battle.on_select_key(function(ctx)
  if ctx.key ~= 32 then return nil end
  local a = rq.battle.actor()
  if not a or not rq.battle.skill_usable(a, 384) then return nil end
  return 384
end)
```

No `on_select_key` → engine never claims Space (Cancel unchanged).

## Needs

1. Fork with `rq.battle.*` (install, on_select_key, actor helpers)
2. `rqmod\apply.ps1` → Magnum Mods only (never Magnum play)

Local-only git. No remote.

## Test

1. Magnum Mods boot: console / `mods\rqmod.log` shows `[space-standby]` and battle install log.
2. Ally with Standby equipped + uses left → Space → Standby log / turn ends; uses decrement.
3. Unequipped or 0 uses → Space still Cancel (cursor jump).
4. RMB Cancel, Auto (`A`), Surrender (`.`), Swap (`P`) unchanged.
