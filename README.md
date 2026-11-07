# Space Standby

In a fight, **Space** uses **Standby** for the character who is choosing a skill.

## What it changes

| In the game | With this mod |
| --- | --- |
| Space is Cancel in the fight's menus | Space uses Standby, when the character can use it now |
| Clicking the Standby button | Unchanged |
| No Standby equipped, no uses left, or locked | Space is still Cancel |
| Auto battle, enemy turns, scenes | Unchanged |

"Can use it now" means what the Standby button shows: when the button is greyed out, Space does what
the game does.

## Keys and settings

**Space** during an ally's skill choice. Right click (Cancel), **A** (Auto), **.** (Surrender) and
**P** (Swap) are unchanged.

## Saves

Nothing.

## Works with

Other mods that claim keys in skill select: each runs in load order until one picks a skill.

## Install

Needs [RQ MOD](https://github.com/RQ-Modding/RQ-Mod) with loader **1.0.0** or newer. Extract the
release zip into the game's `mods` folder, so that you have `mods/space-standby/mod.json`.

## How it works

```lua
rq.battle.install()
rq.battle.on_select_key(function(ctx)
  if ctx.key ~= 32 then return nil end              -- Space
  local a = rq.battle.actor()
  if a and rq.battle.skill_usable(a, 384) then return 384 end  -- 384: Standby
end)
```

## License

MIT, see [LICENSE](LICENSE).
