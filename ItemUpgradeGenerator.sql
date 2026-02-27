/* =========================================================
   AzerothCore item_template upgrade generator (+1..+25)
   Refined for less repeated string/POW work.
   ========================================================= */

/* ---------------------------
   1) CREATE missing + items
   --------------------------- */

INSERT IGNORE INTO item_template (
  entry, class, subclass, SoundOverrideSubclass, name, displayid, Quality, Flags, FlagsExtra,
  BuyCount, BuyPrice, SellPrice, InventoryType, AllowableClass, AllowableRace, ItemLevel,
  RequiredLevel, RequiredSkill, RequiredSkillRank, requiredspell, requiredhonorrank,
  RequiredCityRank, RequiredReputationFaction, RequiredReputationRank, maxcount, stackable,
  ContainerSlots,

  StatsCount,
  stat_type1, stat_value1, stat_type2, stat_value2, stat_type3, stat_value3, stat_type4, stat_value4, stat_type5, stat_value5,
  stat_type6, stat_value6, stat_type7, stat_value7, stat_type8, stat_value8, stat_type9, stat_value9, stat_type10, stat_value10,

  ScalingStatDistribution, ScalingStatValue,
  dmg_min1, dmg_max1, dmg_type1,
  dmg_min2, dmg_max2, dmg_type2,
  delay, ammo_type, RangedModRange,

  armor,
  block, itemset, MaxDurability, area, Map, BagFamily, TotemCategory,
  socketColor_1, socketContent_1, socketColor_2, socketContent_2, socketColor_3, socketContent_3,
  socketBonus, GemProperties, RequiredDisenchantSkill, ArmorDamageModifier, duration,
  ItemLimitCategory, HolidayId
)
SELECT
  (1000000 + (base.entry * 100) + lv.plus_level) AS entry,

  base.class, base.subclass, base.SoundOverrideSubclass,

  CONCAT('|c', lv.color, base.name_base, ' +', lv.plus_level, '|r') AS name,

  base.displayid, base.Quality, base.Flags, base.FlagsExtra,
  base.BuyCount, base.BuyPrice,

  CASE
    WHEN base.SellPrice IS NULL OR base.SellPrice = 0
      THEN lv.sell_add
    ELSE base.SellPrice + lv.sell_add
  END AS SellPrice,

  base.InventoryType, base.AllowableClass, base.AllowableRace, base.ItemLevel,
  base.RequiredLevel, base.RequiredSkill, base.RequiredSkillRank, base.requiredspell, base.requiredhonorrank,
  base.RequiredCityRank, base.RequiredReputationFaction, base.RequiredReputationRank, base.maxcount, base.stackable,
  base.ContainerSlots,

  base.StatsCount,

  base.stat_type1,  ROUND(base.stat_value1  * lv.stat_mult, 0),
  base.stat_type2,  ROUND(base.stat_value2  * lv.stat_mult, 0),
  base.stat_type3,  ROUND(base.stat_value3  * lv.stat_mult, 0),
  base.stat_type4,  ROUND(base.stat_value4  * lv.stat_mult, 0),
  base.stat_type5,  ROUND(base.stat_value5  * lv.stat_mult, 0),
  base.stat_type6,  ROUND(base.stat_value6  * lv.stat_mult, 0),
  base.stat_type7,  ROUND(base.stat_value7  * lv.stat_mult, 0),
  base.stat_type8,  ROUND(base.stat_value8  * lv.stat_mult, 0),
  base.stat_type9,  ROUND(base.stat_value9  * lv.stat_mult, 0),
  base.stat_type10, ROUND(base.stat_value10 * lv.stat_mult, 0),

  base.ScalingStatDistribution, base.ScalingStatValue,

  ROUND(base.dmg_min1 * lv.dmg_mult, 3),
  ROUND(base.dmg_max1 * lv.dmg_mult, 3),
  base.dmg_type1,
  ROUND(base.dmg_min2 * lv.dmg_mult, 3),
  ROUND(base.dmg_max2 * lv.dmg_mult, 3),
  base.dmg_type2,

  base.delay, base.ammo_type, base.RangedModRange,

  ROUND(base.armor * lv.stat_mult, 0),

  base.block, base.itemset, base.MaxDurability, base.area, base.Map, base.BagFamily, base.TotemCategory,
  base.socketColor_1, base.socketContent_1, base.socketColor_2, base.socketContent_2, base.socketColor_3, base.socketContent_3,
  base.socketBonus, base.GemProperties, base.RequiredDisenchantSkill, base.ArmorDamageModifier, base.duration,
  base.ItemLimitCategory, base.HolidayId
