# Upgrade-System
4Story like upgrade system for wotlk.

**Requirements: Azerothcore + ALE + AIO (AIO needed for the full streamlined flow)**

SQL note: it generates a lot of upgrade items. Let it finish; it can take a bit even with the optimizations I put in place.
The sql makes 25 copies of each item rare quality and higher utilizing id 1 million+

Item tier/upgrade system inspired by Gates of Andaron (4Story). Eligible items can roll and progress from +1 to +25. This is a gold sink and gets expensive fast.
Rare/Epic/Legendary only, and the item must have something to scale: weapon damage and/or stats. Spell-only items with nothing to scale do not qualify.

Weapon damage: +1% per tier
Stats: +5% per tier (at +25: +125% stats)

Upgrade via NPC Benson or /upgrade.

Default chance: 1/300 for eligible loot to roll into a + item. Pity system increases odds on misses; resets to 1/300 after a hit. With AIO, loot upgrades are applied automatically and can optionally play a sound.
Upgrades past +16 through +25 announce server-wide (cooldown included).
Costs vary by slot (neck < weapon). Items 10+ levels below you are far cheaper/easier to upgrade as a catch-up mechanic for rare+ loot.

Script is highly configurable.

## Installation

1. Place `Upgrade.lua` in your server's `lua` folder.
2. Unzip `Upgrade.zip` into your `addons` folder. Make sure to unzip it there.
3. Run `keepsake.sql` on your database to generate the two keystone items the script recognizes.
4. Run `ItemUpgradeGenerator.sql` on your database and wait for it to finish — this may take a bit of time to load.
5. Run `Benson.sql` on your database to generate the NPC with the correct model and ID for the script to hook into.
