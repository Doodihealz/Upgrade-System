-- Benson (NPC template) + DisplayID mapping (AzerothCore default schema)

SET @ENTRY   := 200013;
SET @DISPLAY := 25882;

-- Clean re-runs
DELETE FROM `creature_template_model` WHERE `CreatureID` = @ENTRY;
DELETE FROM `creature_template`       WHERE `entry`      = @ENTRY;

-- AzerothCore creature_template (note: no modelid1-4 here)
INSERT INTO `creature_template` (
  `entry`,
  `difficulty_entry_1`,`difficulty_entry_2`,`difficulty_entry_3`,
  `KillCredit1`,`KillCredit2`,
  `name`,`subname`,`IconName`,
  `gossip_menu_id`,
  `minlevel`,`maxlevel`,`exp`,
  `faction`,`npcflag`,
  `speed_walk`,`speed_run`,`speed_swim`,
  `detection_range`,
  `scale`,
  `rank`,
  `dmgschool`,
  `BaseAttackTime`,`RangeAttackTime`,
  `BaseVariance`,`RangeVariance`,
  `unit_class`,
  `unit_flags`,`unit_flags2`,`dynamicflags`,
  `family`,
  `type`,`type_flags`,
  `lootid`,`pickpocketloot`,`skinloot`,
  `PetSpellDataId`,`VehicleId`,
  `mingold`,`maxgold`,
  `AIName`,
  `MovementType`,
  `HoverHeight`,
  `HealthModifier`,`ManaModifier`,`ArmorModifier`,`DamageModifier`,`ExperienceModifier`,
  `RacialLeader`,
  `movementId`,
  `RegenHealth`,
  `mechanic_immune_mask`,
  `spell_school_immune_mask`,
  `flags_extra`,
  `ScriptName`,
  `VerifiedBuild`
) VALUES (
  @ENTRY,
  0,0,0,
  0,0,
  'Benson','The Upgrade Master','Speak',
  0,
  80,80,2,
  35,1,
  1,1.14286,1,
  20,
  0.5,
  0,
  0,
  2000,2000,
  1,1,
  1,
  0,0,0,
  0,
  7,0,
  0,0,0,
  0,0,
  0,0,
  '',
  0,
  1,
  1,1,1,1,1,
  0,
  0,
  1,
  0,
  0,
  0,
  '',
  0
);

-- DisplayID mapping (this is the AzerothCore replacement for modelid1-4)
INSERT INTO `creature_template_model`
  (`CreatureID`,`Idx`,`CreatureDisplayID`,`DisplayScale`,`Probability`,`VerifiedBuild`)
VALUES
  (@ENTRY, 0, @DISPLAY, 1, 1, 0);