FROM
(
  SELECT
    it0.*,
    CASE
      WHEN INSTR(it0.name_clean, ' +') > 0
      THEN LEFT(
             it0.name_clean,
             CHAR_LENGTH(it0.name_clean) - CHAR_LENGTH(SUBSTRING_INDEX(it0.name_clean, ' +', -1)) - 2
           )
      ELSE it0.name_clean
    END AS name_base
  FROM
  (
    SELECT
      it.*,
      TRIM(TRAILING '|r' FROM (CASE WHEN it.name LIKE '|c________%' THEN SUBSTRING(it.name, 11) ELSE it.name END)) AS name_clean
    FROM item_template it
    WHERE
      it.entry < 1000000
      AND it.InventoryType > 0
      AND it.Quality >= 3
      AND (
        (it.class = 2 AND (it.dmg_max1 > 0 OR it.dmg_max2 > 0))
        OR
        (it.class = 4 AND (it.armor > 0 OR it.StatsCount > 0))
      )
      AND NOT (
        it.StatsCount = 0
        AND it.armor = 0
        AND it.dmg_max1 = 0
        AND it.dmg_max2 = 0
      )
  ) it0
) base
CROSS JOIN
(
  SELECT
    lv0.plus_level,
    (lv0.plus_level * lv0.plus_level) AS plus_sq,
    (lv0.plus_level * lv0.plus_level) * 4000 AS sell_add,
    POW(1.05, lv0.plus_level) AS stat_mult,
    POW(1.01, lv0.plus_level) AS dmg_mult,
    CASE lv0.plus_level
      WHEN 1  THEN 'FFFCF5F5'
      WHEN 2  THEN 'FFF9EBEB'
      WHEN 3  THEN 'FFF6E0E0'
      WHEN 4  THEN 'FFF2D6D6'
      WHEN 5  THEN 'FFEFCCCC'
      WHEN 6  THEN 'FFECC2C2'
      WHEN 7  THEN 'FFE9B8B8'
      WHEN 8  THEN 'FFE6ADAD'
      WHEN 9  THEN 'FFE3A3A3'
      WHEN 10 THEN 'FFDF9999'
      WHEN 11 THEN 'FFDC8F8F'
      WHEN 12 THEN 'FFD98585'
      WHEN 13 THEN 'FFD67A7A'
      WHEN 14 THEN 'FFD37070'
      WHEN 15 THEN 'FFD06666'
      WHEN 16 THEN 'FFCC5C5C'
      WHEN 17 THEN 'FFC95252'
      WHEN 18 THEN 'FFC64747'
      WHEN 19 THEN 'FFC33D3D'
      WHEN 20 THEN 'FFC03333'
      WHEN 21 THEN 'FFBD2929'
      WHEN 22 THEN 'FFB91F1F'
      WHEN 23 THEN 'FFB61414'
      WHEN 24 THEN 'FFB30A0A'
      WHEN 25 THEN 'FFB00000'
    END AS color
  FROM
  (
    SELECT (a.n + (b.n * 5) + 1) AS plus_level
    FROM
      (SELECT 0 n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4) a
    CROSS JOIN
      (SELECT 0 n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4) b
    WHERE (a.n + (b.n * 5)) < 25
  ) lv0
) lv
WHERE
  base.name_base <> '3300 Test Crossbow 63 blue';


/* -----------------------------------------------------
   2) QUALITY FIX: Spell sync (base -> upgraded)
      - Uses DIV/% instead of FLOOR/MOD on (entry-1000000)
      - Uses null-safe equality (<=>) instead of COALESCE
      - Adds an upper bound so it won’t scan unrelated 1,000,000+ entries
   ----------------------------------------------------- */

UPDATE item_template up
JOIN item_template base
  ON base.entry = (up.entry DIV 100) - 10000
