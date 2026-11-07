# Testing Space Standby

For people and agents who test the mod in the game. Read it before you press Space in a fight.
Check `logs\rqmod.log` for `Loading space-standby` first.

## What it adds

No buttons and no `rq.agent.control` ids. Do not invent controls for it. It changes what **Space**
does while an ally chooses a skill: with this mod installed, Space during skill select can end that
ally's turn with Standby.

## How to check it

1. An ally with Standby (384) equipped and uses left: Space during their skill choice uses Standby,
   the turn moves on, and the uses go down by one.
2. Standby unequipped or at 0 uses: Space is Cancel, as in the game (the cursor jumps).
3. Right click, `A` (Auto), `.` (Surrender) and `P` (Swap) are unchanged.

## Test Lab

`agent-lab.ps1 run standby`: with Standby at 0 uses, Space leaves the turn alone and
`rq.battle.skill_usable` says false; with uses, Space takes Standby once.
