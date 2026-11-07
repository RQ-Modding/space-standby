# Changelog

Each section is a version of the mod, the `version` in `mod.json`. The release workflow copies the
section of a tagged version into the release notes.

## 1.0.1

- The code names the game's characters, skills, items and states with `rq.ids` instead of
  numbers. Needs loader 1.15.0. No change in the game.

## 1.0.0

First version.

- Space uses Standby (384) during an ally's skill choice when it is equipped and usable; otherwise
  Space is Cancel.
- Needs loader 1.0.0, where Space skips a greyed-out Standby.
- An error when the patch cannot be placed points at `logs/rqmod.log`.