SET
  up.spellid_1 = base.spellid_1,
  up.spelltrigger_1 = base.spelltrigger_1,
  up.spellcharges_1 = base.spellcharges_1,
  up.spellppmRate_1 = base.spellppmRate_1,
  up.spellcooldown_1 = base.spellcooldown_1,
  up.spellcategory_1 = base.spellcategory_1,
  up.spellcategorycooldown_1 = base.spellcategorycooldown_1,

  up.spellid_2 = base.spellid_2,
  up.spelltrigger_2 = base.spelltrigger_2,
  up.spellcharges_2 = base.spellcharges_2,
  up.spellppmRate_2 = base.spellppmRate_2,
  up.spellcooldown_2 = base.spellcooldown_2,
  up.spellcategory_2 = base.spellcategory_2,
  up.spellcategorycooldown_2 = base.spellcategorycooldown_2,

  up.spellid_3 = base.spellid_3,
  up.spelltrigger_3 = base.spelltrigger_3,
  up.spellcharges_3 = base.spellcharges_3,
  up.spellppmRate_3 = base.spellppmRate_3,
  up.spellcooldown_3 = base.spellcooldown_3,
  up.spellcategory_3 = base.spellcategory_3,
  up.spellcategorycooldown_3 = base.spellcategorycooldown_3,

  up.spellid_4 = base.spellid_4,
  up.spelltrigger_4 = base.spelltrigger_4,
  up.spellcharges_4 = base.spellcharges_4,
  up.spellppmRate_4 = base.spellppmRate_4,
  up.spellcooldown_4 = base.spellcooldown_4,
  up.spellcategory_4 = base.spellcategory_4,
  up.spellcategorycooldown_4 = base.spellcategorycooldown_4,

  up.spellid_5 = base.spellid_5,
  up.spelltrigger_5 = base.spelltrigger_5,
  up.spellcharges_5 = base.spellcharges_5,
  up.spellppmRate_5 = base.spellppmRate_5,
  up.spellcooldown_5 = base.spellcooldown_5,
  up.spellcategory_5 = base.spellcategory_5,
  up.spellcategorycooldown_5 = base.spellcategorycooldown_5
WHERE
  up.entry >= 1000000
  AND up.entry <= 50999925
  AND (up.entry % 100) BETWEEN 1 AND 25
  AND base.entry < 500000
  AND NOT (
    up.spellid_1 <=> base.spellid_1 AND
    up.spelltrigger_1 <=> base.spelltrigger_1 AND
    up.spellcharges_1 <=> base.spellcharges_1 AND
    up.spellppmRate_1 <=> base.spellppmRate_1 AND
    up.spellcooldown_1 <=> base.spellcooldown_1 AND
    up.spellcategory_1 <=> base.spellcategory_1 AND
    up.spellcategorycooldown_1 <=> base.spellcategorycooldown_1 AND

    up.spellid_2 <=> base.spellid_2 AND
    up.spelltrigger_2 <=> base.spelltrigger_2 AND
    up.spellcharges_2 <=> base.spellcharges_2 AND
    up.spellppmRate_2 <=> base.spellppmRate_2 AND
    up.spellcooldown_2 <=> base.spellcooldown_2 AND
    up.spellcategory_2 <=> base.spellcategory_2 AND
    up.spellcategorycooldown_2 <=> base.spellcategorycooldown_2 AND

    up.spellid_3 <=> base.spellid_3 AND
    up.spelltrigger_3 <=> base.spelltrigger_3 AND
    up.spellcharges_3 <=> base.spellcharges_3 AND
    up.spellppmRate_3 <=> base.spellppmRate_3 AND
    up.spellcooldown_3 <=> base.spellcooldown_3 AND
    up.spellcategory_3 <=> base.spellcategory_3 AND
    up.spellcategorycooldown_3 <=> base.spellcategorycooldown_3 AND

    up.spellid_4 <=> base.spellid_4 AND
    up.spelltrigger_4 <=> base.spelltrigger_4 AND
    up.spellcharges_4 <=> base.spellcharges_4 AND
    up.spellppmRate_4 <=> base.spellppmRate_4 AND
    up.spellcooldown_4 <=> base.spellcooldown_4 AND
    up.spellcategory_4 <=> base.spellcategory_4 AND
    up.spellcategorycooldown_4 <=> base.spellcategorycooldown_4 AND

    up.spellid_5 <=> base.spellid_5 AND
    up.spelltrigger_5 <=> base.spelltrigger_5 AND
    up.spellcharges_5 <=> base.spellcharges_5 AND
    up.spellppmRate_5 <=> base.spellppmRate_5 AND
    up.spellcooldown_5 <=> base.spellcooldown_5 AND
    up.spellcategory_5 <=> base.spellcategory_5 AND
    up.spellcategorycooldown_5 <=> base.spellcategorycooldown_5
  );