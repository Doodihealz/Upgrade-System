local CONFIG = {
    UPGRADE_NPC_ENTRY = 200013,
    CLONE_OFFSET = 1000000,
    CLONE_NAMESPACE_ID = 0,
    CLONE_NAMESPACE_STRIDE = 0,
    CLONE_RANGE_MIN = nil,
    CLONE_RANGE_MAX = nil,
    TIERS = 25,
    MAX_TIER = 25,
    UPGRADE_MODE = "equipment",
    MAX_PLAYER_LEVEL = 80,
    KEEPSAKE_STONE_ITEM_ID = 900104,
    LEGENDARY_STONE_ITEM_ID = 900103,
    KEEPSAKE_STONE_PRICE_GOLD = 500,
    LEGENDARY_STONE_PRICE_GOLD = 2000,
    COST_BASE_GOLD = 80,
    COST_PER_TIER_GOLD = 40,
    COST_LEVEL_MIN_FACTOR = 0.04,
    COST_LEVEL_POWER = 4.0,
    UPGRADE_LOW_LEVEL_BONUS_MAX = 12,
    UPGRADE_LOW_LEVEL_BONUS_POWER = 1.35,
    UPGRADE_OVERLEVELED_ITEM_LEVEL_GAP = 10,
    UPGRADE_OVERLEVELED_ITEM_CHANCE_MULTIPLIER = 3.0,
    AIO_PREVIEW_REFRESH_DELAY_MS = 100,
    UPGRADE_ANNOUNCE_COOLDOWN_SEC = 15,
    WEAPON_COST_MULTIPLIER = 1.15,
    NECKLACE_COST_MULTIPLIER = 0.85,
    CRITICAL_UPGRADE_DENOM = 150,
    CRITICAL_UPGRADE_LEVELS = 2,
    MAX_PITY_TIER_ADVANCE = 1,
    BAD_LUCK_BONUS_TABLE = { 2, 5, 11, 18, 26 },
    BAD_LUCK_BONUS_STEP_AFTER = 8,
    COST_PITY_REDUCTION_MIN_PCT = 5,
    COST_PITY_REDUCTION_MAX_PCT = 10,
    COST_PITY_REDUCTION_STEP_PCT = 1,
    COST_PITY_MIN_MULTIPLIER = 0.10,
    PERSIST_PITY_ACROSS_RELOAD = true,
    CLEAR_PITY_ON_LOGOUT = false,
    PRE_SAVE_BEFORE_SWAP = true,
    ALLOW_ONLINE_DB_MUTATION = false,
    CREATOR_DB_FALLBACK = true,
    ITEM_FIELD_CREATOR = 0x000A,
    ITEM_INSTANCE_CREATOR_COLUMN = "creatorGuid",
}
local UPGRADE_NPC_ENTRY, CLONE_OFFSET, TIERS, MAX_TIER, MAX_PLAYER_LEVEL
local CLONE_NAMESPACE_ID, CLONE_NAMESPACE_STRIDE, CLONE_RANGE_MIN, CLONE_RANGE_MAX, CLEAR_PITY_ON_LOGOUT
local UPGRADE_MODE
local KEEPSAKE_STONE_ITEM_ID, LEGENDARY_STONE_ITEM_ID
local KEEPSAKE_STONE_PRICE_GOLD, LEGENDARY_STONE_PRICE_GOLD, AIO_PREVIEW_REFRESH_DELAY_MS
local COST_BASE_GOLD, COST_PER_TIER_GOLD, COST_LEVEL_MIN_FACTOR, COST_LEVEL_POWER, UPGRADE_ANNOUNCE_COOLDOWN_SEC, WEAPON_COST_MULTIPLIER, NECKLACE_COST_MULTIPLIER, CRITICAL_UPGRADE_DENOM, CRITICAL_UPGRADE_LEVELS, MAX_PITY_TIER_ADVANCE
local BAD_LUCK_BONUS_TABLE, BAD_LUCK_BONUS_STEP_AFTER
local COST_PITY_REDUCTION_MIN_PCT, COST_PITY_REDUCTION_MAX_PCT, COST_PITY_REDUCTION_STEP_PCT, COST_PITY_MIN_MULTIPLIER
local PERSIST_PITY_ACROSS_RELOAD
local PRE_SAVE_BEFORE_SWAP, ALLOW_ONLINE_DB_MUTATION
local UPGRADE_LOW_LEVEL_BONUS_MAX, UPGRADE_LOW_LEVEL_BONUS_POWER
local UPGRADE_OVERLEVELED_ITEM_LEVEL_GAP, UPGRADE_OVERLEVELED_ITEM_CHANCE_MULTIPLIER
local ITEM_FIELD_CREATOR, ITEM_INSTANCE_CREATOR_COLUMN
local CREATOR_DB_FALLBACK
UPGRADE_NPC_ENTRY, CLONE_OFFSET, TIERS, MAX_TIER, MAX_PLAYER_LEVEL = CONFIG.UPGRADE_NPC_ENTRY, CONFIG.CLONE_OFFSET, CONFIG.TIERS, CONFIG.MAX_TIER, CONFIG.MAX_PLAYER_LEVEL
CLONE_NAMESPACE_ID = tonumber(CONFIG.CLONE_NAMESPACE_ID) or 0
CLONE_NAMESPACE_STRIDE = tonumber(CONFIG.CLONE_NAMESPACE_STRIDE) or 0
CLONE_RANGE_MIN = CONFIG.CLONE_RANGE_MIN
CLONE_RANGE_MAX = CONFIG.CLONE_RANGE_MAX
CLEAR_PITY_ON_LOGOUT = CONFIG.CLEAR_PITY_ON_LOGOUT == true
PRE_SAVE_BEFORE_SWAP = CONFIG.PRE_SAVE_BEFORE_SWAP == true
ALLOW_ONLINE_DB_MUTATION = CONFIG.ALLOW_ONLINE_DB_MUTATION == true
CREATOR_DB_FALLBACK = CONFIG.CREATOR_DB_FALLBACK ~= false
ITEM_FIELD_CREATOR = tonumber(CONFIG.ITEM_FIELD_CREATOR) or 0x000A
ITEM_INSTANCE_CREATOR_COLUMN = tostring(CONFIG.ITEM_INSTANCE_CREATOR_COLUMN or "creatorGuid")
UPGRADE_MODE = tostring(CONFIG.UPGRADE_MODE or "backpack"):lower()
KEEPSAKE_STONE_ITEM_ID, LEGENDARY_STONE_ITEM_ID = CONFIG.KEEPSAKE_STONE_ITEM_ID, CONFIG.LEGENDARY_STONE_ITEM_ID
KEEPSAKE_STONE_PRICE_GOLD, LEGENDARY_STONE_PRICE_GOLD = CONFIG.KEEPSAKE_STONE_PRICE_GOLD, CONFIG.LEGENDARY_STONE_PRICE_GOLD
AIO_PREVIEW_REFRESH_DELAY_MS = tonumber(CONFIG.AIO_PREVIEW_REFRESH_DELAY_MS) or 100
if AIO_PREVIEW_REFRESH_DELAY_MS < 0 then AIO_PREVIEW_REFRESH_DELAY_MS = 0 end
if AIO_PREVIEW_REFRESH_DELAY_MS > 1000 then AIO_PREVIEW_REFRESH_DELAY_MS = 1000 end
COST_BASE_GOLD, COST_PER_TIER_GOLD, COST_LEVEL_MIN_FACTOR, COST_LEVEL_POWER, UPGRADE_ANNOUNCE_COOLDOWN_SEC, WEAPON_COST_MULTIPLIER, NECKLACE_COST_MULTIPLIER, CRITICAL_UPGRADE_DENOM, CRITICAL_UPGRADE_LEVELS, MAX_PITY_TIER_ADVANCE =
    CONFIG.COST_BASE_GOLD, CONFIG.COST_PER_TIER_GOLD, CONFIG.COST_LEVEL_MIN_FACTOR, CONFIG.COST_LEVEL_POWER,
    CONFIG.UPGRADE_ANNOUNCE_COOLDOWN_SEC, CONFIG.WEAPON_COST_MULTIPLIER, CONFIG.NECKLACE_COST_MULTIPLIER,
    CONFIG.CRITICAL_UPGRADE_DENOM, CONFIG.CRITICAL_UPGRADE_LEVELS, CONFIG.MAX_PITY_TIER_ADVANCE
BAD_LUCK_BONUS_TABLE = CONFIG.BAD_LUCK_BONUS_TABLE or { 2, 5, 11, 18, 26 }
BAD_LUCK_BONUS_STEP_AFTER = tonumber(CONFIG.BAD_LUCK_BONUS_STEP_AFTER) or 8
COST_PITY_REDUCTION_MIN_PCT = tonumber(CONFIG.COST_PITY_REDUCTION_MIN_PCT) or 5
COST_PITY_REDUCTION_MAX_PCT = tonumber(CONFIG.COST_PITY_REDUCTION_MAX_PCT) or 10
COST_PITY_REDUCTION_STEP_PCT = tonumber(CONFIG.COST_PITY_REDUCTION_STEP_PCT) or 1
COST_PITY_MIN_MULTIPLIER = tonumber(CONFIG.COST_PITY_MIN_MULTIPLIER) or 0.10
PERSIST_PITY_ACROSS_RELOAD = CONFIG.PERSIST_PITY_ACROSS_RELOAD ~= false
UPGRADE_LOW_LEVEL_BONUS_MAX = tonumber(CONFIG.UPGRADE_LOW_LEVEL_BONUS_MAX) or 0
if UPGRADE_LOW_LEVEL_BONUS_MAX < 0 then UPGRADE_LOW_LEVEL_BONUS_MAX = 0 end
UPGRADE_LOW_LEVEL_BONUS_POWER = tonumber(CONFIG.UPGRADE_LOW_LEVEL_BONUS_POWER) or 1.35
if UPGRADE_LOW_LEVEL_BONUS_POWER < 0.1 then UPGRADE_LOW_LEVEL_BONUS_POWER = 0.1 end
UPGRADE_OVERLEVELED_ITEM_LEVEL_GAP = tonumber(CONFIG.UPGRADE_OVERLEVELED_ITEM_LEVEL_GAP) or 10
if UPGRADE_OVERLEVELED_ITEM_LEVEL_GAP < 0 then UPGRADE_OVERLEVELED_ITEM_LEVEL_GAP = 0 end
UPGRADE_OVERLEVELED_ITEM_CHANCE_MULTIPLIER = tonumber(CONFIG.UPGRADE_OVERLEVELED_ITEM_CHANCE_MULTIPLIER) or 3.0
if UPGRADE_OVERLEVELED_ITEM_CHANCE_MULTIPLIER < 1 then UPGRADE_OVERLEVELED_ITEM_CHANCE_MULTIPLIER = 1 end
if COST_PITY_REDUCTION_MIN_PCT < 0 then COST_PITY_REDUCTION_MIN_PCT = 0 end
if COST_PITY_REDUCTION_MAX_PCT < COST_PITY_REDUCTION_MIN_PCT then COST_PITY_REDUCTION_MAX_PCT = COST_PITY_REDUCTION_MIN_PCT end
if COST_PITY_REDUCTION_MAX_PCT > 95 then COST_PITY_REDUCTION_MAX_PCT = 95 end
if COST_PITY_REDUCTION_STEP_PCT < 0 then COST_PITY_REDUCTION_STEP_PCT = 0 end
if COST_PITY_MIN_MULTIPLIER < 0.01 then COST_PITY_MIN_MULTIPLIER = 0.01 end
if COST_PITY_MIN_MULTIPLIER > 1.0 then COST_PITY_MIN_MULTIPLIER = 1.0 end
COST_LEVEL_MIN_FACTOR = tonumber(COST_LEVEL_MIN_FACTOR) or 0.15
if COST_LEVEL_MIN_FACTOR < 0.03 then COST_LEVEL_MIN_FACTOR = 0.03 end
if COST_LEVEL_MIN_FACTOR > 1.0 then COST_LEVEL_MIN_FACTOR = 1.0 end
COST_LEVEL_POWER = tonumber(COST_LEVEL_POWER) or 3.0
if COST_LEVEL_POWER < 1.0 then COST_LEVEL_POWER = 1.0 end
UPGRADE_ANNOUNCE_COOLDOWN_SEC = tonumber(UPGRADE_ANNOUNCE_COOLDOWN_SEC) or 15
if UPGRADE_ANNOUNCE_COOLDOWN_SEC < 0 then UPGRADE_ANNOUNCE_COOLDOWN_SEC = 0 end
WEAPON_COST_MULTIPLIER = tonumber(WEAPON_COST_MULTIPLIER) or 1.0
NECKLACE_COST_MULTIPLIER = tonumber(NECKLACE_COST_MULTIPLIER) or 1.0
if CLONE_NAMESPACE_STRIDE ~= 0 and CLONE_NAMESPACE_ID ~= 0 then
    CLONE_OFFSET = CLONE_OFFSET + (CLONE_NAMESPACE_ID * CLONE_NAMESPACE_STRIDE)
end
if CLONE_RANGE_MIN ~= nil and CLONE_RANGE_MIN <= 0 then CLONE_RANGE_MIN = nil end
if CLONE_RANGE_MAX ~= nil and CLONE_RANGE_MAX <= 0 then CLONE_RANGE_MAX = nil end
if CLONE_RANGE_MIN and CLONE_RANGE_MAX and CLONE_RANGE_MIN > CLONE_RANGE_MAX then
    local tmp = CLONE_RANGE_MIN
    CLONE_RANGE_MIN = CLONE_RANGE_MAX
    CLONE_RANGE_MAX = tmp
end

local AIO; do local ok, m = pcall(require, "AIO"); if ok and m then AIO = m end end

function GetCriticalUpgradeDenom(tier)
    local maxDenom = tonumber(CRITICAL_UPGRADE_DENOM) or 150
    if maxDenom < 1 then maxDenom = 1 end
    if not tier or tier < 1 then tier = 1 end
    if not MAX_TIER or MAX_TIER < 2 then
        return maxDenom
    end
    local minDenom = math.max(1, math.floor((maxDenom / 2) + 0.5))
    local scaledDenom = minDenom + ((tier - 1) / (MAX_TIER - 1)) * (maxDenom - minDenom)
    return math.floor(scaledDenom + 0.5)
end

local UPGRADE_DEBUG = false
local AUTO_SYNC_CLONE_REQUIREMENTS = true
if UPGRADE_MODE == "equipped" then
    UPGRADE_MODE = "equipment"
end
if UPGRADE_MODE ~= "backpack" and UPGRADE_MODE ~= "equipment" then
    UPGRADE_MODE = "backpack"
end
local BACKPACK_UPGRADE_ENABLED = UPGRADE_MODE == "backpack"
local EQUIPPED_UPGRADE_ENABLED = UPGRADE_MODE == "equipment"

local MENU_IDS = {
    MAIN = 1,
    SELECT_SLOT = 2,
    SELECT_PROTECT = 3,
    BUY_STONES = 4,
    SELECT_BACKPACK = 5,
}

local ScriptReady = false

local STATE = {
    PendingSelection = {},
    UPGRADE_SWAPS = {},
    PENDING_EQUIP = {},
    BadLuckCounters = {},
    LootBadLuckCounters = {},
    LootChanceReduction = {},
    AnnounceCooldowns = {},
    RecentAioUpgradeRequests = {},
    RecentAioStoneBuyRequests = {},
    LastDedupeCleanupTime = 0,
    PlayerPityLoaded = {},
    ItemPityLoaded = {},
    ITEM_INSTANCE_ENTRY_COLUMN = nil,
    ITEM_INSTANCE_CREATOR_COLUMN = nil,
    CHAR_INV_ITEM_COLUMN = nil,
    InProgress = {},
}

local PendingSelection = STATE.PendingSelection
local UPGRADE_SWAPS = STATE.UPGRADE_SWAPS
local PENDING_EQUIP = STATE.PENDING_EQUIP
local BadLuckCounters = STATE.BadLuckCounters
local LootBadLuckCounters = STATE.LootBadLuckCounters
local LootChanceReduction = STATE.LootChanceReduction
local AnnounceCooldowns = STATE.AnnounceCooldowns
local RecentAioUpgradeRequests = STATE.RecentAioUpgradeRequests
local RecentAioStoneBuyRequests = STATE.RecentAioStoneBuyRequests
local InProgress = STATE.InProgress
local PlayerPityLoaded = STATE.PlayerPityLoaded
local ItemPityLoaded = STATE.ItemPityLoaded
local RETRY_TIMINGS = {
    SWAP_RETRY_DELAY_MS = 200,
    SWAP_MAX_TRIES = 15,
    UNEQUIP_MAX_TRIES = 5,
    POST_EQUIP_CLEANUP_DELAY_MS = 500,
    POST_EQUIP_CLEANUP_MAX_TRIES = 5,
    EQUIP_RETRY_DELAY_MS = 200,
    ENTRY_REMOVE_AFTER_TRIES = 3,
}

local SWAP_RETRY_DELAY_MS = RETRY_TIMINGS.SWAP_RETRY_DELAY_MS
local SWAP_MAX_TRIES = RETRY_TIMINGS.SWAP_MAX_TRIES
local UNEQUIP_MAX_TRIES = RETRY_TIMINGS.UNEQUIP_MAX_TRIES
local POST_EQUIP_CLEANUP_DELAY_MS = RETRY_TIMINGS.POST_EQUIP_CLEANUP_DELAY_MS
local POST_EQUIP_CLEANUP_MAX_TRIES = RETRY_TIMINGS.POST_EQUIP_CLEANUP_MAX_TRIES
local EQUIP_RETRY_DELAY_MS = RETRY_TIMINGS.EQUIP_RETRY_DELAY_MS
local ENTRY_REMOVE_AFTER_TRIES = RETRY_TIMINGS.ENTRY_REMOVE_AFTER_TRIES

local USE_DB_INSTANCE_UPGRADE = false
local USE_DB_UPGRADE_FALLBACK = false

local LOOT_UPGRADE_SETTINGS = {
    ENABLED = true,
    MIN_TIER = 5,
    MAX_TIER = 20,
    TEST_MODE = false,
    REQUIRE_ELIGIBLE = true,
    ALLOW_UNKNOWN_STATS = true,
    ANNOUNCE = true,
    ONLY_LOOTISH = true,
    IGNORE_STACKABLE = false,
    ANNOUNCE_WORLD = true,
    DEDUPE_WINDOW_SEC = 2,
    CHANCE_DENOM = 300,
    BAD_LUCK_INCREMENT = 1,
    REMINDER_ENABLED = true,
    REMINDER_INTERVAL_SEC = 600,
    SWAP_RETRY_DELAY_MS = 200,
    SWAP_MAX_TRIES = 5,
    QUEUE_RETRY_DELAY_MS = 100,
    QUEUE_MAX_TRIES = 20,
    CREATE_QUEUE_INITIAL_DELAY_MS = 200,
    STORE_QUEUE_INITIAL_DELAY_MS = 10,
    ROLL_QUEUE_INITIAL_DELAY_MS = 25,
    LOOT_QUEUE_INITIAL_DELAY_MS = 10,
}

local _L = LOOT_UPGRADE_SETTINGS
local LOOT_UPGRADE_ENABLED, LOOT_UPGRADE_MIN_TIER, LOOT_UPGRADE_MAX_TIER = _L.ENABLED, _L.MIN_TIER, _L.MAX_TIER
local LOOT_UPGRADE_TEST_MODE, LOOT_UPGRADE_REQUIRE_ELIGIBLE = _L.TEST_MODE, _L.REQUIRE_ELIGIBLE
local LOOT_UPGRADE_ANNOUNCE, LOOT_UPGRADE_ONLY_LOOTISH = _L.ANNOUNCE, _L.ONLY_LOOTISH
local LOOT_UPGRADE_IGNORE_STACKABLE, LOOT_UPGRADE_ANNOUNCE_WORLD = _L.IGNORE_STACKABLE, _L.ANNOUNCE_WORLD
local LOOT_UPGRADE_DEDUPE_WINDOW_SEC, LOOT_UPGRADE_CHANCE_DENOM = _L.DEDUPE_WINDOW_SEC, _L.CHANCE_DENOM
local LOOT_UPGRADE_ALLOW_UNKNOWN_STATS = _L.ALLOW_UNKNOWN_STATS
local LOOT_UPGRADE_REMINDER_ENABLED, LOOT_UPGRADE_REMINDER_INTERVAL_SEC = _L.REMINDER_ENABLED, _L.REMINDER_INTERVAL_SEC
local LOOT_SWAP_RETRY_DELAY_MS, LOOT_SWAP_MAX_TRIES = _L.SWAP_RETRY_DELAY_MS, _L.SWAP_MAX_TRIES
local LOOT_UPGRADE_BAD_LUCK_INCREMENT = _L.BAD_LUCK_INCREMENT
local LOOT_QUEUE_RETRY_DELAY_MS, LOOT_QUEUE_MAX_TRIES = _L.QUEUE_RETRY_DELAY_MS, _L.QUEUE_MAX_TRIES
local LOOT_CREATE_QUEUE_INITIAL_DELAY_MS = _L.CREATE_QUEUE_INITIAL_DELAY_MS
local LOOT_STORE_QUEUE_INITIAL_DELAY_MS = _L.STORE_QUEUE_INITIAL_DELAY_MS
local LOOT_ROLL_QUEUE_INITIAL_DELAY_MS = _L.ROLL_QUEUE_INITIAL_DELAY_MS
local LOOT_GENERAL_QUEUE_INITIAL_DELAY_MS = _L.LOOT_QUEUE_INITIAL_DELAY_MS
if LOOT_UPGRADE_ALLOW_UNKNOWN_STATS == nil then LOOT_UPGRADE_ALLOW_UNKNOWN_STATS = true end
if LOOT_UPGRADE_REMINDER_ENABLED == nil then LOOT_UPGRADE_REMINDER_ENABLED = true end
LOOT_UPGRADE_REMINDER_INTERVAL_SEC = tonumber(LOOT_UPGRADE_REMINDER_INTERVAL_SEC) or 600
if LOOT_UPGRADE_REMINDER_INTERVAL_SEC < 30 then LOOT_UPGRADE_REMINDER_INTERVAL_SEC = 30 end
LOOT_SWAP_RETRY_DELAY_MS = tonumber(LOOT_SWAP_RETRY_DELAY_MS) or 200
LOOT_SWAP_MAX_TRIES = tonumber(LOOT_SWAP_MAX_TRIES) or 5
if LOOT_SWAP_MAX_TRIES < 1 then LOOT_SWAP_MAX_TRIES = 1 end
LOOT_QUEUE_RETRY_DELAY_MS = tonumber(LOOT_QUEUE_RETRY_DELAY_MS) or 100
if LOOT_QUEUE_RETRY_DELAY_MS < 1 then LOOT_QUEUE_RETRY_DELAY_MS = 1 end
LOOT_QUEUE_MAX_TRIES = tonumber(LOOT_QUEUE_MAX_TRIES) or 20
if LOOT_QUEUE_MAX_TRIES < 1 then LOOT_QUEUE_MAX_TRIES = 1 end
LOOT_CREATE_QUEUE_INITIAL_DELAY_MS = tonumber(LOOT_CREATE_QUEUE_INITIAL_DELAY_MS) or 200
LOOT_STORE_QUEUE_INITIAL_DELAY_MS = tonumber(LOOT_STORE_QUEUE_INITIAL_DELAY_MS) or 10
LOOT_ROLL_QUEUE_INITIAL_DELAY_MS = tonumber(LOOT_ROLL_QUEUE_INITIAL_DELAY_MS) or 25
LOOT_GENERAL_QUEUE_INITIAL_DELAY_MS = tonumber(LOOT_GENERAL_QUEUE_INITIAL_DELAY_MS) or 10

local LootUpgradeDedupeCache = {}
local LastLootedQuality = {}


function CalculateScaledBadLuckBonus(badLuckCount)
    if badLuckCount <= 0 then return 0 end
    
    local baseBonus = badLuckCount * LOOT_UPGRADE_BAD_LUCK_INCREMENT
    local scaledBonus = baseBonus
    
    if badLuckCount > 20 then
        local extraStacks = badLuckCount - 20
        scaledBonus = baseBonus + (extraStacks * 5)
    end
    
    if badLuckCount > 39 then
        local extremeStacks = badLuckCount - 39
        local exponentialBonus = extremeStacks * extremeStacks
        scaledBonus = baseBonus + (19 * 5) + exponentialBonus
    end
    
    return scaledBonus
end

function GetQualityBasedBonus(quality)
    if quality == 5 then
        return 200
    elseif quality == 4 then
        return 20
    elseif quality == 3 then
        return 5
    end
    return 0
end

function SafeCallback(callback, validationFunc)
    return function()
        if not validationFunc or validationFunc() then
            pcall(callback)
        end
    end
end

local SLOT_CONFIG = {
    EXCLUDED = { [3] = true, [18] = true },
    ENCHANT_COPY = { 0, 1, 2, 3, 4, 5, 6 },
}

local EXCLUDED_SLOTS, ENCHANT_COPY_SLOTS
EXCLUDED_SLOTS, ENCHANT_COPY_SLOTS = SLOT_CONFIG.EXCLUDED, SLOT_CONFIG.ENCHANT_COPY

function Clamp(x, a, b)
    if x < a then return a end
    if x > b then return b end
    return x
end

function GetLowLevelBonusFactor(playerLevel, power)
    local level = tonumber(playerLevel) or MAX_PLAYER_LEVEL
    local maxLevel = tonumber(MAX_PLAYER_LEVEL) or 80
    if maxLevel < 1 then maxLevel = 80 end
    if level < 1 then level = 1 end
    if level > maxLevel then level = maxLevel end
    local ratio = level / maxLevel
    if ratio < 0 then ratio = 0 end
    if ratio > 1 then ratio = 1 end
    local p = tonumber(power) or 1.35
    if p < 0.1 then p = 0.1 end
    return 1.0 - (ratio ^ p)
end

function GetManualLevelChanceBonus(player)
    if UPGRADE_LOW_LEVEL_BONUS_MAX <= 0 then return 0 end
    local factor = GetLowLevelBonusFactor(safeGetPlayerLevel(player), UPGRADE_LOW_LEVEL_BONUS_POWER)
    return UPGRADE_LOW_LEVEL_BONUS_MAX * factor
end

function GetLootLevelDenomReductionPct(player)
    if LOOT_LOW_LEVEL_DENOM_REDUCTION_MAX_PCT <= 0 then return 0 end
    local factor = GetLowLevelBonusFactor(safeGetPlayerLevel(player), LOOT_LOW_LEVEL_DENOM_REDUCTION_POWER)
    return LOOT_LOW_LEVEL_DENOM_REDUCTION_MAX_PCT * factor
end

function CopperFromGold(gold)
    return math.floor(gold * 10000)
end

function FormatGold(copper)
    local g = math.floor(copper / 10000)
    local s = math.floor((copper % 10000) / 100)
    local c = math.floor(copper % 100)
    if s == 0 and c == 0 then
        return string.format("%ug", g)
    end
    if c == 0 then
        return string.format("%ug %us", g, s)
    end
    return string.format("%ug %us %uc", g, s, c)
end

function safeGetItemLevel(item)
    if not item then return 0 end
    if item.GetItemLevel and type(item.GetItemLevel) == "function" then
        local ok, level = pcall(item.GetItemLevel, item)
        if ok and level then return level end
    end
    return 0
end

function GetItemCostMultiplier(item)
    if not item then return 1.0 end
    local classId = nil
    if item.GetClass and type(item.GetClass) == "function" then
        local ok, c = pcall(item.GetClass, item)
        if ok then classId = c end
    end
    if classId == 2 then
        return WEAPON_COST_MULTIPLIER or 1.0
    end
    local invType = nil
    if item.GetInventoryType and type(item.GetInventoryType) == "function" then
        local ok, inv = pcall(item.GetInventoryType, item)
        if ok then invType = inv end
    end
    if invType == 2 or invType == 11 then
        return NECKLACE_COST_MULTIPLIER or 1.0
    end
    return 1.0
end

local function GetPityCostMultiplier(badLuckCount)
    badLuckCount = math.floor(tonumber(badLuckCount) or 0)
    if badLuckCount <= 0 then return 1.0 end

    local reductionMin = COST_PITY_REDUCTION_MIN_PCT or 5
    local reductionMax = COST_PITY_REDUCTION_MAX_PCT or 10
    local reductionStep = COST_PITY_REDUCTION_STEP_PCT or 1
    local minMultiplier = COST_PITY_MIN_MULTIPLIER or 0.10
    local multiplier = 1.0

    for i = 1, badLuckCount do
        local reductionPct = reductionMin + ((i - 1) * reductionStep)
        if reductionPct > reductionMax then reductionPct = reductionMax end
        if reductionPct < 0 then reductionPct = 0 end
        multiplier = multiplier * (1.0 - (reductionPct / 100))
        if multiplier <= minMultiplier then
            return minMultiplier
        end
    end

    if multiplier < minMultiplier then multiplier = minMultiplier end
    return multiplier
end

function GetUpgradeCostCopper(currentTier, playerLevel, item, badLuckCount)
    badLuckCount = badLuckCount or 0
    local nextTier = currentTier + 1
    local gold = COST_BASE_GOLD + (COST_PER_TIER_GOLD * nextTier)
    local level = tonumber(playerLevel) or MAX_PLAYER_LEVEL
    if level < 1 then level = 1 end
    local maxLevel = tonumber(MAX_PLAYER_LEVEL) or 80
    if maxLevel < 1 then maxLevel = 80 end
    if level > maxLevel then level = maxLevel end
    local levelRatio = level / maxLevel
    if levelRatio < 0 then levelRatio = 0 end
    if levelRatio > 1 then levelRatio = 1 end
    local minFactor = COST_LEVEL_MIN_FACTOR or 0.15
    local power = COST_LEVEL_POWER or 3.0
    local playerFactor = minFactor + (levelRatio ^ power) * (1.0 - minFactor)
    
    local ilvlFactor = 1.0
    if item then
        local itemLevel = safeGetItemLevel(item)
        if itemLevel > 0 then
            ilvlFactor = 1.0 + (itemLevel / 300) * 0.5
        end
    end
    
    local slotFactor = GetItemCostMultiplier(item)
    local scaled = math.floor(gold * playerFactor * ilvlFactor * slotFactor + 0.5)
    local baseCost = CopperFromGold(scaled / 2)
    
    if badLuckCount > 0 then
        local costMultiplier = GetPityCostMultiplier(badLuckCount)
        baseCost = math.floor(baseCost * costMultiplier + 0.5)
    end
    
    return baseCost
end

function GetStonePriceCopper(itemId)
    if itemId == KEEPSAKE_STONE_ITEM_ID then
        return CopperFromGold(KEEPSAKE_STONE_PRICE_GOLD)
    end
    if itemId == LEGENDARY_STONE_ITEM_ID then
        return CopperFromGold(LEGENDARY_STONE_PRICE_GOLD)
    end
    return nil
end

local TemplateExists

function IsCloneEntryInRange(entry)
    if not entry or entry <= 0 then return false end
    if CLONE_RANGE_MIN and entry < CLONE_RANGE_MIN then return false end
    if CLONE_RANGE_MAX and entry > CLONE_RANGE_MAX then return false end
    return true
end

function GetCloneEntry(baseEntry, tier)
    if not baseEntry or baseEntry <= 0 then return nil end
    if tier < 1 or tier > MAX_TIER then return nil end
    local entry = CLONE_OFFSET + (baseEntry * TIERS) + (tier - 1)
    if not IsCloneEntryInRange(entry) then
        if UPGRADE_DEBUG then
            DebugLog(string.format("Clone entry %u rejected by range guard (base=%u tier=%u)", entry, baseEntry, tier))
        end
        return nil
    end
    return entry
end

function GetBaseAndTierForEntry(entry)
    if entry >= CLONE_OFFSET then
        local idx = entry - CLONE_OFFSET
        local baseEntry = math.floor(idx / TIERS)
        local tier = (idx % TIERS) + 1
        if baseEntry > 0 and TemplateExists(baseEntry) then
            local tier1 = GetCloneEntry(baseEntry, 1)
            if tier1 and TemplateExists(tier1) then
                return baseEntry, tier
            end
        end
    end
    return entry, 0
end

function IsCloneRangeSafe(baseEntry)
    if not baseEntry or baseEntry <= 0 then return false, "invalid base" end
    local tier1 = GetCloneEntry(baseEntry, 1)
    if not tier1 then return false, "clone range blocked" end
    local baseTpl = GetItemTemplate(baseEntry)
    local cloneTpl = GetItemTemplate(tier1)
    if not baseTpl then return false, "missing base template" end
    if not cloneTpl then return false, "missing clone template" end
    if not CloneTemplateMatchesBase(baseEntry, tier1) then
        return false, "clone mismatch"
    end
    return true, nil
end

function IsEligibleItem(item)
    if not item then return false end

    local q = item:GetQuality()
    if not q then return false end
    if q < 3 then return false end

    local class = item:GetClass()
    if not class then return false end
    if class ~= 2 and class ~= 4 then return false end

    return true
end

function HasItemStats(item)
    if not item then return false end
    if item.GetStatsCount and type(item.GetStatsCount) == "function" then
        local ok, res = pcall(item.GetStatsCount, item)
        if ok then return (res or 0) > 0 end
    end
    return LOOT_UPGRADE_ALLOW_UNKNOWN_STATS == true
end

TemplateExists = function(entry)
    if not entry or entry <= 0 then return false end
    local tpl = GetItemTemplate(entry)
    return tpl ~= nil
end

function DebugMessage(player, msg)
    if not UPGRADE_DEBUG or not player or not msg then return end
    player:SendBroadcastMessage("|cff8888ff[UpgradeDebug]|r " .. msg)
end

function DebugLog(msg)
    if not UPGRADE_DEBUG or not msg then return end
    if print then
        print("|cff8888ff[UpgradeDebug]|r " .. msg)
    end
end

function SafePcall(tag, fn, ...)
    if not fn then return false end
    local ok, res = pcall(fn, ...)
    if not ok and UPGRADE_DEBUG then
        DebugLog(string.format("%s failed: %s", tostring(tag or "pcall"), tostring(res)))
    end
    return ok, res
end

function ClearTable(t)
    if not t then return end
    for k in pairs(t) do
        t[k] = nil
    end
end

function AcquireUpgradeLock(player)
    local guidLow = safeGetGuidLow(player)
    if not guidLow then return false end
    if InProgress[guidLow] then return false end
    InProgress[guidLow] = true
    return true
end

function ReleaseUpgradeLock(player)
    local guidLow = safeGetGuidLow(player)
    if not guidLow then return end
    InProgress[guidLow] = nil
end

local AIO_UPGRADE_REQUEST_DEDUPE_WINDOW_SEC = 3
local function IsDuplicateAioUpgradeRequest(player, requestId)
    local guidLow = safeGetGuidLow(player)
    local reqNum = tonumber(requestId)
    if not guidLow or not reqNum then
        return false
    end
    local now = os.time()
    local prev = RecentAioUpgradeRequests[guidLow]
    RecentAioUpgradeRequests[guidLow] = { id = reqNum, at = now }
    if not prev then
        return false
    end
    if prev.id ~= reqNum then
        return false
    end
    return (now - (prev.at or 0)) <= AIO_UPGRADE_REQUEST_DEDUPE_WINDOW_SEC
end

local AIO_STONE_BUY_REQUEST_DEDUPE_WINDOW_SEC = 3
local function IsDuplicateAioStoneBuyRequest(player, requestId)
    local guidLow = safeGetGuidLow(player)
    local reqNum = tonumber(requestId)
    if not guidLow or not reqNum then
        return false
    end
    local now = os.time()
    local prev = RecentAioStoneBuyRequests[guidLow]
    RecentAioStoneBuyRequests[guidLow] = { id = reqNum, at = now }
    if not prev then
        return false
    end
    if prev.id ~= reqNum then
        return false
    end
    return (now - (prev.at or 0)) <= AIO_STONE_BUY_REQUEST_DEDUPE_WINDOW_SEC
end

function TrySetItemEntry(item, newEntry)
    if not item or not newEntry then return false end
    local setters = {
        "SetEntry",
        "SetItemEntry",
        "SetEntryId",
        "SetEntryID",
        "SetItemId",
        "SetItemID",
    }
    for i = 1, #setters do
        local fn = setters[i]
        if item[fn] and type(item[fn]) == "function" then
            local ok = SafePcall("Item." .. fn, item[fn], item, newEntry)
            if ok then return true end
        end
    end
    return false
end

function TryRefreshEquippedItem(item, player)
    if not item then return end
    if item.SendUpdateToOwner and type(item.SendUpdateToOwner) == "function" then
        pcall(item.SendUpdateToOwner, item)
    end
    if player and item.SendUpdateToPlayer and type(item.SendUpdateToPlayer) == "function" then
        pcall(item.SendUpdateToPlayer, item, player)
    end
    if player and player.SendItemUpdate and type(player.SendItemUpdate) == "function" then
        pcall(player.SendItemUpdate, player, item)
    end
end

function EscapeSQLString(str)
    if not str then return "" end
    local escaped = str:gsub("\\", "\\\\")
    escaped = escaped:gsub("'", "''")
    return escaped
end

function GetTemplateName(entry)
    local tpl = GetItemTemplate(entry)
    if tpl and tpl.GetName then
        local ok, name = pcall(tpl.GetName, tpl)
        if ok then return name end
    end
    return nil
end

local COLORS = {
    CLASS = {
        [1] = "C79C6E",
        [2] = "F58CBA",
        [3] = "ABD473",
        [4] = "FFF569",
        [5] = "FFFFFF",
        [6] = "C41F3B",
        [7] = "0070DE",
        [8] = "69CCF0",
        [9] = "9482C9",
        [11] = "FF7D0A",
    },
    QUALITY = {
        [0] = "9d9d9d",
        [1] = "ffffff",
        [2] = "1eff00",
        [3] = "0070dd",
        [4] = "a335ee",
        [5] = "ff8000",
        [6] = "e6cc80",
        [7] = "0070dd",
    },
    TIER = {
        [1] = "FCF5F5", [2] = "F9EBEB", [3] = "F6E0E0", [4] = "F2D6D6", [5] = "EFCCCC",
        [6] = "ECC2C2", [7] = "E9B8B8", [8] = "E6ADAD", [9] = "E3A3A3", [10] = "DF9999",
        [11] = "DC8F8F", [12] = "D98585", [13] = "D67A7A", [14] = "D37070", [15] = "D06666",
        [16] = "CC5C5C", [17] = "C95252", [18] = "C64747", [19] = "C33D3D", [20] = "C03333",
        [21] = "BD2929", [22] = "B91F1F", [23] = "B61414", [24] = "B30A0A", [25] = "B00000"
    },
}

local CLASS_COLORS, ITEM_QUALITY_COLORS, TIER_COLORS
CLASS_COLORS, ITEM_QUALITY_COLORS, TIER_COLORS = COLORS.CLASS, COLORS.QUALITY, COLORS.TIER

function GetClassColorHex(player)
    if not player or not player.GetClass then return "FFFFFF" end
    local classId = player:GetClass()
    return COLORS.CLASS[classId] or "FFFFFF"
end

local DEDUPE_TIMINGS = {
    CLEANUP_INTERVAL_SEC = 10,
    CACHE_MAX_AGE_SEC = 60,
}
local DEDUPE_CLEANUP_INTERVAL_SEC = DEDUPE_TIMINGS.CLEANUP_INTERVAL_SEC
local DEDUPE_CACHE_MAX_AGE_SEC = DEDUPE_TIMINGS.CACHE_MAX_AGE_SEC

function PruneLootUpgradeDedupeCache()
    local currentTime = os.time()
    if currentTime - STATE.LastDedupeCleanupTime < DEDUPE_CLEANUP_INTERVAL_SEC then
        return
    end
    
    STATE.LastDedupeCleanupTime = currentTime
    local prunedCount = 0
    
    for key, timestamp in pairs(LootUpgradeDedupeCache) do
        if currentTime - timestamp > DEDUPE_CACHE_MAX_AGE_SEC then
            LootUpgradeDedupeCache[key] = nil
            prunedCount = prunedCount + 1
        end
    end
    
    if UPGRADE_DEBUG and prunedCount > 0 then
        DebugLog(string.format("Pruned %d expired dedupe cache entries", prunedCount))
    end
end

function GetItemQualityColor(item)
    if not item or not item.GetQuality then return "ffffff" end
    local ok, quality = pcall(function() return item:GetQuality() end)
    if not ok then return "ffffff" end
    return COLORS.QUALITY[quality or 1] or "ffffff"
end

function GetTemplateQualityColor(entry)
    if not entry or entry <= 0 then return "ffffff" end
    local tpl = GetItemTemplate(entry)
    if not tpl or not tpl.GetQuality then return "ffffff" end
    local ok, quality = pcall(function() return tpl:GetQuality() end)
    if not ok then return "ffffff" end
    return COLORS.QUALITY[quality or 1] or "ffffff"
end

function GetTierColor(tier)
    if not tier or tier < 1 then return "ffffff" end
    return TIER_COLORS[tier] or "B00000"
end

function CreateItemLink(entry, itemName, tier)
    if not entry or not itemName then return itemName or "item" end
    local color = "ffffff"
    if tier then
        color = GetTierColor(tier) or "ffffff"
    end
    return string.format("|cff%s|Hitem:%u:0:0:0:0:0:0:0:0|h[%s]|h|r", color, entry, itemName)
end

function QueryGetInt(q, idx)
    if q.GetInt32 and type(q.GetInt32) == "function" then
        return q:GetInt32(idx)
    end
    return q:GetUInt32(idx)
end

local PITY_PLAYER_TABLE = "upgrade_pity_player"
local PITY_ITEM_TABLE = "upgrade_pity_item"
local PITY_DB_READY = false
local PITY_TABLES_VERIFIED_AT = 0

local function ToUInt(v)
    v = tonumber(v) or 0
    if v < 0 then v = 0 end
    return math.floor(v)
end

local function SafeCharExecute(sql)
    if not CharDBExecute then return false end
    local ok, res = pcall(CharDBExecute, sql)
    if not ok and UPGRADE_DEBUG then
        DebugLog(string.format("CharDBExecute failed: %s", tostring(res)))
    end
    if not ok then
        return false
    end
    return res ~= false
end

local function SafeCharQuery(sql)
    if not CharDBQuery then return nil end
    local ok, res = pcall(CharDBQuery, sql)
    if not ok then
        if UPGRADE_DEBUG then
            DebugLog(string.format("CharDBQuery failed: %s", tostring(res)))
        end
        return nil
    end
    return res
end

local function EscapeSqlLiteral(s)
    s = tostring(s or "")
    s = s:gsub("\\", "\\\\")
    s = s:gsub("'", "''")
    return s
end

local function PityTableExists(tableName)
    if not tableName or tableName == "" then return false end
    local q = SafeCharQuery(string.format(
        "SELECT COUNT(1) FROM information_schema.TABLES WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = '%s'",
        EscapeSqlLiteral(tableName)
    ))
    if not q then return false end
    return (QueryGetInt(q, 0) or 0) > 0
end

local function PityColumnExists(tableName, columnName)
    if not tableName or tableName == "" or not columnName or columnName == "" then return false end
    local q = SafeCharQuery(string.format(
        "SELECT COUNT(1) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = '%s' AND COLUMN_NAME = '%s'",
        EscapeSqlLiteral(tableName),
        EscapeSqlLiteral(columnName)
    ))
    if not q then return false end
    return (QueryGetInt(q, 0) or 0) > 0
end

local function PityPrimaryKeyOnColumnExists(tableName, columnName)
    if not tableName or tableName == "" or not columnName or columnName == "" then return false end
    local q = SafeCharQuery(string.format(
        "SELECT COUNT(1) FROM information_schema.KEY_COLUMN_USAGE " ..
        "WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = '%s' AND COLUMN_NAME = '%s' AND CONSTRAINT_NAME = 'PRIMARY'",
        EscapeSqlLiteral(tableName),
        EscapeSqlLiteral(columnName)
    ))
    if not q then return false end
    return (QueryGetInt(q, 0) or 0) > 0
end

local function EnsurePityColumn(tableName, columnName, columnDef)
    if PityColumnExists(tableName, columnName) then
        return true
    end
    local ok = SafeCharExecute(string.format(
        "ALTER TABLE `%s` ADD COLUMN `%s` %s",
        tableName, columnName, columnDef
    ))
    if not ok then
        return false
    end
    return PityColumnExists(tableName, columnName)
end

local function EnsurePityPrimaryKey(tableName, columnName)
    if PityPrimaryKeyOnColumnExists(tableName, columnName) then
        return true
    end
    local ok = SafeCharExecute(string.format(
        "ALTER TABLE `%s` ADD PRIMARY KEY (`%s`)",
        tableName, columnName
    ))
    if not ok then
        return false
    end
    return PityPrimaryKeyOnColumnExists(tableName, columnName)
end

local function EnsurePitySchema()
    if not PERSIST_PITY_ACROSS_RELOAD then
        return false
    end
    if not CharDBExecute or not CharDBQuery then
        return false
    end

    local okPlayerCreate = SafeCharExecute(string.format([[
CREATE TABLE IF NOT EXISTS `%s` (
    `player_guid` INT UNSIGNED NOT NULL,
    `bad_luck` INT UNSIGNED NOT NULL DEFAULT 0,
    `chance_reduction` INT UNSIGNED NOT NULL DEFAULT 0,
    PRIMARY KEY (`player_guid`)
)]], PITY_PLAYER_TABLE))
    local okItemCreate = SafeCharExecute(string.format([[
CREATE TABLE IF NOT EXISTS `%s` (
    `item_guid` INT UNSIGNED NOT NULL,
    `bad_luck` INT UNSIGNED NOT NULL DEFAULT 0,
    PRIMARY KEY (`item_guid`)
)]], PITY_ITEM_TABLE))
    if not okPlayerCreate or not okItemCreate then
        return false
    end

    if not PityTableExists(PITY_PLAYER_TABLE) or not PityTableExists(PITY_ITEM_TABLE) then
        return false
    end

    local ok =
        EnsurePityColumn(PITY_PLAYER_TABLE, "player_guid", "INT UNSIGNED NOT NULL") and
        EnsurePityColumn(PITY_PLAYER_TABLE, "bad_luck", "INT UNSIGNED NOT NULL DEFAULT 0") and
        EnsurePityColumn(PITY_PLAYER_TABLE, "chance_reduction", "INT UNSIGNED NOT NULL DEFAULT 0") and
        EnsurePityColumn(PITY_ITEM_TABLE, "item_guid", "INT UNSIGNED NOT NULL") and
        EnsurePityColumn(PITY_ITEM_TABLE, "bad_luck", "INT UNSIGNED NOT NULL DEFAULT 0")

    if not ok then
        return false
    end

    if not EnsurePityPrimaryKey(PITY_PLAYER_TABLE, "player_guid") then
        return false
    end
    if not EnsurePityPrimaryKey(PITY_ITEM_TABLE, "item_guid") then
        return false
    end

    return true
end

local function RefreshPityTableAvailability(force)
    if not PERSIST_PITY_ACROSS_RELOAD then
        PITY_DB_READY = false
        return false
    end
    if not CharDBQuery then
        PITY_DB_READY = false
        return false
    end

    local now = os.time()
    if not force and PITY_DB_READY and (now - (PITY_TABLES_VERIFIED_AT or 0)) < 60 then
        return true
    end

    PITY_DB_READY = EnsurePitySchema()
    PITY_TABLES_VERIFIED_AT = now
    return PITY_DB_READY
end

local function IsPityPersistenceEnabled()
    if not (PERSIST_PITY_ACROSS_RELOAD and CharDBExecute and CharDBQuery) then
        return false
    end
    return RefreshPityTableAvailability(false)
end

local function InitializePityPersistence()
    PITY_DB_READY = false
    PITY_TABLES_VERIFIED_AT = 0
    if not RefreshPityTableAvailability(true) then
        if UPGRADE_DEBUG then
            DebugLog("Pity persistence schema not available; using memory-only counters.")
        end
        return
    end

    SafeCharExecute(string.format(
        "DELETE p FROM `%s` p LEFT JOIN characters c ON c.guid = p.player_guid WHERE c.guid IS NULL",
        PITY_PLAYER_TABLE
    ))
    SafeCharExecute(string.format(
        "DELETE i FROM `%s` i LEFT JOIN item_instance it ON it.guid = i.item_guid WHERE it.guid IS NULL",
        PITY_ITEM_TABLE
    ))
end

local function LoadPlayerPityFromDB(guidLow)
    guidLow = ToUInt(guidLow)
    if guidLow <= 0 then return end
    if PlayerPityLoaded[guidLow] then return end
    PlayerPityLoaded[guidLow] = true
    if not IsPityPersistenceEnabled() then return end

    local q = SafeCharQuery(string.format(
        "SELECT bad_luck, chance_reduction FROM `%s` WHERE player_guid=%u LIMIT 1",
        PITY_PLAYER_TABLE, guidLow
    ))
    if not q then return end

    LootBadLuckCounters[guidLow] = ToUInt(QueryGetInt(q, 0))
    LootChanceReduction[guidLow] = ToUInt(QueryGetInt(q, 1))
end

local function SavePlayerPityToDB(guidLow)
    guidLow = ToUInt(guidLow)
    if guidLow <= 0 then return end
    if not IsPityPersistenceEnabled() then return end

    local badLuck = ToUInt(LootBadLuckCounters[guidLow] or 0)
    local chanceReduction = ToUInt(LootChanceReduction[guidLow] or 0)
    if badLuck <= 0 and chanceReduction <= 0 then
        SafeCharExecute(string.format(
            "DELETE FROM `%s` WHERE player_guid=%u",
            PITY_PLAYER_TABLE, guidLow
        ))
        return
    end

    SafeCharExecute(string.format(
        "INSERT INTO `%s` (player_guid, bad_luck, chance_reduction) VALUES (%u, %u, %u) " ..
        "ON DUPLICATE KEY UPDATE bad_luck=VALUES(bad_luck), chance_reduction=VALUES(chance_reduction)",
        PITY_PLAYER_TABLE, guidLow, badLuck, chanceReduction
    ))
end

local function LoadItemPityFromDB(itemGuidLow)
    itemGuidLow = ToUInt(itemGuidLow)
    if itemGuidLow <= 0 then return end
    if ItemPityLoaded[itemGuidLow] then return end
    ItemPityLoaded[itemGuidLow] = true
    if not IsPityPersistenceEnabled() then return end

    local q = SafeCharQuery(string.format(
        "SELECT bad_luck FROM `%s` WHERE item_guid=%u LIMIT 1",
        PITY_ITEM_TABLE, itemGuidLow
    ))
    if not q then return end

    BadLuckCounters[itemGuidLow] = ToUInt(QueryGetInt(q, 0))
end

local function SaveItemPityToDB(itemGuidLow)
    itemGuidLow = ToUInt(itemGuidLow)
    if itemGuidLow <= 0 then return end
    if not IsPityPersistenceEnabled() then return end

    local badLuck = ToUInt(BadLuckCounters[itemGuidLow] or 0)
    if badLuck <= 0 then
        SafeCharExecute(string.format(
            "DELETE FROM `%s` WHERE item_guid=%u",
            PITY_ITEM_TABLE, itemGuidLow
        ))
        return
    end

    SafeCharExecute(string.format(
        "INSERT INTO `%s` (item_guid, bad_luck) VALUES (%u, %u) " ..
        "ON DUPLICATE KEY UPDATE bad_luck=VALUES(bad_luck)",
        PITY_ITEM_TABLE, itemGuidLow, badLuck
    ))
end

function safeGetGuidLow(item)
    if not item then return nil end
    if type(item) ~= "userdata" and type(item) ~= "table" then return nil end
    if item.GetGUIDLow and type(item.GetGUIDLow) == "function" then
        local ok, res = pcall(item.GetGUIDLow, item)
        if ok then return res end
    end
    return nil
end

function CanSendUpgradeAnnouncement(player)
    if not player then return false end
    local guidLow = safeGetGuidLow(player)
    if not guidLow then return false end
    local now = os.time()
    local last = AnnounceCooldowns[guidLow] or 0
    if (now - last) < UPGRADE_ANNOUNCE_COOLDOWN_SEC then
        return false
    end
    AnnounceCooldowns[guidLow] = now
    return true
end

local PlayerHasItemByGUID

function GetPlayerLootBadLuckCount(player)
    if not player then return 0 end
    local guidLow = safeGetGuidLow(player)
    if not guidLow then return 0 end
    LoadPlayerPityFromDB(guidLow)
    return LootBadLuckCounters[guidLow] or 0
end

function GetCurrentLootUpgradeChanceDenom(player)
    local baseDenom = tonumber(LOOT_UPGRADE_CHANCE_DENOM) or 300
    if baseDenom < 1 then baseDenom = 1 end

    local badLuck = GetPlayerLootBadLuckCount(player)
    local currentDenom = baseDenom - badLuck
    if currentDenom < 1 then currentDenom = 1 end

    return math.floor(currentDenom), badLuck
end

function SendLootChanceReminder(player)
    if not isValidPlayer(player) then return end
    local currentDenom = GetCurrentLootUpgradeChanceDenom(player)
    if not currentDenom then return end

    player:SendBroadcastMessage(string.format(
        "Hey there, just a friendly reminder: your upgrade chance right now is |cffffff001/%d|r.",
        currentDenom
    ))
end

function IncrementPlayerLootBadLuckCount(player, qualityBonus)
    if not player then return end
    local guidLow = safeGetGuidLow(player)
    if not guidLow then return end
    LoadPlayerPityFromDB(guidLow)
    qualityBonus = qualityBonus or 0
    local increment = qualityBonus > 0 and qualityBonus or 1
    LootBadLuckCounters[guidLow] = (LootBadLuckCounters[guidLow] or 0) + increment
    SavePlayerPityToDB(guidLow)
end

function ResetPlayerLootBadLuckCount(player)
    if not player then return end
    local guidLow = safeGetGuidLow(player)
    if not guidLow then return end
    LoadPlayerPityFromDB(guidLow)
    LootBadLuckCounters[guidLow] = nil
    SavePlayerPityToDB(guidLow)
end

function GetPlayerLootChanceReduction(player)
    if not player then return 0 end
    local guidLow = safeGetGuidLow(player)
    if not guidLow then return 0 end
    LoadPlayerPityFromDB(guidLow)
    return LootChanceReduction[guidLow] or 0
end

function IncrementPlayerLootChanceReduction(player, qualityBonus)
    if not player then return end
    local guidLow = safeGetGuidLow(player)
    if not guidLow then return end
    LoadPlayerPityFromDB(guidLow)
    qualityBonus = qualityBonus or 0
    local newValue = (LootChanceReduction[guidLow] or 0) + qualityBonus
    local cap = (tonumber(LOOT_UPGRADE_MAX_DENOM) or 1) - 1
    if cap < 0 then cap = 0 end
    LootChanceReduction[guidLow] = math.min(newValue, cap)
    SavePlayerPityToDB(guidLow)
end

function ResetPlayerLootChanceReduction(player)
    if not player then return end
    local guidLow = safeGetGuidLow(player)
    if not guidLow then return end
    LoadPlayerPityFromDB(guidLow)
    LootChanceReduction[guidLow] = nil
    SavePlayerPityToDB(guidLow)
end

function GetItemBadLuckCount(item)
    if not item then return 0 end
    local guidLow = safeGetGuidLow(item)
    if not guidLow then return 0 end
    LoadItemPityFromDB(guidLow)
    return BadLuckCounters[guidLow] or 0
end

function IncrementItemBadLuckCount(item)
    if not item then return end
    local guidLow = safeGetGuidLow(item)
    if not guidLow then return end
    LoadItemPityFromDB(guidLow)
    BadLuckCounters[guidLow] = (BadLuckCounters[guidLow] or 0) + 1
    SaveItemPityToDB(guidLow)
end

function ResetItemBadLuckCount(itemOrGuidLow)
    if not itemOrGuidLow then return end
    local guidLow = nil
    if type(itemOrGuidLow) == "number" then
        guidLow = itemOrGuidLow
    else
        guidLow = safeGetGuidLow(itemOrGuidLow)
    end
    if not guidLow then return end
    LoadItemPityFromDB(guidLow)
    BadLuckCounters[guidLow] = nil
    SaveItemPityToDB(guidLow)
end

function MaybePreSave(player)
    if not PRE_SAVE_BEFORE_SWAP then return end
    if not isValidPlayer(player) then return end
    if player.SaveToDB and type(player.SaveToDB) == "function" then
        SafePcall("Player.SaveToDB", player.SaveToDB, player)
    end
end

function SelectUpgradeTierWithPity(badLuckCount)
    return math.random(LOOT_UPGRADE_MIN_TIER, LOOT_UPGRADE_MAX_TIER)
end

function CalculateUpgradeTierAdvance(badLuckCount)
    if badLuckCount <= 0 then
        return 1
    elseif badLuckCount <= 5 then
        return 2
    elseif badLuckCount <= 20 then
        return 2 + math.random(0, 1)
    else
        return 3
    end
end

function ResolveTargetTier(baseEntry, tier, badLuckCount)
    local maxAdvance = math.max(1, MAX_PITY_TIER_ADVANCE or 1)
    local tierAdvance = math.min(CalculateUpgradeTierAdvance(badLuckCount), maxAdvance)
    local targetTier = math.min(tier + tierAdvance, MAX_TIER)
    local targetEntry = GetCloneEntry(baseEntry, targetTier)
    while (not targetEntry or not TemplateExists(targetEntry)) and targetTier > tier + 1 do
        targetTier = targetTier - 1
        targetEntry = GetCloneEntry(baseEntry, targetTier)
    end
    return targetTier, targetEntry, tierAdvance, maxAdvance
end

function ScheduleLootUpgradeSwap(playerGuidFull, playerGuidLow, itemGuidLow, baseEntry, entry, cloneEntry, newTier, lootBadLuckCount, testMode, attempt)
    if not CreateLuaEvent then return end
    CreateLuaEvent(SafeCallback(function()
        FinalizeLootUpgradeSwap(playerGuidFull, playerGuidLow, itemGuidLow, baseEntry, entry, cloneEntry, newTier, lootBadLuckCount, testMode, attempt, false)
    end, function() return isValidPlayer(GetPlayerByAnyGuid(playerGuidFull, playerGuidLow)) end), LOOT_SWAP_RETRY_DELAY_MS, 1)
end

function FinalizeLootUpgradeSwap(playerGuidFull, playerGuidLow, itemGuidLow, baseEntry, entry, cloneEntry, newTier, lootBadLuckCount, testMode, attempt, lockAlreadyHeld)
    attempt = attempt or 1
    local player = GetPlayerByAnyGuid(playerGuidFull, playerGuidLow)
    if not isValidPlayer(player) then return end

    local acquiredLock = false
    if not lockAlreadyHeld then
        if not AcquireUpgradeLock(player) then
            if attempt < LOOT_SWAP_MAX_TRIES then
                ScheduleLootUpgradeSwap(playerGuidFull, playerGuidLow, itemGuidLow, baseEntry, entry, cloneEntry, newTier, lootBadLuckCount, testMode, attempt + 1)
            end
            return
        end
        acquiredLock = true
    end

    local function Cleanup()
        if acquiredLock then
            ReleaseUpgradeLock(player)
        end
    end

    local item = FindItemByGuidLow(player, itemGuidLow)
    if not item then
        if attempt < LOOT_SWAP_MAX_TRIES then
            ScheduleLootUpgradeSwap(playerGuidFull, playerGuidLow, itemGuidLow, baseEntry, entry, cloneEntry, newTier, lootBadLuckCount, testMode, attempt + 1)
        elseif UPGRADE_DEBUG then
            DebugLog(string.format("Loot upgrade: item GUID %s not found after %d attempts", tostring(itemGuidLow), attempt))
        end
        Cleanup()
        return
    end

    local sourceCreatorGuidLow = GetItemCreatorGuidLow(item)

    local currentEntry = safeItemGetEntry(item)
    if currentEntry and entry and currentEntry ~= entry then
        if UPGRADE_DEBUG then
            DebugLog(string.format("Loot upgrade: item entry changed before swap (expected %d, got %d)", entry, currentEntry))
        end
        Cleanup()
        return
    end

    local removeOk = pcall(function() return player:RemoveItem(item, 1) end)
    if not removeOk then
        if UPGRADE_DEBUG then
            DebugLog(string.format("Loot upgrade: RemoveItem failed with error for item GUID %d", itemGuidLow))
        end
        Cleanup()
        return
    end

    local hasItemAfter = PlayerHasItemByGUID(player, itemGuidLow)
    if hasItemAfter then
        if UPGRADE_DEBUG then
            DebugLog(string.format("Loot upgrade: failed to remove item GUID %d", itemGuidLow))
        end
        Cleanup()
        return
    end

    local addedItem = nil
    local addOk = pcall(function() addedItem = player:AddItem(cloneEntry, 1) end)

    if addOk and addedItem then
        ApplyCreatorGuidLowToItem(addedItem, sourceCreatorGuidLow)
        if not testMode then
            ResetPlayerLootBadLuckCount(player)
            ResetPlayerLootChanceReduction(player)
        end
        if LOOT_UPGRADE_ANNOUNCE then
            local baseName = GetTemplateName(baseEntry) or "item"
            local playerName = player:GetName() or "Someone"
            local classColor = GetClassColorHex(player)
            local coloredPlayer = string.format("|cff%s%s|r", classColor, playerName)
            local itemLink = CreateItemLink(cloneEntry, baseName, newTier)
            local pityColor = GetTierColor(newTier)
            local coloredPity = string.format("|cff%s%d|r", pityColor, lootBadLuckCount)
            player:SendBroadcastMessage(string.format("%s has received a %s from Pity(%s)!", coloredPlayer, itemLink, coloredPity))
            if newTier == LOOT_UPGRADE_MAX_TIER_VALUE and SendWorldMessage then
                local classColor = GetClassColorHex(player)
                local coloredPlayer = string.format("|cff%s%s|r", classColor, playerName)
                local baseName = GetTemplateName(cloneEntry) or "item"
                local itemLink = CreateItemLink(cloneEntry, baseName, newTier)
                SendWorldMessage(string.format("Announcement: %s got lucky and looted a %s!",
                    coloredPlayer, itemLink))
            end
        end
    else
        if UPGRADE_DEBUG then
            DebugLog(string.format("Loot upgrade: AddItem failed (addOk=%s, addedItem=%s), refunding original item entry %d",
                tostring(addOk), tostring(addedItem), entry))
        end
        local refundItem = nil
        local refundOk = pcall(function() refundItem = player:AddItem(entry, 1) end)
        if refundOk and refundItem then
            ApplyCreatorGuidLowToItem(refundItem, sourceCreatorGuidLow)
        elseif not refundOk and UPGRADE_DEBUG then
            DebugLog(string.format("Loot upgrade: failed to refund original item entry %d", entry))
        end
    end

    Cleanup()
end

function ProcessLootAward(player, item, count)
    if not LOOT_UPGRADE_ENABLED or not ScriptReady or not player or not item then 
        if UPGRADE_DEBUG then DebugLog("ProcessLootAward early exit: ENABLED=" .. tostring(LOOT_UPGRADE_ENABLED) .. " Ready=" .. tostring(ScriptReady)) end
        return 
    end

    if not AcquireUpgradeLock(player) then
        if UPGRADE_DEBUG then DebugLog("ProcessLootAward: upgrade lock busy") end
        return
    end

    local function Run()
    local stackCount = tonumber(count) or 1
    if stackCount < 1 then 
        if UPGRADE_DEBUG then DebugLog("ProcessLootAward: invalid count " .. tostring(count)) end
        return 
    end
    if LOOT_UPGRADE_CHANCE_DENOM <= 0 then 
        if UPGRADE_DEBUG then DebugLog("ProcessLootAward: denom invalid") end
        return 
    end
    
    local entry = item:GetEntry()
    if not entry or entry <= 0 then 
        if UPGRADE_DEBUG then DebugLog("ProcessLootAward: invalid entry") end
        return 
    end

    if LOOT_UPGRADE_IGNORE_STACKABLE then
        local maxStack = item:GetMaxStackCount()
        if maxStack and maxStack > 1 then 
            if UPGRADE_DEBUG then DebugLog("ProcessLootAward: stackable item filtered") end
            return 
        end
    end

    if LOOT_UPGRADE_ONLY_LOOTISH then
        local invType = item:GetInventoryType()
        if not invType or invType == 0 then 
            if UPGRADE_DEBUG then DebugLog("ProcessLootAward: not equippable, invType=" .. tostring(invType)) end
            return 
        end
    end

    local baseEntry, tier = GetBaseAndTierForEntry(entry)
    if tier and tier > 0 then 
        if UPGRADE_DEBUG then DebugLog("ProcessLootAward: item is already upgraded (tier=" .. tier .. ")") end
        return 
    end

    if LOOT_UPGRADE_REQUIRE_ELIGIBLE and not IsEligibleItem(item) then 
        local quality = item:GetQuality()
        local class = item:GetClass()
        if UPGRADE_DEBUG then DebugLog("ProcessLootAward: not eligible (class=" .. tostring(class) .. " quality=" .. tostring(quality) .. ")") end
        return 
    end

    if not HasItemStats(item) then 
        if UPGRADE_DEBUG then DebugLog("ProcessLootAward: no stats") end
        return 
    end

    PruneLootUpgradeDedupeCache()

    local playerGuidLow = safeGetGuidLow(player)
    local itemGuidLow = safeGetGuidLow(item)
    if not playerGuidLow or not itemGuidLow then
        if UPGRADE_DEBUG then DebugLog("ProcessLootAward: missing GUID(s) for dedupe") end
        return
    end
    local dedupeKey = string.format("%d_%d", playerGuidLow, itemGuidLow)
    local currentTime = os.time()
    
    if LootUpgradeDedupeCache[dedupeKey] then
        local timeSinceLastProcess = currentTime - LootUpgradeDedupeCache[dedupeKey]
        if timeSinceLastProcess < LOOT_UPGRADE_DEDUPE_WINDOW_SEC then
            return
        end
    end
    
    LootUpgradeDedupeCache[dedupeKey] = currentTime

    local lootBadLuckCount = GetPlayerLootBadLuckCount(player)
    
    local adjustedChanceDenom = tonumber(LOOT_UPGRADE_CHANCE_DENOM) or 300
    adjustedChanceDenom = adjustedChanceDenom - lootBadLuckCount
    if adjustedChanceDenom < 1 then adjustedChanceDenom = 1 end
    
    local quality = item:GetQuality()
    local qualityBonus = GetQualityBasedBonus(quality)
    
    if not LOOT_UPGRADE_TEST_MODE then
        if math.random(1, math.floor(adjustedChanceDenom)) ~= 1 then
            IncrementPlayerLootBadLuckCount(player, qualityBonus)
            if UPGRADE_DEBUG then DebugLog(string.format("ProcessLootAward: upgrade roll failed, +%d from quality %d", qualityBonus, quality)) end
            return
        end
    end
    
    local newTier = SelectUpgradeTierWithPity(lootBadLuckCount)
    
    local cloneEntry = GetCloneEntry(baseEntry, newTier)
    if not cloneEntry or not TemplateExists(cloneEntry) then 
        if UPGRADE_DEBUG then DebugLog(string.format("ProcessLootAward: no clone template for baseEntry=%d at tier=%d (cloneEntry=%s)", baseEntry, newTier, tostring(cloneEntry))) end
        return 
    end
    
    if UPGRADE_DEBUG then DebugLog(string.format("ProcessLootAward: upgrade triggered! newTier=%d, TEST_MODE=%s", newTier, tostring(LOOT_UPGRADE_TEST_MODE))) end

    local testMode = LOOT_UPGRADE_TEST_MODE == true

    if player.CanStoreItem and type(player.CanStoreItem) == "function" then
        local ok, result = pcall(function() return player:CanStoreItem(255, 255, cloneEntry, 1) end)
        if ok and result and result ~= 0 then
            if UPGRADE_DEBUG then DebugLog(string.format("ProcessLootAward: no bag space (CanStoreItem returned %d)", result)) end
            return
        end
    end

    if not itemGuidLow then
        if UPGRADE_DEBUG then DebugLog("ProcessLootAward: missing item GUID") end
        return
    end
    local playerGuidFull = safeGetGuidFull(player)
    if UPGRADE_DEBUG then DebugLog(string.format("ProcessLootAward: starting item swap for baseEntry=%d newTier=%d cloneEntry=%d", baseEntry, newTier, cloneEntry)) end

    if not FindItemByGuidLow(player, itemGuidLow) then
        if LOOT_SWAP_MAX_TRIES > 0 and CreateLuaEvent then
            ScheduleLootUpgradeSwap(playerGuidFull, playerGuidLow, itemGuidLow, baseEntry, entry, cloneEntry, newTier, lootBadLuckCount, testMode, 1)
        end
        return
    end

    FinalizeLootUpgradeSwap(playerGuidFull, playerGuidLow, itemGuidLow, baseEntry, entry, cloneEntry, newTier, lootBadLuckCount, testMode, 1, true)
    end

    local ok, err = pcall(Run)
    ReleaseUpgradeLock(player)
    if not ok and UPGRADE_DEBUG then
        DebugLog("ProcessLootAward error: " .. tostring(err))
    end
end

local PendingLootAwardQueue = {}

local function FindOnlinePlayerByGuidLow(guidLow)
    if not guidLow or not GetPlayersInWorld then return nil end
    local players = GetPlayersInWorld()
    if type(players) ~= "table" then return nil end
    for i = 1, #players do
        local p = players[i]
        if p and p.GetGUIDLow and p.IsInWorld and p:IsInWorld() then
            local ok, pg = pcall(p.GetGUIDLow, p)
            if ok and pg == guidLow then
                return p
            end
        end
    end
    return nil
end

local function GetLootQueueInitialDelayMs(source)
    if source == "create" then return LOOT_CREATE_QUEUE_INITIAL_DELAY_MS end
    if source == "store" then return LOOT_STORE_QUEUE_INITIAL_DELAY_MS end
    if source == "roll" then return LOOT_ROLL_QUEUE_INITIAL_DELAY_MS end
    return LOOT_GENERAL_QUEUE_INITIAL_DELAY_MS
end

function QueueProcessLootAward(player, item, count, source)
    if not player or not item then return end

    local playerGuidLow = safeGetGuidLow(player)
    local itemGuidLow = safeGetGuidLow(item)
    if not playerGuidLow or not itemGuidLow then return end

    local key = tostring(playerGuidLow) .. ":" .. tostring(itemGuidLow)
    if PendingLootAwardQueue[key] then return end
    PendingLootAwardQueue[key] = {
        attempts = 1,
        maxTries = LOOT_QUEUE_MAX_TRIES,
        retryDelayMs = LOOT_QUEUE_RETRY_DELAY_MS,
        source = source or "loot",
    }

    local function ProcessQueuedLootAward(eventId, delay, repeats)
        local pending = PendingLootAwardQueue[key]
        if not pending then return end

        local livePlayer = FindOnlinePlayerByGuidLow(playerGuidLow)
        if not livePlayer then
            PendingLootAwardQueue[key] = nil
            return
        end

        local liveItem = FindItemByGuidLow(livePlayer, itemGuidLow)
        if not liveItem then
            pending.attempts = pending.attempts + 1
            if pending.attempts > pending.maxTries then
                if UPGRADE_DEBUG then
                    DebugLog(string.format(
                        "QueueProcessLootAward: dropped %s item GUID %d for player %d after %d attempts",
                        tostring(pending.source), itemGuidLow, playerGuidLow, pending.maxTries
                    ))
                end
                PendingLootAwardQueue[key] = nil
                return
            end
            if CreateLuaEvent then
                CreateLuaEvent(ProcessQueuedLootAward, pending.retryDelayMs, 1)
            else
                PendingLootAwardQueue[key] = nil
            end
            return
        end

        PendingLootAwardQueue[key] = nil
        ProcessLootAward(livePlayer, liveItem, count)
    end

    if CreateLuaEvent then
        CreateLuaEvent(ProcessQueuedLootAward, GetLootQueueInitialDelayMs(source), 1)
    else
        PendingLootAwardQueue[key] = nil
        ProcessLootAward(player, item, count)
    end
end

function OnLootItemUpgrade(event, player, item, count)
    if event == 32 then return end
    QueueProcessLootAward(player, item, count, "store")
end

function OnGroupRollRewardItem(event, player, item, count, voteType, roll)
    QueueProcessLootAward(player, item, count, "roll")
end

function OnCreateItemUpgrade(event, player, item, count)
    QueueProcessLootAward(player, item, count, "create")
end

function QueryGetGuid(q, idx)
    if q.GetUInt64 and type(q.GetUInt64) == "function" then
        return q:GetUInt64(idx)
    end
    if q.GetUInt32 and type(q.GetUInt32) == "function" then
        return q:GetUInt32(idx)
    end
    return nil
end

function FetchTemplateRequirements(entry)
    if not WorldDBQuery then return nil end
    local q = WorldDBQuery(string.format(
        "SELECT RequiredLevel, AllowableClass, AllowableRace, RequiredSkill, RequiredSkillRank, RequiredSpell, RequiredHonorRank, RequiredCityRank, RequiredReputationFaction, RequiredReputationRank, InventoryType, class, subclass FROM item_template WHERE entry=%u",
        entry
    ))
    if not q then return nil end
    return {
        RequiredLevel = q:GetUInt32(0),
        AllowableClass = QueryGetInt(q, 1),
        AllowableRace = QueryGetInt(q, 2),
        RequiredSkill = q:GetUInt32(3),
        RequiredSkillRank = q:GetUInt32(4),
        RequiredSpell = q:GetUInt32(5),
        RequiredHonorRank = q:GetUInt32(6),
        RequiredCityRank = q:GetUInt32(7),
        RequiredReputationFaction = q:GetUInt32(8),
        RequiredReputationRank = q:GetUInt32(9),
        InventoryType = q:GetUInt32(10),
        Class = q:GetUInt32(11),
        SubClass = q:GetUInt32(12),
    }
end

function RequirementsDiff(baseReq, cloneReq)
    local diffs = {}
    if not baseReq or not cloneReq then return diffs end
    local keys = {
        "RequiredLevel",
        "AllowableClass",
        "AllowableRace",
        "RequiredSkill",
        "RequiredSkillRank",
        "RequiredSpell",
        "RequiredHonorRank",
        "RequiredCityRank",
        "RequiredReputationFaction",
        "RequiredReputationRank",
        "InventoryType",
        "Class",
        "SubClass",
    }
    for i = 1, #keys do
        local k = keys[i]
        if baseReq[k] ~= cloneReq[k] then
            diffs[#diffs + 1] = k
        end
    end
    return diffs
end

function SyncCloneRequirements(baseEntry, cloneEntry, baseReq)
    if not AUTO_SYNC_CLONE_REQUIREMENTS or not WorldDBExecute or not baseReq then return false end
    local sql = string.format(
        "UPDATE item_template SET RequiredLevel=%u, AllowableClass=%d, AllowableRace=%d, RequiredSkill=%u, RequiredSkillRank=%u, RequiredSpell=%u, RequiredHonorRank=%u, RequiredCityRank=%u, RequiredReputationFaction=%u, RequiredReputationRank=%u, InventoryType=%u, class=%u, subclass=%u WHERE entry=%u",
        baseReq.RequiredLevel or 0,
        baseReq.AllowableClass or 0,
        baseReq.AllowableRace or 0,
        baseReq.RequiredSkill or 0,
        baseReq.RequiredSkillRank or 0,
        baseReq.RequiredSpell or 0,
        baseReq.RequiredHonorRank or 0,
        baseReq.RequiredCityRank or 0,
        baseReq.RequiredReputationFaction or 0,
        baseReq.RequiredReputationRank or 0,
        baseReq.InventoryType or 0,
        baseReq.Class or 0,
        baseReq.SubClass or 0,
        cloneEntry
    )
    WorldDBExecute(sql)
    return true
end

function CloneTemplateMatchesBase(baseEntry, cloneEntry)
    local baseTpl = GetItemTemplate(baseEntry)
    local cloneTpl = GetItemTemplate(cloneEntry)
    if not baseTpl or not cloneTpl then return false end
    local baseClass = baseTpl:GetClass() or 0
    local baseSub = baseTpl:GetSubClass() or 0
    local baseInv = baseTpl:GetInventoryType() or 0
    local cloneClass = cloneTpl:GetClass() or 0
    local cloneSub = cloneTpl:GetSubClass() or 0
    local cloneInv = cloneTpl:GetInventoryType() or 0
    return baseClass == cloneClass and baseSub == cloneSub and baseInv == cloneInv
end

function ValidateCloneTemplate(player, baseEntry, cloneEntry)
    if not baseEntry or not cloneEntry then return false end
    if not IsCloneEntryInRange(cloneEntry) then
        DebugMessage(player, string.format("Clone entry %u is outside allowed clone range.", cloneEntry))
        return false
    end
    if not CloneTemplateMatchesBase(baseEntry, cloneEntry) then
        DebugMessage(player, string.format("Clone entry %u does not match base %u (class/subclass/invtype).", cloneEntry, baseEntry))
        return false
    end

    local baseReq = FetchTemplateRequirements(baseEntry)
    local cloneReq = FetchTemplateRequirements(cloneEntry)
    if baseReq and cloneReq then
        local diffs = RequirementsDiff(baseReq, cloneReq)
        if #diffs > 0 then
            DebugMessage(player, string.format("Clone entry %u requirements differ from base %u: %s", cloneEntry, baseEntry, table.concat(diffs, ", ")))
            if SyncCloneRequirements(baseEntry, cloneEntry, baseReq) then
                DebugMessage(player, "Clone requirements synced in DB. Restart worldserver or reload item_template to apply.")
            end
            return false
        end
    end
    return true
end

local ManualItemRequiredLevelCache = {}

local function GetItemRequiredLevel(item)
    if not item then return 0 end

    if item.GetRequiredLevel and type(item.GetRequiredLevel) == "function" then
        local ok, req = pcall(item.GetRequiredLevel, item)
        if ok and req and req > 0 then
            return tonumber(req) or 0
        end
    end

    local entry = safeItemGetEntry(item)
    if not entry or entry <= 0 then return 0 end

    local cached = ManualItemRequiredLevelCache[entry]
    if cached ~= nil then
        return cached
    end

    local req = 0
    local tpl = GetItemTemplate and GetItemTemplate(entry) or nil
    if tpl and tpl.GetRequiredLevel and type(tpl.GetRequiredLevel) == "function" then
        local ok, v = pcall(tpl.GetRequiredLevel, tpl)
        if ok and v and v > 0 then
            req = tonumber(v) or 0
        end
    end

    if req <= 0 then
        local t = FetchTemplateRequirements(entry)
        req = tonumber(t and t.RequiredLevel or 0) or 0
    end

    ManualItemRequiredLevelCache[entry] = req
    return req
end

local function GetOverleveledItemChanceMultiplier(player, item)
    local mult = tonumber(UPGRADE_OVERLEVELED_ITEM_CHANCE_MULTIPLIER) or 1
    if mult <= 1 then return 1 end

    local gap = tonumber(UPGRADE_OVERLEVELED_ITEM_LEVEL_GAP) or 10
    if gap < 0 then gap = 0 end

    local playerLevel = safeGetPlayerLevel(player)
    if playerLevel <= 0 then return 1 end

    local reqLevel = GetItemRequiredLevel(item)
    if reqLevel <= 0 then return 1 end

    if (playerLevel - reqLevel) >= gap then
        return mult
    end
    return 1
end

function UpgradeSuccessChance(tier, chanceImprovementMode, badLuckCount, player, item)
    local chance
    chanceImprovementMode = chanceImprovementMode or 0
    badLuckCount = badLuckCount or 0
    
    if chanceImprovementMode == 2 then
        return 100
    end
    
    chance = 95 - (tier * 3.75)
    
    if chanceImprovementMode == 1 then
        local keepsakeBonus
        if tier <= 20 then
            keepsakeBonus = 20 - (tier * 0.75)
        else
            keepsakeBonus = 5
        end
        chance = chance + keepsakeBonus
    end
    
    chance = chance + GetBadLuckBonus(badLuckCount)

    chance = chance + GetManualLevelChanceBonus(player)

    chance = chance * GetOverleveledItemChanceMultiplier(player, item)
    
    if chance < 3 then chance = 3 end
    if chance > 95 then chance = 95 end
    return chance
end

function ConsumeProtectionStone(player, chanceImprovementMode)
    if chanceImprovementMode == 1 then
        if player:HasItem(KEEPSAKE_STONE_ITEM_ID, 1) == false then
            return false, "You do not have a keepsake stone."
        end
        local ok = pcall(function() player:RemoveItem(KEEPSAKE_STONE_ITEM_ID, 1) end)
        if not ok then return false, "Failed to remove keepsake stone." end
        return true, nil
    end

    if chanceImprovementMode == 2 then
        if player:HasItem(LEGENDARY_STONE_ITEM_ID, 1) == false then
            return false, "You do not have a legendary stone."
        end
        local ok = pcall(function() player:RemoveItem(LEGENDARY_STONE_ITEM_ID, 1) end)
        if not ok then return false, "Failed to remove legendary stone." end
        return true, nil
    end

    return true, nil
end

function RefundProtectionStone(player, chanceImprovementMode)
    if chanceImprovementMode == 1 then
        local ok = pcall(function() return player:AddItem(KEEPSAKE_STONE_ITEM_ID, 1) end)
        if not ok then
            return false, "Keepsake stone refund failed (no bag space)."
        end
        return true, nil
    end
    if chanceImprovementMode == 2 then
        local ok = pcall(function() return player:AddItem(LEGENDARY_STONE_ITEM_ID, 1) end)
        if not ok then
            return false, "Legendary stone refund failed (no bag space)."
        end
        return true, nil
    end
    return true, nil
end

function GetPending(player)
    if not player then return { slot = nil, bagSlot = nil, bagGuidLow = nil, equipGuidLow = nil, mode = nil } end
    local ok, guid = pcall(function() return player:GetGUIDLow() end)
    if not ok or not guid then return { slot = nil, bagSlot = nil, bagGuidLow = nil, equipGuidLow = nil, mode = nil } end
    PendingSelection[guid] = PendingSelection[guid] or { slot = nil, bagSlot = nil, bagGuidLow = nil, equipGuidLow = nil, mode = nil }
    return PendingSelection[guid]
end

function ChargeCopper(player, costCopper)
    local ok, money = pcall(function() return player:GetCoinage() or 0 end)
    if not ok then return false end
    money = money or 0
    if money < costCopper then
        return false
    end
    local chargeOk = pcall(function() player:ModifyMoney(-costCopper) end)
    return chargeOk
end

function safeGetEnchantId(item, slot)
    if not item or slot == nil then return 0 end
    if item.GetEnchantmentId and type(item.GetEnchantmentId) == "function" then
        local ok, res = pcall(item.GetEnchantmentId, item, slot)
        if ok then return res or 0 end
    end
    return 0
end

function safeSetEnchant(item, id, slot)
    if not item or not id or id <= 0 or slot == nil then return false end
    if item.SetEnchantment and type(item.SetEnchantment) == "function" then
        local ok, res = pcall(item.SetEnchantment, item, id, slot)
        if ok then return res ~= false end
    end
    return false
end

function SnapshotEnchants(item)
    local enchants = {}
    if not item then return enchants end
    for i = 1, #ENCHANT_COPY_SLOTS do
        local slot = ENCHANT_COPY_SLOTS[i]
        local id = safeGetEnchantId(item, slot)
        if id and id > 0 then
            enchants[slot] = id
        end
    end
    return enchants
end

function safeGetGuidFull(item)
    if not item then return nil end
    if type(item) ~= "userdata" and type(item) ~= "table" then return nil end
    if item.GetGUID and type(item.GetGUID) == "function" then
        local ok, res = pcall(item.GetGUID, item)
        if ok and res then
            return tostring(res)
        end
    end
    return nil
end

function safeGetItemByPos(player, bag, slot)
    if not player then return nil end
    if not player.GetItemByPos then return nil end
    local ok, item = pcall(function() return player:GetItemByPos(bag, slot) end)
    if not ok then return nil end
    return item
end

function safeGetPlayerLevel(player)
    if not player then return (tonumber(MAX_PLAYER_LEVEL) or 80) end
    local ok, level = pcall(function() return player:GetLevel() end)
    if not ok or not level then return (tonumber(MAX_PLAYER_LEVEL) or 80) end
    return level
end

function safeGetCoinage(player)
    if not player then return 0 end
    local ok, money = pcall(function() return player:GetCoinage() end)
    if not ok or not money then return 0 end
    return money
end

function IsPlayerGM(player)
    if not player then return false end
    if player.IsGM and type(player.IsGM) == "function" then
        local ok, res = pcall(player.IsGM, player)
        if ok then return res and true or false end
    end
    if player.GetGMRank and type(player.GetGMRank) == "function" then
        local ok, res = pcall(player.GetGMRank, player)
        if ok then return (res or 0) > 0 end
    end
    return false
end

function isValidPlayer(player)
    if not player then return false end
    if type(player) ~= "userdata" and type(player) ~= "table" then return false end
    local ok, inWorld = pcall(function()
        if player.IsInWorld then
            return player:IsInWorld()
        end
        return true
    end)
    if not ok then return false end
    if inWorld == false then return false end
    return true
end

function isValidCreature(creature)
    if not creature then return false end
    if type(creature) ~= "userdata" and type(creature) ~= "table" then return false end
    local ok, entry = pcall(function()
        if creature.GetEntry then
            return creature:GetEntry()
        end
        return nil
    end)
    if not ok then return false end
    if not entry then return false end
    return true
end

function isValidItem(item)
    if not item then return false end
    if type(item) ~= "userdata" and type(item) ~= "table" then return false end
    return true
end

function safeItemGetEntry(item)
    if not isValidItem(item) then return nil end
    local ok, entry = pcall(function() return item:GetEntry() end)
    return ok and entry or nil
end

function safeItemGetItemLink(item)
    if not isValidItem(item) then return nil end
    local ok, link = pcall(function() return item:GetItemLink() end)
    return ok and link or nil
end

function safeItemGetName(item)
    if not isValidItem(item) then return nil end
    local ok, name = pcall(function() return item:GetName() end)
    return ok and name or nil
end

function safePlayerRemoveItem(player, item, count)
    if not isValidPlayer(player) or not isValidItem(item) then return false end
    local ok = pcall(function() player:RemoveItem(item, count) end)
    return ok
end

function safePlayerRemoveItemByEntry(player, entry, count)
    if not isValidPlayer(player) or not entry then return false end
    local ok = pcall(function() player:RemoveItem(entry, count) end)
    return ok
end

function safeRemoveItemByGuidInBags(player, guidFull, guidLow)
    if not isValidPlayer(player) then return false end
    if not player.RemoveItem then return false end
    local it = FindItemByGuidInBags(player, guidFull, guidLow)
    if not isValidItem(it) then return false end
    return SafePcall("Player.RemoveItem", player.RemoveItem, player, it, 1)
end

function DetectColumn(q, names)
    if not q or not names then return nil end
    local rows = q.GetRowCount and q:GetRowCount() or 0
    for _ = 1, rows do
        local name = q.GetString and q:GetString(0) or nil
        if name then
            for i = 1, #names do
                if name == names[i] then
                    return name
                end
            end
        end
        if not q.NextRow or not q:NextRow() then
            break
        end
    end
    return nil
end

function DetectItemInstanceEntryColumn()
    if STATE.ITEM_INSTANCE_ENTRY_COLUMN ~= nil then
        return (STATE.ITEM_INSTANCE_ENTRY_COLUMN ~= false and STATE.ITEM_INSTANCE_ENTRY_COLUMN or nil)
    end
    if not CharDBQuery then
        STATE.ITEM_INSTANCE_ENTRY_COLUMN = false
        return nil
    end
    local q = CharDBQuery("SHOW COLUMNS FROM item_instance")
    if not q then
        STATE.ITEM_INSTANCE_ENTRY_COLUMN = false
        return nil
    end
    local col = DetectColumn(q, {"itemEntry", "entry"})
    STATE.ITEM_INSTANCE_ENTRY_COLUMN = col or false
    return col
end

function DetectCharInvItemColumn()
    if STATE.CHAR_INV_ITEM_COLUMN ~= nil then
        return (STATE.CHAR_INV_ITEM_COLUMN ~= false and STATE.CHAR_INV_ITEM_COLUMN or nil)
    end
    if not CharDBQuery then
        STATE.CHAR_INV_ITEM_COLUMN = false
        return nil
    end
    local q = CharDBQuery("SHOW COLUMNS FROM character_inventory")
    if not q then
        STATE.CHAR_INV_ITEM_COLUMN = false
        return nil
    end
    local col = DetectColumn(q, {"item", "item_guid"})
    STATE.CHAR_INV_ITEM_COLUMN = col or false
    return col
end

function NormalizeCreatorGuidLow(value)
    local n = tonumber(value)
    if not n or n <= 0 then return 0 end
    if n > 4294967295 then
        n = n % 4294967296
    end
    return math.floor(n)
end

function GetItemCreatorGuidLowFromApi(item)
    if not item then return 0 end
    if item.GetCreatorGUIDLow and type(item.GetCreatorGUIDLow) == "function" then
        local ok, v = pcall(item.GetCreatorGUIDLow, item)
        if ok then
            local n = NormalizeCreatorGuidLow(v)
            if n > 0 then return n end
        end
    end
    if item.GetCreatorGUID and type(item.GetCreatorGUID) == "function" then
        local ok, v = pcall(item.GetCreatorGUID, item)
        if ok then
            local n = NormalizeCreatorGuidLow(v)
            if n > 0 then return n end
        end
    end
    if ITEM_FIELD_CREATOR and ITEM_FIELD_CREATOR >= 0 and item.GetUInt32Value and type(item.GetUInt32Value) == "function" then
        local ok, v = pcall(item.GetUInt32Value, item, ITEM_FIELD_CREATOR)
        if ok then
            return NormalizeCreatorGuidLow(v)
        end
    end
    return 0
end

function DetectItemInstanceCreatorColumn()
    if STATE.ITEM_INSTANCE_CREATOR_COLUMN ~= nil then
        return (STATE.ITEM_INSTANCE_CREATOR_COLUMN ~= false and STATE.ITEM_INSTANCE_CREATOR_COLUMN or nil)
    end
    if not CharDBQuery then
        STATE.ITEM_INSTANCE_CREATOR_COLUMN = false
        return nil
    end
    local q = CharDBQuery("SHOW COLUMNS FROM item_instance")
    if not q then
        STATE.ITEM_INSTANCE_CREATOR_COLUMN = false
        return nil
    end
    local names = {}
    local seen = {}
    local preferred = tostring(ITEM_INSTANCE_CREATOR_COLUMN or "creatorGuid")
    if preferred:match("^[%w_]+$") then
        names[#names + 1] = preferred
        seen[preferred] = true
    end
    local defaults = { "creatorGuid", "creator_guid", "creator" }
    for i = 1, #defaults do
        local name = defaults[i]
        if not seen[name] then
            names[#names + 1] = name
            seen[name] = true
        end
    end
    local col = DetectColumn(q, names)
    STATE.ITEM_INSTANCE_CREATOR_COLUMN = col or false
    return col
end

function QueryItemCreatorGuidLowFromDB(itemGuidLow)
    if not itemGuidLow or itemGuidLow <= 0 then return 0 end
    if not CharDBQuery then return 0 end
    local col = DetectItemInstanceCreatorColumn()
    if not col then return 0 end
    local q = CharDBQuery(string.format("SELECT %s FROM item_instance WHERE guid=%u", col, itemGuidLow))
    if not q then return 0 end
    local raw = QueryGetGuid(q, 0)
    return NormalizeCreatorGuidLow(raw)
end

function GetItemCreatorGuidLow(item)
    local creatorGuidLow = GetItemCreatorGuidLowFromApi(item)
    if creatorGuidLow > 0 then
        return creatorGuidLow
    end
    local itemGuidLow = safeGetGuidLow(item)
    if itemGuidLow and itemGuidLow > 0 then
        return QueryItemCreatorGuidLowFromDB(itemGuidLow)
    end
    return 0
end

function TrySetItemCreatorGuidLow(item, creatorGuidLow)
    local creatorLow = NormalizeCreatorGuidLow(creatorGuidLow)
    if creatorLow <= 0 then return true end
    if not item then return false end

    local setterDefs = {
        { "SetCreatorGUIDLow", { creatorLow } },
        { "SetCreatorGuidLow", { creatorLow } },
        { "SetCreatorGUID", { creatorLow } },
        { "SetCreatorGuid", { creatorLow } },
        { "SetCreator", { creatorLow } },
        { "SetUInt32Value", { ITEM_FIELD_CREATOR, creatorLow } },
    }

    local unpackFn = unpack or table.unpack
    for i = 1, #setterDefs do
        local def = setterDefs[i]
        local fnName, args = def[1], def[2]
        local fn = item[fnName]
        if fn and type(fn) == "function" then
            local ok = SafePcall("Item." .. fnName, fn, item, unpackFn(args))
            if ok then
                local verify = GetItemCreatorGuidLowFromApi(item)
                if verify == 0 or verify == creatorLow then
                    return true
                end
            end
        end
    end
    return false
end

function PersistItemCreatorGuidLowToDB(itemGuidLow, creatorGuidLow)
    local creatorLow = NormalizeCreatorGuidLow(creatorGuidLow)
    if creatorLow <= 0 then return true end
    if not itemGuidLow or itemGuidLow <= 0 then return false end
    if not CREATOR_DB_FALLBACK and not ALLOW_ONLINE_DB_MUTATION then return false end
    if not CharDBExecute then return false end
    local col = DetectItemInstanceCreatorColumn()
    if not col then return false end
    return pcall(CharDBExecute, string.format("UPDATE item_instance SET %s=%u WHERE guid=%u", col, creatorLow, itemGuidLow))
end

function ApplyCreatorGuidLowToItem(newItem, creatorGuidLow)
    local creatorLow = NormalizeCreatorGuidLow(creatorGuidLow)
    if creatorLow <= 0 then return true end
    if not newItem then return false end
    if TrySetItemCreatorGuidLow(newItem, creatorLow) then
        return true
    end
    local newGuidLow = safeGetGuidLow(newItem)
    if PersistItemCreatorGuidLowToDB(newGuidLow, creatorLow) then
        return true
    end
    if UPGRADE_DEBUG then
        DebugLog(string.format("Failed to preserve creator GUID %u on upgraded item guid=%s", creatorLow, tostring(newGuidLow)))
    end
    return false
end

function PreserveItemCreator(oldItem, newItem)
    local creatorLow = GetItemCreatorGuidLow(oldItem)
    return ApplyCreatorGuidLowToItem(newItem, creatorLow)
end

function IsCreatorOwnedByPlayer(player, creatorGuidLow)
    local playerGuidLow = safeGetGuidLow(player)
    if not playerGuidLow or playerGuidLow <= 0 then return false end
    local creatorLow = NormalizeCreatorGuidLow(creatorGuidLow)
    return creatorLow > 0 and creatorLow == playerGuidLow
end

function NotifyHardcoreCraftedHint(player, itemEntry, item)
    if type(HardcoreMarkCraftedItemForPlayer) ~= "function" then return end
    if itemEntry and itemEntry > 0 then
        pcall(HardcoreMarkCraftedItemForPlayer, player, itemEntry)
    end
    if item and (type(item) == "userdata" or type(item) == "table") then
        pcall(HardcoreMarkCraftedItemForPlayer, player, item)
    end
end

function PersistEquippedToDB(playerGuidLow, slot, item, newEntry)
    if not EQUIPPED_UPGRADE_ENABLED then return end
    if not ALLOW_ONLINE_DB_MUTATION then
        if UPGRADE_DEBUG then DebugLog("PersistEquippedToDB skipped (online DB mutation disabled)") end
        return
    end
    if not CharDBExecute or not playerGuidLow or slot == nil or not item or not newEntry then return end
    local guidLow = safeGetGuidLow(item)
    if not guidLow then return end

    local entryCol = DetectItemInstanceEntryColumn()
    if entryCol then
        pcall(CharDBExecute, string.format("UPDATE item_instance SET %s=%u WHERE guid=%u", entryCol, newEntry, guidLow))
    else
        pcall(CharDBExecute, string.format("UPDATE item_instance SET itemEntry=%u WHERE guid=%u", newEntry, guidLow))
        pcall(CharDBExecute, string.format("UPDATE item_instance SET entry=%u WHERE guid=%u", newEntry, guidLow))
    end

    local itemCol = DetectCharInvItemColumn()
    if not itemCol then return end
    pcall(CharDBExecute, string.format(
        "UPDATE character_inventory SET %s=%u WHERE guid=%u AND bag=%u AND slot=%u",
        itemCol, guidLow, playerGuidLow, 255, slot
    ))

    if CreateLuaEvent then
        ScheduleDbUpgradeVerify(playerGuidLow, slot, guidLow, newEntry)
    end
end

function QueryEquippedGuidLow(playerGuidLow, slot)
    if not EQUIPPED_UPGRADE_ENABLED then return nil end
    if not CharDBQuery or not playerGuidLow or slot == nil then return nil end
    local itemCol = DetectCharInvItemColumn()
    if not itemCol then return nil end
    local q = CharDBQuery(string.format(
        "SELECT %s FROM character_inventory WHERE guid=%u AND bag=%u AND slot=%u",
        itemCol, playerGuidLow, 255, slot
    ))
    if not q then return nil end
    return QueryGetGuid(q, 0)
end

function QueryItemInstanceEntry(guidLow)
    if not EQUIPPED_UPGRADE_ENABLED then return nil end
    if not CharDBQuery or not guidLow then return nil end
    local entryCol = DetectItemInstanceEntryColumn()
    if not entryCol then return nil end
    local q = CharDBQuery(string.format(
        "SELECT %s FROM item_instance WHERE guid=%u",
        entryCol, guidLow
    ))
    if not q then return nil end
    return QueryGetInt(q, 0)
end

function IsEquippedPersisted(playerGuidLow, slot, expectedEntry, equippedItem)
    if not EQUIPPED_UPGRADE_ENABLED then return false end
    if not playerGuidLow or slot == nil or not expectedEntry then return false end
    if not CharDBQuery then return false end
    local guidLow = nil
    if equippedItem then
        guidLow = safeGetGuidLow(equippedItem)
    end
    if not guidLow then
        guidLow = QueryEquippedGuidLow(playerGuidLow, slot)
    end
    if not guidLow then return false end
    local entry = QueryItemInstanceEntry(guidLow)
    if not entry then return false end
    return entry == expectedEntry
end

local DB_UPGRADE_RETRY_DELAY_MS = 500
local DB_UPGRADE_MAX_TRIES = 3

function ScheduleDbUpgradeVerify(playerGuidLow, slot, guidLow, expectedEntry, attempt)
    attempt = attempt or 1
    if attempt > DB_UPGRADE_MAX_TRIES then return end
    CreateLuaEvent(SafeCallback(function()
        if IsEquippedPersisted(playerGuidLow, slot, expectedEntry, nil) then return end
        if not CharDBExecute then return end
        local entryCol = DetectItemInstanceEntryColumn()
        if not entryCol then return end
        pcall(CharDBExecute, string.format(
            "UPDATE item_instance SET %s=%u WHERE guid=%u",
            entryCol, expectedEntry, guidLow
        ))
        if attempt < DB_UPGRADE_MAX_TRIES then
            ScheduleDbUpgradeVerify(playerGuidLow, slot, guidLow, expectedEntry, attempt + 1)
        end
    end, function() return true end), DB_UPGRADE_RETRY_DELAY_MS, 1)
end

function ApplyEnchants(item, enchants)
    if not item or not enchants then return end
    for slot, id in pairs(enchants) do
        safeSetEnchant(item, id, slot)
    end
end

local BAG_SLOT_CONFIG = {
    EQUIP_BAG = 255,
    EQUIP_SLOT_MIN = 0,
    EQUIP_SLOT_MAX = 18,
    BACKPACK_SLOT_START = 23,
    BAG_SLOT_FALLBACK = 36,
    BACKPACK_UPGRADE_SLOT_COUNT = 10,
    NUM_BAG_SLOTS = 4,
    BAG_EQUIP_SLOTS = { [1] = 19, [2] = 20, [3] = 21, [4] = 22 },
}

local EQUIP_SLOT_NAMES = {
    [0] = "Head",
    [1] = "Neck",
    [2] = "Shoulder",
    [3] = "Shirt",
    [4] = "Chest",
    [5] = "Waist",
    [6] = "Legs",
    [7] = "Feet",
    [8] = "Wrist",
    [9] = "Hands",
    [10] = "Finger 1",
    [11] = "Finger 2",
    [12] = "Trinket 1",
    [13] = "Trinket 2",
    [14] = "Back",
    [15] = "Main Hand",
    [16] = "Off Hand",
    [17] = "Ranged",
    [18] = "Tabard",
}

local EQUIP_BAG, EQUIP_SLOT_MIN, EQUIP_SLOT_MAX, BACKPACK_SLOT_START, BAG_SLOT_FALLBACK, BACKPACK_UPGRADE_SLOT_COUNT, NUM_BAG_SLOTS, BAG_EQUIP_SLOTS
EQUIP_BAG, EQUIP_SLOT_MIN, EQUIP_SLOT_MAX, BACKPACK_SLOT_START, BAG_SLOT_FALLBACK, BACKPACK_UPGRADE_SLOT_COUNT, NUM_BAG_SLOTS, BAG_EQUIP_SLOTS = 
    BAG_SLOT_CONFIG.EQUIP_BAG, BAG_SLOT_CONFIG.EQUIP_SLOT_MIN, BAG_SLOT_CONFIG.EQUIP_SLOT_MAX, BAG_SLOT_CONFIG.BACKPACK_SLOT_START, BAG_SLOT_CONFIG.BAG_SLOT_FALLBACK, BAG_SLOT_CONFIG.BACKPACK_UPGRADE_SLOT_COUNT, BAG_SLOT_CONFIG.NUM_BAG_SLOTS, BAG_SLOT_CONFIG.BAG_EQUIP_SLOTS

function GetBagSlotCount(player, bag)
    if not player then return 0 end
    if bag == 0 then
        if player.GetBagSize then
            local ok, res = pcall(player.GetBagSize, player, bag)
            if ok and res and res > 0 then return res end
        end
        return BAG_SLOT_FALLBACK
    end
    local equipSlot = BAG_EQUIP_SLOTS[bag]
    if not equipSlot then return 0 end
    if not player.GetItemByPos then return 0 end
    local ok, bagItem = pcall(player.GetItemByPos, player, EQUIP_BAG, equipSlot)
    if not ok or not bagItem then return 0 end
    if bagItem.GetBagSize then
        local okSize, size = pcall(bagItem.GetBagSize, bagItem)
        if okSize and size and size > 0 then return size end
    end
    return BAG_SLOT_FALLBACK
end

function CountFreeBackpackSlots(player)
    if not player or not player.GetItemByPos then return 0 end
    local size = GetBagSlotCount(player, 0)
    if size <= 0 then return 0 end
    local free = 0
    for slot = 0, size - 1 do
        local it = safeGetItemByPos(player, EQUIP_BAG, BACKPACK_SLOT_START + slot)
        if not it then
            free = free + 1
        end
    end
    return free
end

function GetEquipSlotLabel(slot)
    return EQUIP_SLOT_NAMES[slot] or ("Slot " .. tostring(slot))
end

function ForEachBagItem(player, handler)
    if not player or not handler or not player.GetItemByPos then return false end
    local seen = {}
    local function handle(it, bag, slot)
        local guidLow = safeGetGuidLow(it)
        if guidLow then
            if seen[guidLow] then return false end
            seen[guidLow] = true
        end
        return handler(it, bag, slot) == true
    end


    local backpackSize = GetBagSlotCount(player, 0)
    for slot = 0, backpackSize - 1 do
        local it = safeGetItemByPos(player, EQUIP_BAG, BACKPACK_SLOT_START + slot)
        if it then
            if handle(it, EQUIP_BAG, BACKPACK_SLOT_START + slot) then return true end
        end
    end

    for bag = 1, 4 do
        local size = GetBagSlotCount(player, bag)
        local bagSlot = BAG_EQUIP_SLOTS[bag]
        if bagSlot then
            for slot = 0, size - 1 do
                local it = safeGetItemByPos(player, bagSlot, slot)
                if it then
                    if handle(it, bagSlot, slot) then return true end
                end
            end
        end
    end

    for bag = 0, 4 do
        local size = GetBagSlotCount(player, bag)
        for slot = 0, size - 1 do
            local it = safeGetItemByPos(player, bag, slot)
            if it then
                if handle(it, bag, slot) then return true end
            end
        end
    end
    return false
end

function CountFreeBagSlots(player)
    if not player then return 0 end
    local total = 0
    for bag = 0, 4 do
        total = total + GetBagSlotCount(player, bag)
    end
    local used = 0
    ForEachBagItem(player, function()
        used = used + 1
        return false
    end)
    local free = total - used
    if free < 0 then free = 0 end
    return free
end

function HasFreeBagSlot(player, entry)
    if player and player.CanStoreItem and type(player.CanStoreItem) == "function" and entry then
        local ok, result = pcall(function() return player:CanStoreItem(255, 255, entry, 1) end)
        if ok and result and result ~= 0 then
            return false
        end
        if ok and result == 0 then
            return true
        end
    end
    return CountFreeBagSlots(player) > 0
end

function FindItemByGuidLow(player, guidLow)
    if not player or not guidLow or not player.GetItemByPos then return nil end
    for slot = EQUIP_SLOT_MIN, EQUIP_SLOT_MAX do
        local it = safeGetItemByPos(player, EQUIP_BAG, slot)
        if it then
            local okGuid, itemGuid = pcall(function() return it:GetGUIDLow() end)
            if okGuid and itemGuid == guidLow then return it end
        end
    end
    local found = nil
    ForEachBagItem(player, function(it)
        local okGuid, itemGuid = pcall(function() return it:GetGUIDLow() end)
        if okGuid and itemGuid == guidLow then
            found = it
            return true
        end
        return false
    end)
    if found then return found end
    return nil
end

PlayerHasItemByGUID = function(player, itemGuidLow)
    if not player or not itemGuidLow then return false end
    return FindItemByGuidLow(player, itemGuidLow) ~= nil
end

function FindItemByGuidFull(player, guidFull)
    if not player or not guidFull or not player.GetItemByPos then return nil end
    for slot = EQUIP_SLOT_MIN, EQUIP_SLOT_MAX do
        local it = safeGetItemByPos(player, EQUIP_BAG, slot)
        if it and safeGetGuidFull(it) == guidFull then return it end
    end
    local found = nil
    ForEachBagItem(player, function(it)
        if safeGetGuidFull(it) == guidFull then
            found = it
            return true
        end
        return false
    end)
    if found then return found end
    return nil
end

function FindItemByGuid(player, guidFull, guidLow)
    if not player then return nil end
    if guidLow then
        local item = FindItemByGuidLow(player, guidLow)
        if item then return item end
    end
    if guidFull then
        return FindItemByGuidFull(player, guidFull)
    end
    return nil
end

function FindItemByGuidInBags(player, guidFull, guidLow)
    if not player then return nil end
    local found = nil
    ForEachBagItem(player, function(it)
        if guidLow and safeGetGuidLow(it) == guidLow then
            found = it
            return true
        end
        if guidFull and safeGetGuidFull(it) == guidFull then
            found = it
            return true
        end
        return false
    end)
    return found
end

function GetPlayerByAnyGuid(guidFull, guidLow)
    local player = nil
    if guidLow and GetPlayerByGUID then
        local ok, p = pcall(GetPlayerByGUID, guidLow)
        if ok and p then
            player = p
        end
    end
    return player
end

local RemoveItemLater
local TryUnequipSlot

function GetEquippedItemBySlotSafe(player, slot)
    if not player then return nil end
    if player.GetEquippedItemBySlot then
        local ok, res = pcall(player.GetEquippedItemBySlot, player, slot)
        if ok and res then return res end
    end
    if player.GetItemByPos then
        local ok, res = pcall(player.GetItemByPos, player, EQUIP_BAG, slot)
        if ok and res then return res end
    end
    return nil
end

function GetEquippedEntry(player, slot)
    local eq = GetEquippedItemBySlotSafe(player, slot)
    if not eq or not eq.GetEntry then return 0 end
    local ok, entry = pcall(eq.GetEntry, eq)
    if ok then return entry or 0 end
    return 0
end

function CountItemEntry(player, entry)
    if not player or not entry then return 0 end
    if player.GetItemCount then
        local ok, res = pcall(player.GetItemCount, player, entry)
        if ok then return res or 0 end
    end
    return 0
end

function CountEntryInBags(player, entry)
    if not player or not entry or not player.GetItemByPos then return 0 end
    local count = 0
    ForEachBagItem(player, function(it)
        if it.GetEntry then
            local ok, res = pcall(it.GetEntry, it)
            if ok and res == entry then
                count = count + 1
            end
        end
        return false
    end)
    return count
end

function CountEntryInBagsTotal(player, entry)
    if not player or not entry or not player.GetItemByPos then return 0 end
    local count = 0
    ForEachBagItem(player, function(it)
        if it.GetEntry then
            local ok, res = pcall(it.GetEntry, it)
            if ok and res == entry then
                local qty = 1
                if it.GetCount then
                    local okCount, resCount = pcall(it.GetCount, it)
                    if okCount and resCount then
                        qty = resCount
                    end
                end
                count = count + qty
            end
        end
        return false
    end)
    return count
end

function GetStoneCount(player, entry)
    if not player or not entry then return 0 end
    return CountEntryInBagsTotal(player, entry)
end

function FindItemByEntryInBags(player, entry)
    if not player or not entry or not player.GetItemByPos then return nil end
    local found = nil
    ForEachBagItem(player, function(it)
        if it.GetEntry then
            local ok, res = pcall(it.GetEntry, it)
            if ok and res == entry then
                found = it
                return true
            end
        end
        return false
    end)
    if found then return found end
    return nil
end

function CollectEntryGuidLowsInBags(player, entry)
    local guids = {}
    if not player or not entry or not player.GetItemByPos then return guids end
    ForEachBagItem(player, function(it)
        if it.GetEntry then
            local ok, res = pcall(it.GetEntry, it)
            if ok and res == entry then
                local guidLow = safeGetGuidLow(it)
                if guidLow then
                    guids[guidLow] = true
                end
            end
        end
        return false
    end)
    return guids
end

function FindNewItemByEntry(player, entry, existingGuids)
    if not player or not entry or not player.GetItemByPos then return nil end
    local hasExisting = existingGuids and next(existingGuids) ~= nil
    local found = nil
    ForEachBagItem(player, function(it)
        if it.GetEntry then
            local ok, res = pcall(it.GetEntry, it)
            if ok and res == entry then
                local guidLow = safeGetGuidLow(it)
                if not hasExisting then
                    found = it
                    return true
                end
                if guidLow and not existingGuids[guidLow] then
                    found = it
                    return true
                end
            end
        end
        return false
    end)
    if found then return found end
    return nil
end

function VerifyEquippedEntry(player, slot, entry)
    local eq = GetEquippedItemBySlotSafe(player, slot)
    if not eq or not eq.GetEntry then return false, nil end
    local ok, eqEntry = pcall(eq.GetEntry, eq)
    if ok and eqEntry == entry then
        return true, eq
    end
    return false, nil
end

function AttemptEquipEntry(player, slot, entry)
    if not player or not player.EquipItem then return nil end
    if type(player) ~= "userdata" and type(player) ~= "table" then return nil end
    if type(slot) ~= "number" or slot < EQUIP_SLOT_MIN or slot > EQUIP_SLOT_MAX then return nil end
    if type(entry) ~= "number" or entry <= 0 then return nil end
    if not TemplateExists(entry) then return nil end
    local function tryEquip(a, b)
        if not player or not player.EquipItem then return nil end
        local ok = SafePcall("Player.EquipItem", player.EquipItem, player, a, b)
        if ok then
            if not player then return nil end
            local success, eq = VerifyEquippedEntry(player, slot, entry)
            if success then return eq end
        end
        return nil
    end
    local eq = tryEquip(entry, slot)
    if eq then return eq end
    if TryUnequipSlot(player, slot) then
        eq = tryEquip(entry, slot)
        if eq then return eq end
    end
    return nil
end

function AttemptEquipItem(player, slot, item, entry)
    if not player or not player.EquipItem then return nil end
    if type(player) ~= "userdata" and type(player) ~= "table" then return nil end
    if type(slot) ~= "number" or slot < EQUIP_SLOT_MIN or slot > EQUIP_SLOT_MAX then return nil end
    local validEntry = type(entry) == "number" and entry > 0 and TemplateExists(entry)
    local attemptedItem = false
    local ok, res = false, false
    if item and (type(item) == "userdata" or type(item) == "table") then
        if not player or not player.EquipItem then return nil end
        attemptedItem = true
        ok, res = SafePcall("Player.EquipItem", player.EquipItem, player, item, slot)
        if ok then
            if validEntry then
                local success, eq = VerifyEquippedEntry(player, slot, entry)
                if success then return eq end
            else
                local eq = GetEquippedItemBySlotSafe(player, slot)
                if eq then return eq end
            end
        end
    end
    if validEntry and (not attemptedItem or not ok or res == false) then
        local okEntry = SafePcall("Player.EquipItem", player.EquipItem, player, entry, slot)
        if okEntry then
            local success, eq = VerifyEquippedEntry(player, slot, entry)
            if success then return eq end
        end
    end
    if TryUnequipSlot(player, slot) then
        if item and (type(item) == "userdata" or type(item) == "table") then
            local okRetry = SafePcall("Player.EquipItem", player.EquipItem, player, item, slot)
            if okRetry then
                if validEntry then
                    local success, eq = VerifyEquippedEntry(player, slot, entry)
                    if success then return eq end
                else
                    local eq = GetEquippedItemBySlotSafe(player, slot)
                    if eq then return eq end
                end
            end
        end
        if validEntry then
            local okRetry = SafePcall("Player.EquipItem", player.EquipItem, player, entry, slot)
            if okRetry then
                local success, eq = VerifyEquippedEntry(player, slot, entry)
                if success then return eq end
            end
        end
    end
    return nil
end

function QueueEquipFromBag(playerGuidFull, playerGuidLow, oldGuid, oldGuidLow, newGuid, newGuidLow, slot, enchants)
    local key = newGuidLow or newGuid
    if (not playerGuidFull and not playerGuidLow) or not key then return false end
    PENDING_EQUIP[key] = {
        playerGuidFull = playerGuidFull,
        playerGuidLow = playerGuidLow,
        oldGuid = oldGuid,
        oldGuidLow = oldGuidLow,
        slot = slot,
        enchants = enchants,
        newGuid = newGuid,
        newGuidLow = newGuidLow,
    }
    CreateLuaEvent(SafeCallback(function()
        local info = PENDING_EQUIP[key]
        PENDING_EQUIP[key] = nil
        if not info then return end
        local player = GetPlayerByAnyGuid(info.playerGuidFull, info.playerGuidLow)
        if not isValidPlayer(player) then return end
        if not player.EquipItem then return end
        local item = FindItemByGuid(player, info.newGuid, info.newGuidLow)
        if not isValidItem(item) then return end
        local ok, res = SafePcall("Player.EquipItem", player.EquipItem, player, item, info.slot)
        if not (ok and res) and item.GetEntry then
            local entry = item:GetEntry()
            ok, res = SafePcall("Player.EquipItem", player.EquipItem, player, entry, info.slot)
        end
        if ok and res then
            local equipped = player.GetEquippedItemBySlot and player:GetEquippedItemBySlot(info.slot) or nil
            if isValidItem(equipped) then
                ApplyEnchants(equipped, info.enchants)
            end
            local usedBagItem = false
            if isValidItem(equipped) and info.newGuidLow and equipped.GetGUIDLow then
                local okGuid, guidLow = pcall(equipped.GetGUIDLow, equipped)
                if okGuid and guidLow == info.newGuidLow then
                    usedBagItem = true
                end
            end
            if not usedBagItem then
                RemoveItemLater(info.playerGuidFull, info.playerGuidLow, info.newGuid, info.newGuidLow)
            end
            RemoveItemLater(info.playerGuidFull, info.playerGuidLow, info.oldGuid, info.oldGuidLow)
        end
    end, function() return PENDING_EQUIP[key] ~= nil end), EQUIP_RETRY_DELAY_MS, 1)
    return true
end

TryUnequipSlot = function(player, slot)
    if not player or slot == nil then return false end
    if not player.UnequipItem then return false end
    local function attempt(...)
        local ok = SafePcall("Player.UnequipItem", player.UnequipItem, player, ...)
        if ok then
            local eq = GetEquippedItemBySlotSafe(player, slot)
            if not eq then return true end
        end
        return false
    end
    if attempt(slot) then return true end
    if attempt(EQUIP_BAG, slot) then return true end
    if attempt(EQUIP_BAG, slot, true) then return true end
    if attempt(slot, true) then return true end
    return false
end

function TryRemoveEquippedItemObject(player, slot)
    if not player or slot == nil or not player.RemoveItem then return false end
    local eq = GetEquippedItemBySlotSafe(player, slot)
    if not eq then return true end
    local ok = SafePcall("Player.RemoveItem", player.RemoveItem, player, eq, 1)
    if ok then
        local after = GetEquippedItemBySlotSafe(player, slot)
        if not after then return true end
    end
    return false
end

RemoveItemLater = function(playerGuidFull, playerGuidLow, itemGuid, itemGuidLow)
    if (not playerGuidFull and not playerGuidLow) or (not itemGuid and not itemGuidLow) then return end
    local player = GetPlayerByAnyGuid(playerGuidFull, playerGuidLow)
    if not isValidPlayer(player) then return end
    safeRemoveItemByGuidInBags(player, itemGuid, itemGuidLow)
end

function RestoreOldItem(player, oldEntry, oldGuid, oldGuidLow, slot, enchants, creatorGuidLow, backupGuid, backupGuidLow)
    if not player or not oldEntry then return false end
    if type(player) ~= "userdata" and type(player) ~= "table" then return false end
    local restored = FindItemByGuid(player, backupGuid, backupGuidLow)
    if not restored then
        restored = FindItemByGuid(player, oldGuid, oldGuidLow)
    end
    if not restored and player.AddItem then
        local ok, res = SafePcall("Player.AddItem", player.AddItem, player, oldEntry, 1)
        if ok then restored = res end
    end
    if not restored or (type(restored) ~= "userdata" and type(restored) ~= "table") then 
        return false 
    end
    ApplyCreatorGuidLowToItem(restored, creatorGuidLow)
    local equipped = AttemptEquipItem(player, slot, restored, oldEntry)
    if not equipped then
        equipped = AttemptEquipEntry(player, slot, oldEntry)
    end
    if equipped then
        ApplyCreatorGuidLowToItem(equipped, creatorGuidLow)
    end
    ApplyEnchants(equipped, enchants)
return equipped ~= nil
end

function RemoveNewItemFromBags(player, state)
    if not player or not state or not state.newEntry or state.bagCountBefore == nil then return end
    local bagCountNow = CountEntryInBags(player, state.newEntry)
    if bagCountNow <= state.bagCountBefore then return end
    local extras = bagCountNow - state.bagCountBefore
    local removed = 0
    if state.preExistingGuids and next(state.preExistingGuids) ~= nil then
        ForEachBagItem(player, function(it)
            if removed >= extras then
                return true
            end
            if it.GetEntry then
                local ok, res = pcall(it.GetEntry, it)
                if ok and res == state.newEntry then
                    local guidLow = safeGetGuidLow(it)
                    if guidLow and not state.preExistingGuids[guidLow] then
                        SafePcall("Player.RemoveItem", player.RemoveItem, player, it, 1)
                        removed = removed + 1
                        if removed >= extras then
                            return true
                        end
                    end
                end
            end
            return false
        end)
    end
    while removed < extras do
        local it = FindItemByEntryInBags(player, state.newEntry)
        if not it then break end
        SafePcall("Player.RemoveItem", player.RemoveItem, player, it, 1)
        removed = removed + 1
    end
end

function RemoveExtraEntryFromBags(player, entry, beforeCount)
    if not player or not entry or beforeCount == nil then return end
    local bagCountNow = CountEntryInBags(player, entry)
    if bagCountNow <= beforeCount then return end
    local extras = bagCountNow - beforeCount
    for _ = 1, extras do
        local it = FindItemByEntryInBags(player, entry)
        if not it then break end
        SafePcall("Player.RemoveItem", player.RemoveItem, player, it, 1)
    end
end

function ForceReplaceEquippedItem(player, slot, oldEntry, oldGuidFull, oldGuidLow, savedEnchants, savedCreatorGuidLow, newEntry, bagCountBefore, preExistingGuids, oldBagCountBefore)
    if not player or slot == nil or not newEntry then return false, nil end
    if not player.EquipItem then return false, nil end
    if CountFreeBagSlots(player) <= 0 then return false, nil end
    MaybePreSave(player)

    local eq = GetEquippedItemBySlotSafe(player, slot)
    if eq and player.RemoveItem then
        SafePcall("Player.RemoveItem", player.RemoveItem, player, eq, 1)
    end
    if GetEquippedItemBySlotSafe(player, slot) then
        return false, nil
    end

    local equipped = AttemptEquipEntry(player, slot, newEntry)
    local okEquipped, eqItem = VerifyEquippedEntry(player, slot, newEntry)
    if not okEquipped then
        local added = nil
        if player.AddItem then
            local ok, res = SafePcall("Player.AddItem", player.AddItem, player, newEntry, 1)
            if ok then added = res end
        end
        if not added then
            RestoreOldItem(player, oldEntry, oldGuidFull, oldGuidLow, slot, savedEnchants, savedCreatorGuidLow)
            return false, nil
        end

        local newItem = nil
        if type(added) == "userdata" or type(added) == "table" then
            newItem = added
        else
            newItem = FindNewItemByEntry(player, newEntry, preExistingGuids)
        end
        if not newItem then
            RestoreOldItem(player, oldEntry, oldGuidFull, oldGuidLow, slot, savedEnchants, savedCreatorGuidLow)
            return false, nil
        end

        equipped = AttemptEquipItem(player, slot, newItem, newEntry)
        okEquipped, eqItem = VerifyEquippedEntry(player, slot, newEntry)
        if not okEquipped then
            local newGuidLow = safeGetGuidLow(newItem)
            if newGuidLow then
                safeRemoveItemByGuidInBags(player, nil, newGuidLow)
            end
            RemoveNewItemFromBags(player, {
                newEntry = newEntry,
                bagCountBefore = bagCountBefore,
                preExistingGuids = preExistingGuids,
            })
            RestoreOldItem(player, oldEntry, oldGuidFull, oldGuidLow, slot, savedEnchants, savedCreatorGuidLow)
            return false, nil
        end
        eqItem = eqItem or equipped
    end

    if eqItem then
        ApplyCreatorGuidLowToItem(eqItem, savedCreatorGuidLow)
        ApplyEnchants(eqItem, savedEnchants)
    end

    local playerGuidLow = safeGetGuidLow(player)
    local playerGuidFull = safeGetGuidFull(player)
    if EQUIPPED_UPGRADE_ENABLED and playerGuidLow and eqItem then
        PersistEquippedToDB(playerGuidLow, slot, eqItem, newEntry)
    end

    RemoveItemLater(playerGuidFull, playerGuidLow, oldGuidFull, oldGuidLow)
    if oldEntry then
        RemoveExtraEntryFromBags(player, oldEntry, oldBagCountBefore)
    end
    RemoveNewItemFromBags(player, {
        newEntry = newEntry,
        bagCountBefore = bagCountBefore,
        preExistingGuids = preExistingGuids,
    })

    return true, safeGetGuidLow(eqItem)
end

function SchedulePostEquipCleanup(playerGuidFull, playerGuidLow, slot, newEntry, oldEntry, oldGuid, oldGuidLow, oldBagCountBefore, bagCountBefore, preExistingGuids, oldBackupGuid, oldBackupGuidLow, attempt)
    if not EQUIPPED_UPGRADE_ENABLED then return end
    
    attempt = attempt or 1
    if attempt > POST_EQUIP_CLEANUP_MAX_TRIES then return end
    
    CreateLuaEvent(SafeCallback(function()
        local p = GetPlayerByAnyGuid(playerGuidFull, playerGuidLow)
        if not isValidPlayer(p) then return end
        
        local okEquipped, eqItem = VerifyEquippedEntry(p, slot, newEntry)
        if not okEquipped then return end
        if eqItem and isValidItem(eqItem) then
            PersistEquippedToDB(playerGuidLow, slot, eqItem, newEntry)
        end
        if not IsEquippedPersisted(playerGuidLow, slot, newEntry, eqItem) then
            if attempt < POST_EQUIP_CLEANUP_MAX_TRIES then
                SchedulePostEquipCleanup(playerGuidFull, playerGuidLow, slot, newEntry, oldEntry, oldGuid, oldGuidLow, oldBagCountBefore, bagCountBefore, preExistingGuids, oldBackupGuid, oldBackupGuidLow, attempt + 1)
            end
            return
        end
RemoveItemLater(playerGuidFull, playerGuidLow, oldGuid, oldGuidLow)
        RemoveItemLater(playerGuidFull, playerGuidLow, oldBackupGuid, oldBackupGuidLow)
        RemoveExtraEntryFromBags(p, oldEntry, oldBagCountBefore)
        RemoveNewItemFromBags(p, {
            newEntry = newEntry,
            bagCountBefore = bagCountBefore,
            preExistingGuids = preExistingGuids,
        })
    end, function() return isValidPlayer(GetPlayerByAnyGuid(playerGuidFull, playerGuidLow)) end), POST_EQUIP_CLEANUP_DELAY_MS, 1)
end

function StartUpgradeSwap(player, oldItem, slot, newEntry, savedEnchants, cost, chanceImprovementMode, targetTier, isCritical)
    return "equipfail"
end


function UpgradeByInstance(player, oldItem, slot, newEntry, cost, chanceImprovementMode, targetTier, isCritical)
    return "equipfail"
end

function UpgradeAndEquipItem(player, oldItem, slot, newEntry, cost, chanceImprovementMode, targetTier, isCritical)
    return "equipfail"
end

function UpgradeBackpackItem(player, it, bagSlot, newEntry, cost, chanceImprovementMode, targetTier, isCritical, oldGuidLow)
    
    if not player or not it then return "equipfail" end
    if type(player) ~= "userdata" and type(player) ~= "table" then return "equipfail" end
    if type(it) ~= "userdata" and type(it) ~= "table" then return "equipfail" end
    if not HasFreeBagSlot(player, newEntry) then return "nobag" end
    local savedCreatorGuidLow = GetItemCreatorGuidLow(it)
    local ownerMatchesPlayer = IsCreatorOwnedByPlayer(player, savedCreatorGuidLow)
    MaybePreSave(player)

    local preExistingGuids = CollectEntryGuidLowsInBags(player, newEntry)
    local added = nil
    if player.AddItem then
        local ok, res = SafePcall("Player.AddItem", player.AddItem, player, newEntry, 1)
        if ok then added = res end
    end
    if not added then return "nobag" end

    local newItemGuid = nil
    if type(added) == "userdata" or type(added) == "table" then
        local ok, guid = pcall(function() return added:GetGUIDLow() end)
        if ok and guid then
            newItemGuid = guid
        end
    else
        local foundItem = FindNewItemByEntry(player, newEntry, preExistingGuids)
        if foundItem then
            local ok, guid = pcall(function() return foundItem:GetGUIDLow() end)
            if ok and guid then
                newItemGuid = guid
            end
        end
    end
    if not newItemGuid then return "nobag" end

    local savedEnchants = SnapshotEnchants(it)
    local newItem = added
    if not newItem then
        newItem = FindNewItemByEntry(player, newEntry, preExistingGuids)
    end
    if newItem then
        ApplyCreatorGuidLowToItem(newItem, savedCreatorGuidLow)
        ApplyEnchants(newItem, savedEnchants)
        if ownerMatchesPlayer then
            NotifyHardcoreCraftedHint(player, newEntry, newItem)
        end
    elseif savedCreatorGuidLow > 0 then
        PersistItemCreatorGuidLowToDB(newItemGuid, savedCreatorGuidLow)
        if ownerMatchesPlayer then
            NotifyHardcoreCraftedHint(player, newEntry, nil)
        end
    end
    
    oldGuidLow = oldGuidLow or safeGetGuidLow(it)
    if not oldGuidLow then return "equipfail" end
    
    if player and player.RemoveItem then
        SafePcall("Player.RemoveItem", player.RemoveItem, player, it, 1)
    end
    
    if PlayerHasItemByGUID(player, oldGuidLow) then
        if UPGRADE_DEBUG then
            DebugLog(string.format("Backpack upgrade: old item GUID %d still exists after removal, rolling back new item GUID %d", oldGuidLow, newItemGuid))
        end
        
        if PlayerHasItemByGUID(player, newItemGuid) then
            local newItem = FindNewItemByEntry(player, newEntry, preExistingGuids)
            if newItem then
                SafePcall("Player.RemoveItem", player.RemoveItem, player, newItem, 1)
            end
        end
        return "swapfail"
    end
    
    return "bagupgraded", newItemGuid
end

function UpgradeEquippedItem(player, it, slot, newEntry, cost, chanceImprovementMode, targetTier, isCritical)
    if not player or not it or slot == nil then return "equipfail" end
    if type(player) ~= "userdata" and type(player) ~= "table" then return "equipfail" end
    if type(it) ~= "userdata" and type(it) ~= "table" then return "equipfail" end
    MaybePreSave(player)

    local oldEntry = safeItemGetEntry(it)
    local oldGuidLow = safeGetGuidLow(it)
    local oldGuidFull = safeGetGuidFull(it)
    local savedCreatorGuidLow = GetItemCreatorGuidLow(it)
    local playerGuidLow = safeGetGuidLow(player)
    local ownerMatchesPlayer = IsCreatorOwnedByPlayer(player, savedCreatorGuidLow)
    local oldBagCountBefore = oldEntry and CountEntryInBags(player, oldEntry) or 0
    local bagCountBefore = CountEntryInBags(player, newEntry)
    local preExistingGuids = CollectEntryGuidLowsInBags(player, newEntry)
    local savedEnchants = SnapshotEnchants(it)
    local freeSlots = CountFreeBagSlots(player)
    local canOneSlot = freeSlots >= 1
    local canTwoSlot = freeSlots >= 2

    if ownerMatchesPlayer then
        NotifyHardcoreCraftedHint(player, newEntry, nil)
    end

    if TrySetItemEntry(it, newEntry) then
        ApplyCreatorGuidLowToItem(it, savedCreatorGuidLow)
        ApplyEnchants(it, savedEnchants)
        if ownerMatchesPlayer then
            NotifyHardcoreCraftedHint(player, newEntry, it)
        end
        if EQUIPPED_UPGRADE_ENABLED and playerGuidLow then
            PersistEquippedToDB(playerGuidLow, slot, it, newEntry)
        end
        TryRefreshEquippedItem(it, player)
        return "equipupgraded", safeGetGuidLow(it)
    end

    local equipped = AttemptEquipEntry(player, slot, newEntry)
    local okEquipped, eqItem = VerifyEquippedEntry(player, slot, newEntry)
    if not okEquipped then
        if TryUnequipSlot(player, slot) then
            equipped = AttemptEquipEntry(player, slot, newEntry)
            okEquipped, eqItem = VerifyEquippedEntry(player, slot, newEntry)
        end
    end
    if okEquipped then
        eqItem = eqItem or equipped
        if eqItem then
            ApplyCreatorGuidLowToItem(eqItem, savedCreatorGuidLow)
            ApplyEnchants(eqItem, savedEnchants)
            if ownerMatchesPlayer then
                NotifyHardcoreCraftedHint(player, newEntry, eqItem)
            end
        end

        if oldGuidLow then
            local removedOld = safeRemoveItemByGuidInBags(player, oldGuidFull, oldGuidLow)
            if (not removedOld) and oldEntry then
                RemoveExtraEntryFromBags(player, oldEntry, oldBagCountBefore)
            end
        elseif oldEntry then
            RemoveExtraEntryFromBags(player, oldEntry, oldBagCountBefore)
        end

        RemoveNewItemFromBags(player, {
            newEntry = newEntry,
            bagCountBefore = bagCountBefore,
            preExistingGuids = preExistingGuids,
        })

        if EQUIPPED_UPGRADE_ENABLED and playerGuidLow and eqItem then
            PersistEquippedToDB(playerGuidLow, slot, eqItem, newEntry)
        end

        local newGuid = eqItem and safeGetGuidLow(eqItem) or nil
        return "equipupgraded", newGuid
    end

    if canTwoSlot then
        local added = nil
        if player.AddItem then
            local ok, res = SafePcall("Player.AddItem", player.AddItem, player, newEntry, 1)
            if ok then added = res end
        end
        if not added then
            local forcedOk, forcedGuid = ForceReplaceEquippedItem(player, slot, oldEntry, oldGuidFull, oldGuidLow, savedEnchants, savedCreatorGuidLow, newEntry, bagCountBefore, preExistingGuids, oldBagCountBefore)
            if forcedOk then
                return "equipupgraded", forcedGuid
            end
            return "nobag"
        end

        local newItem = nil
        if type(added) == "userdata" or type(added) == "table" then
            newItem = added
        else
            newItem = FindNewItemByEntry(player, newEntry, preExistingGuids)
        end
        if not newItem then
            local forcedOk, forcedGuid = ForceReplaceEquippedItem(player, slot, oldEntry, oldGuidFull, oldGuidLow, savedEnchants, savedCreatorGuidLow, newEntry, bagCountBefore, preExistingGuids, oldBagCountBefore)
            if forcedOk then
                return "equipupgraded", forcedGuid
            end
            return "nobag"
        end

        local newItemGuid = safeGetGuidLow(newItem)
        local newItemGuidFull = safeGetGuidFull(newItem)
        ApplyCreatorGuidLowToItem(newItem, savedCreatorGuidLow)
        if ownerMatchesPlayer then
            NotifyHardcoreCraftedHint(player, newEntry, newItem)
        end

        local equipped = AttemptEquipItem(player, slot, newItem, newEntry)
        local okEquipped, eqItem = VerifyEquippedEntry(player, slot, newEntry)
        if not okEquipped then
            if TryUnequipSlot(player, slot) then
                equipped = AttemptEquipItem(player, slot, newItem, newEntry)
                okEquipped, eqItem = VerifyEquippedEntry(player, slot, newEntry)
            end
        end
    if not okEquipped then
        safeRemoveItemByGuidInBags(player, newItemGuidFull, newItemGuid)
        RemoveNewItemFromBags(player, {
            newEntry = newEntry,
            bagCountBefore = bagCountBefore,
            preExistingGuids = preExistingGuids,
            })
            if TrySetItemEntry(it, newEntry) then
                ApplyCreatorGuidLowToItem(it, savedCreatorGuidLow)
                ApplyEnchants(it, savedEnchants)
                if ownerMatchesPlayer then
                    NotifyHardcoreCraftedHint(player, newEntry, it)
                end
                if EQUIPPED_UPGRADE_ENABLED and playerGuidLow then
                    PersistEquippedToDB(playerGuidLow, slot, it, newEntry)
                end
                TryRefreshEquippedItem(it, player)
                return "equipupgraded", safeGetGuidLow(it)
            end
            local forcedOk, forcedGuid = ForceReplaceEquippedItem(player, slot, oldEntry, oldGuidFull, oldGuidLow, savedEnchants, savedCreatorGuidLow, newEntry, bagCountBefore, preExistingGuids, oldBagCountBefore)
            if forcedOk then
                return "equipupgraded", forcedGuid
            end
            return "equipfail"
        end
        eqItem = eqItem or equipped
        if eqItem then
            ApplyCreatorGuidLowToItem(eqItem, savedCreatorGuidLow)
            ApplyEnchants(eqItem, savedEnchants)
            if ownerMatchesPlayer then
                NotifyHardcoreCraftedHint(player, newEntry, eqItem)
            end
        end

        if oldGuidLow then
            local removedOld = safeRemoveItemByGuidInBags(player, oldGuidFull, oldGuidLow)
            if (not removedOld) and oldEntry then
                RemoveExtraEntryFromBags(player, oldEntry, oldBagCountBefore)
            end
        elseif oldEntry then
            RemoveExtraEntryFromBags(player, oldEntry, oldBagCountBefore)
        end

        RemoveNewItemFromBags(player, {
            newEntry = newEntry,
            bagCountBefore = bagCountBefore,
            preExistingGuids = preExistingGuids,
        })

        if EQUIPPED_UPGRADE_ENABLED and playerGuidLow and eqItem then
            PersistEquippedToDB(playerGuidLow, slot, eqItem, newEntry)
        end

        return "equipupgraded", newItemGuid
    end

    if canOneSlot then
        local forcedOk, forcedGuid = ForceReplaceEquippedItem(player, slot, oldEntry, oldGuidFull, oldGuidLow, savedEnchants, savedCreatorGuidLow, newEntry, bagCountBefore, preExistingGuids, oldBagCountBefore)
        if forcedOk then
            return "equipupgraded", forcedGuid
        end
        return "equipfail"
    end

    return "nobag"
end

function GetUpgradeAbortMessages(result, mode)
    if result == "nobag" then
        return "Upgrade aborted: you need at least 1 free bag slot. Gold and stones refunded."
    end
    if result == "swapfail" then
        return "Upgrade aborted: item swap failed. Gold and stones refunded."
    end
    if result == "equipfail" then
        if mode == "equipment" then
            return "Upgrade aborted. Gold and stones refunded.", "Equip failed. Try again with 2 free bag slots or check clone requirements."
        end
        return "Upgrade aborted. Gold and stones refunded."
    end
    return "Upgrade aborted. Gold and stones refunded."
end

function HandleUpgradeAbort(player, result, chanceImprovementMode, cost, refreshFn, mode)
    if player and cost and player.ModifyMoney then
        SafePcall("Player.ModifyMoney", player.ModifyMoney, player, cost)
    end
    local refundOk, refundErr = RefundProtectionStone(player, chanceImprovementMode)
    local msg1, msg2 = GetUpgradeAbortMessages(result, mode)
    if msg1 then
        SafePcall("Player.SendBroadcastMessage", player.SendBroadcastMessage, player, msg1)
    end
    if msg2 then
        SafePcall("Player.SendBroadcastMessage", player.SendBroadcastMessage, player, msg2)
    end
    if not refundOk and refundErr then
        SafePcall("Player.SendBroadcastMessage", player.SendBroadcastMessage, player, refundErr)
    end
    if refreshFn then refreshFn() end
end


function SafeItemLine(it, entry)
    if it and it.GetName then
        local name = it:GetName()
        if name and name ~= "" then
            return string.format("|cffffffff%s|r |cff000000(entry %u)|r", name, entry)
        end
    end
    return string.format("|cffffffffItem %u|r", entry)
end

function IsSupportedForUpgrade(item)
    if not IsEligibleItem(item) then
        return false, "Not supported"
    end

    local entry = item:GetEntry()
    local baseEntry, tier = GetBaseAndTierForEntry(entry)

    local safeClone, cloneReason = IsCloneRangeSafe(baseEntry)
    if not safeClone then
        if cloneReason == "clone mismatch" then
            return false, "Clone range conflict"
        end
        return false, "Not supported"
    end

    if tier >= MAX_TIER then
        return false, "MAX"
    end

    local upgradedEntry = GetCloneEntry(baseEntry, tier + 1)
    if not upgradedEntry or not TemplateExists(upgradedEntry) then
        return false, "Not supported"
    end

    return true, nil
end

function ShowMainMenu(player, creature)
    if not isValidPlayer(player) then
        return
    end
    if not isValidCreature(creature) then
        return
    end

    player:GossipClearMenu()
    
    if EQUIPPED_UPGRADE_ENABLED then
        player:GossipMenuAddItem(0, "|TInterface\\Icons\\INV_Chest_Plate04:16|t Upgrade an equipped item", 0, 10)
    else
        player:GossipMenuAddItem(0, "|cff808080[Equipment upgrades disabled]|r", 0, 9999)
    end

    player:GossipMenuAddItem(0, "|TInterface\\Icons\\INV_Misc_Bag_10:16|t Buy protection stones", 0, 20)
    player:GossipSendMenu(1, creature, MENU_IDS.MAIN)
end

function ShowBuyStonesMenu(player, creature)
    if not isValidPlayer(player) then
        return
    end
    if not isValidCreature(creature) then
        return
    end

    local money = safeGetCoinage(player)

    local keepPrice = GetStonePriceCopper(KEEPSAKE_STONE_ITEM_ID)
    local legPrice = GetStonePriceCopper(LEGENDARY_STONE_ITEM_ID)

    local keepCount = GetStoneCount(player, KEEPSAKE_STONE_ITEM_ID)
    local legCount = GetStoneCount(player, LEGENDARY_STONE_ITEM_ID)

    player:GossipClearMenu()

    player:GossipMenuAddItem(0, "|cffffd100Protection Stones|r", 0, 9998)
    player:GossipMenuAddItem(0, string.format("|cffffffffYou have:|r |cffffd100%s|r", FormatGold(money)), 0, 9998)

    player:GossipMenuAddItem(0, string.format("|cffffffffKeepsake Stone|r |cff000000(x%u)|r  |cffffffffPrice:|r |cffffd100%s|r", keepCount, FormatGold(keepPrice)), 0, 9998)
    player:GossipMenuAddItem(0, string.format("|cffffffffLegendary Upgrade Stone|r |cff000000(x%u)|r  |cffffffffPrice:|r |cffffd100%s|r", legCount, FormatGold(legPrice)), 0, 9998)

    player:GossipMenuAddItem(0, " ", 0, 9998)

    player:GossipMenuAddItem(0, "|TInterface\\Icons\\INV_Misc_Gem_Pearl_03:16|t Buy 1 Keepsake Stone", 0, 3001)
    player:GossipMenuAddItem(0, "|TInterface\\Icons\\INV_Misc_Gem_Ruby_01:16|t Buy 1 Legendary Upgrade Stone", 0, 3002)

    player:GossipMenuAddItem(0, "Back", 0, 21)
    player:GossipSendMenu(1, creature, MENU_IDS.BUY_STONES)
end

local function GetStoneDisplayName(itemId)
    if itemId == KEEPSAKE_STONE_ITEM_ID then
        return "Keepsake Stone"
    elseif itemId == LEGENDARY_STONE_ITEM_ID then
        return "Legendary Upgrade Stone"
    end
    return "Protection Stone"
end

local function PurchaseStoneForPlayer(player, itemId, amount)
    if not isValidPlayer(player) then
        return false, "Player unavailable."
    end

    local count = math.floor(tonumber(amount) or 1)
    if count < 1 then count = 1 end
    if count > 200 then count = 200 end

    local priceEach = GetStonePriceCopper(itemId)
    if not priceEach or priceEach <= 0 then
        return false, "Pricing not configured."
    end

    local totalCost = priceEach * count
    if totalCost <= 0 then
        return false, "Pricing not configured."
    end

    if not ChargeCopper(player, totalCost) then
        return false, "You do not have enough gold."
    end

    local addOk, addRes = pcall(function() return player:AddItem(itemId, count) end)
    local added = false
    if addOk then
        if type(addRes) == "boolean" then
            added = addRes
        else
            added = addRes ~= nil
        end
    end

    if not added then
        if player.ModifyMoney then
            pcall(player.ModifyMoney, player, totalCost)
        end
        return false, "You need at least 1 free bag slot."
    end

    local label = GetStoneDisplayName(itemId)
    if count > 1 then
        return true, string.format("Purchased: %s x%d", label, count)
    end
    return true, string.format("Purchased: %s", label)
end

function ShowBackpackSelectMenu(player, creature)
    if not isValidPlayer(player) then
        return
    end
    if not isValidCreature(creature) then
        return
    end

    player:GossipClearMenu()
    player:GossipMenuAddItem(0, "|cff00c0ffUpgrade a backpack item|r", 0, 9998)
    player:GossipMenuAddItem(0, "|cffffff00Only the first 10 backpack slots are listed.|r", 0, 9998)
    player:GossipMenuAddItem(0, "|cffffff00Items without stats are not listed.|r", 0, 9998)
    player:GossipMenuAddItem(0, " ", 0, 9998)

    local found = false
    for i = 0, BACKPACK_UPGRADE_SLOT_COUNT - 1 do
        local bagSlot = BACKPACK_SLOT_START + i
        local it = safeGetItemByPos(player, EQUIP_BAG, bagSlot)
        if it then
            local entry = safeItemGetEntry(it)
            if not entry then
                goto skip_item
            end
                local baseEntry, tier = GetBaseAndTierForEntry(entry)
                if tier >= MAX_TIER then
                    goto skip_item
                end
                local link = safeItemGetItemLink(it) or ("Item " .. entry)
                local hasStats = HasItemStats(it)

                local supported, reason = IsSupportedForUpgrade(it)
                if IsEligibleItem(it) and hasStats and tier < MAX_TIER then
                    found = true
                end

            if supported and hasStats then
                local badLuckCount = GetItemBadLuckCount(it)
                local targetTier = ResolveTargetTier(baseEntry, tier, badLuckCount)
                local cost = GetUpgradeCostCopper(tier, safeGetPlayerLevel(player), it, badLuckCount)
                local chance = UpgradeSuccessChance(tier, 0, badLuckCount, player, it)
                local line = string.format(
                    "|cff000000[Slot %u]|r |cff00ff00%s|r  |cff000000(+%u -> +%u)|r  |cff55ff55S:%u%%|r  |cffffd100Cost: %s|r",
                    i + 1, link, tier, targetTier, chance, FormatGold(cost)
                )
                player:GossipMenuAddItem(0, line, 0, 4000 + i)
            else
                    if IsEligibleItem(it) and hasStats and tier < MAX_TIER then
                        local line = string.format(
                            "|cff000000[Slot %u]|r %s  |cff000000(+%u)|r  |cffff3333(%s)|r",
                            i + 1, link, tier, reason or "Not supported"
                        )
                    player:GossipMenuAddItem(0, line, 0, 9999)
                end
            end
            ::skip_item::
        end
    end

    if not found then
        player:GossipMenuAddItem(0, "|cffff3333No eligible rare+ gear with stats in the first 10 backpack slots.|r", 0, 9999)
    end

    player:GossipMenuAddItem(0, "Back", 0, 31)
    player:GossipSendMenu(1, creature, MENU_IDS.SELECT_BACKPACK)
end

function ShowEquippedSelectMenu(player, creature)
    if not isValidPlayer(player) then
        return
    end
    if not isValidCreature(creature) then
        return
    end

    player:GossipClearMenu()
    player:GossipMenuAddItem(0, "|cff00c0ffUpgrade an equipped item|r", 0, 9998)
    player:GossipMenuAddItem(0, "|cffffff00Items without stats are not listed.|r", 0, 9998)
    player:GossipMenuAddItem(0, " ", 0, 9998)

    local found = false
    for slot = EQUIP_SLOT_MIN, EQUIP_SLOT_MAX do
        if not EXCLUDED_SLOTS[slot] then
            local it = GetEquippedItemBySlotSafe(player, slot)
            if it then
                local entry = safeItemGetEntry(it)
                if not entry then
                    goto skip_equip_item
                end
                local baseEntry, tier = GetBaseAndTierForEntry(entry)
                if tier >= MAX_TIER then
                    goto skip_equip_item
                end
                local link = safeItemGetItemLink(it) or ("Item " .. entry)
                local hasStats = HasItemStats(it)
                local supported, reason = IsSupportedForUpgrade(it)
                if IsEligibleItem(it) and hasStats and tier < MAX_TIER then
                    found = true
                end
                if supported and hasStats then
                    local badLuckCount = GetItemBadLuckCount(it)
                    local targetTier = ResolveTargetTier(baseEntry, tier, badLuckCount)
                    local cost = GetUpgradeCostCopper(tier, safeGetPlayerLevel(player), it, badLuckCount)
                    local chance = UpgradeSuccessChance(tier, 0, badLuckCount, player, it)
                    local slotLabel = GetEquipSlotLabel(slot)
                    local line = string.format(
                        "|cff000000[%s]|r |cff00ff00%s|r  |cff000000(+%u -> +%u)|r  |cff55ff55S:%u%%|r  |cffffd100Cost: %s|r",
                        slotLabel, link, tier, targetTier, chance, FormatGold(cost)
                    )
                    player:GossipMenuAddItem(0, line, 0, 1000 + slot)
                else
                    if IsEligibleItem(it) and hasStats and tier < MAX_TIER then
                        local slotLabel = GetEquipSlotLabel(slot)
                        local line = string.format(
                            "|cff000000[%s]|r %s  |cff000000(+%u)|r  |cffff3333(%s)|r",
                            slotLabel, link, tier, reason or "Not supported"
                        )
                        player:GossipMenuAddItem(0, line, 0, 9999)
                    end
                end
                ::skip_equip_item::
            end
        end
    end

    if not found then
        player:GossipMenuAddItem(0, "|cffff3333No eligible rare+ equipped gear with stats found.|r", 0, 9999)
    end

    player:GossipMenuAddItem(0, "Back", 0, 11)
    player:GossipSendMenu(1, creature, MENU_IDS.SELECT_SLOT)
end

function FindUpgradeNpc(player)
    if not player then return nil end
    if player.GetNearestCreature then
        local ok, creature = pcall(player.GetNearestCreature, player, 30, UPGRADE_NPC_ENTRY)
        if ok and creature then return creature end
    end
    if player.GetCreaturesInRange then
        local ok, list = pcall(player.GetCreaturesInRange, player, 30)
        if ok and list then
            for _, c in pairs(list) do
                if c and c.GetEntry and c:GetEntry() == UPGRADE_NPC_ENTRY then
                    return c
                end
            end
        end
    end
    return nil
end

function ShowBackpackMenuIfNearby(player)
    if not player then return end
    if player.IsInWorld and not player:IsInWorld() then return end
    local creature = FindUpgradeNpc(player)
    if not creature then return end
    ShowBackpackSelectMenu(player, creature)
end

function ShowBackpackProtectionMenuIfNearby(player, bagSlot)
    if not player then return end
    if player.IsInWorld and not player:IsInWorld() then return end
    local creature = FindUpgradeNpc(player)
    if not creature then return end
    ShowBackpackProtectionMenu(player, creature, bagSlot)
end

function ShowEquippedMenuIfNearby(player)
    if not player then return end
    if player.IsInWorld and not player:IsInWorld() then return end
    local creature = FindUpgradeNpc(player)
    if not creature then return end
    ShowEquippedSelectMenu(player, creature)
end

function ShowEquippedProtectionMenuIfNearby(player, slot)
    if not player then return end
    if player.IsInWorld and not player:IsInWorld() then return end
    local creature = FindUpgradeNpc(player)
    if not creature then return end
    ShowEquippedProtectionMenu(player, creature, slot)
end

function ShowBackpackProtectionMenu(player, creature, bagSlot)
    if not isValidPlayer(player) then
        return
    end
    if not isValidCreature(creature) then
        return
    end

    local p = GetPending(player)
    p.mode = "backpack"
    p.bagSlot = bagSlot
    p.slot = nil
    p.equipGuidLow = nil

    local it = safeGetItemByPos(player, EQUIP_BAG, bagSlot)
    if not it or not IsEligibleItem(it) then
        player:SendBroadcastMessage("That slot does not contain eligible rare+ gear.")
        ShowBackpackSelectMenu(player, creature)
        return
    end

    local entry = safeItemGetEntry(it)
    if not entry then
        player:SendBroadcastMessage("Unable to read item data.")
        ShowBackpackSelectMenu(player, creature)
        return
    end
    local baseEntry, tier = GetBaseAndTierForEntry(entry)

    if tier >= MAX_TIER then
        player:SendBroadcastMessage("That item is already at the maximum tier.")
        ShowBackpackSelectMenu(player, creature)
        return
    end

    local badLuckCount = GetItemBadLuckCount(it)
    local targetTier, targetEntry = ResolveTargetTier(baseEntry, tier, badLuckCount)
    if not targetEntry or not TemplateExists(targetEntry) then
        player:SendBroadcastMessage("Upgrade data not found for this item (missing clone entry).")
        ShowBackpackSelectMenu(player, creature)
        return
    end

    local baseChance = UpgradeSuccessChance(tier, 0, 0, player, it)
    local badLuckChance = UpgradeSuccessChance(tier, 0, badLuckCount, player, it)
    local keepChance = UpgradeSuccessChance(tier, 1, badLuckCount, player, it)
    local legChance = UpgradeSuccessChance(tier, 2, badLuckCount, player, it)
    local failChance = 100 - badLuckChance
    local cost = GetUpgradeCostCopper(tier, safeGetPlayerLevel(player), it, badLuckCount)
    local money = safeGetCoinage(player)

    local keepCount = GetStoneCount(player, KEEPSAKE_STONE_ITEM_ID)
    local legCount = GetStoneCount(player, LEGENDARY_STONE_ITEM_ID)

    player:GossipClearMenu()

    player:GossipMenuAddItem(0, "|cff00c0ffUpgrade Preview|r", 0, 9998)
    player:GossipMenuAddItem(0, string.format("Item:|r %s", SafeItemLine(it, entry)), 0, 9998)
    player:GossipMenuAddItem(0, string.format("|cff000000Tier:|r |cffffd100+%u -> +%u|r", tier, targetTier), 0, 9998)
    local critLevels = math.min(CRITICAL_UPGRADE_LEVELS, MAX_TIER - targetTier)
    if critLevels > 0 then
        local critDenom = GetCriticalUpgradeDenom(tier)
        player:GossipMenuAddItem(0, string.format("|cff000000Critical Chance:|r 1/%u for +%u levels", critDenom, critLevels), 0, 9998)
    end
    if badLuckCount > 0 then
        player:GossipMenuAddItem(0, string.format("|cff000000Base Success:|r |cff00ff00%u%%|r |cff000000(Bad luck)|r |cff00ff00%u%%|r |cff000000Fail:|r |cffff7777%u%%|r", baseChance, badLuckChance, failChance), 0, 9998)
    else
        player:GossipMenuAddItem(0, string.format("|cff000000Base Success:|r |cff00ff00%u%%|r |cff000000Fail:|r |cffff7777%u%%|r", baseChance, failChance), 0, 9998)
    end
    player:GossipMenuAddItem(0, string.format("|cff000000Cost:|r |cffffd100%s|r |cff000000 You have:|r |cffffd100%s|r", FormatGold(cost), FormatGold(money)), 0, 9998)

    player:GossipMenuAddItem(0, " ", 0, 9998)
    player:GossipMenuAddItem(0, "|cff00c0ffChoose Chance Improvement|r", 0, 9998)
    player:GossipMenuAddItem(0, string.format("|cff000000No Chance Improvement|r |cff00ff00(%u%% success)|r", badLuckChance), 0, 2100)
    
    if keepCount > 0 then
        player:GossipMenuAddItem(0, string.format("|cff000000Keepsake Stone|r |cffffffff(x%u)|r |cff00ff00+25%% (%u%% success)|r", keepCount, keepChance), 0, 2101)
    end
    
    if legCount > 0 then
        player:GossipMenuAddItem(0, string.format("|cff000000Legendary Stone|r |cffffffff(x%u)|r |cffff8000GUARANTEED!|r", legCount), 0, 2102)
    end
    
    player:GossipMenuAddItem(0, "Back", 0, 2109)

    player:GossipSendMenu(1, creature, MENU_IDS.SELECT_PROTECT)
end

function ShowEquippedProtectionMenu(player, creature, slot)
    if not isValidPlayer(player) then
        return
    end
    if not isValidCreature(creature) then
        return
    end
    if EXCLUDED_SLOTS[slot] then
        player:SendBroadcastMessage("That equipment slot is not eligible for upgrades.")
        ShowEquippedSelectMenu(player, creature)
        return
    end

    local p = GetPending(player)
    p.mode = "equipped"
    p.slot = slot
    p.bagSlot = nil
    p.bagGuidLow = nil
    p.equipGuidLow = nil

    local it = GetEquippedItemBySlotSafe(player, slot)
    if not it or not IsEligibleItem(it) then
        player:SendBroadcastMessage("That slot does not contain eligible rare+ gear.")
        ShowEquippedSelectMenu(player, creature)
        return
    end
    if it and it.GetGUIDLow then
        local okGuid, guidLow = pcall(it.GetGUIDLow, it)
        if okGuid then
            p.equipGuidLow = guidLow
        end
    end

    local entry = safeItemGetEntry(it)
    if not entry then
        player:SendBroadcastMessage("Unable to read item data.")
        ShowEquippedSelectMenu(player, creature)
        return
    end
    local baseEntry, tier = GetBaseAndTierForEntry(entry)

    if tier >= MAX_TIER then
        player:SendBroadcastMessage("That item is already at the maximum tier.")
        ShowEquippedSelectMenu(player, creature)
        return
    end

    local badLuckCount = GetItemBadLuckCount(it)
    local targetTier, targetEntry = ResolveTargetTier(baseEntry, tier, badLuckCount)
    if not targetEntry or not TemplateExists(targetEntry) then
        player:SendBroadcastMessage("Upgrade data not found for this item (missing clone entry).")
        ShowEquippedSelectMenu(player, creature)
        return
    end

    local baseChance = UpgradeSuccessChance(tier, 0, 0, player, it)
    local badLuckChance = UpgradeSuccessChance(tier, 0, badLuckCount, player, it)
    local keepChance = UpgradeSuccessChance(tier, 1, badLuckCount, player, it)
    local legChance = UpgradeSuccessChance(tier, 2, badLuckCount, player, it)
    local failChance = 100 - badLuckChance
    local cost = GetUpgradeCostCopper(tier, safeGetPlayerLevel(player), it, badLuckCount)
    local money = safeGetCoinage(player)

    local keepCount = GetStoneCount(player, KEEPSAKE_STONE_ITEM_ID)
    local legCount = GetStoneCount(player, LEGENDARY_STONE_ITEM_ID)

    player:GossipClearMenu()

    player:GossipMenuAddItem(0, "|cff00c0ffUpgrade Preview|r", 0, 9998)
    player:GossipMenuAddItem(0, string.format("Slot:|r |cffffffff%s|r", GetEquipSlotLabel(slot)), 0, 9998)
    player:GossipMenuAddItem(0, string.format("Item:|r %s", SafeItemLine(it, entry)), 0, 9998)
    player:GossipMenuAddItem(0, string.format("|cff000000Tier:|r |cffffd100+%u -> +%u|r", tier, targetTier), 0, 9998)
    local critLevels = math.min(CRITICAL_UPGRADE_LEVELS, MAX_TIER - targetTier)
    if critLevels > 0 then
        local critDenom = GetCriticalUpgradeDenom(tier)
        player:GossipMenuAddItem(0, string.format("|cff000000Critical Chance:|r 1/%u for +%u levels", critDenom, critLevels), 0, 9998)
    end
    if badLuckCount > 0 then
        player:GossipMenuAddItem(0, string.format("|cff000000Base Success:|r |cff00ff00%u%%|r |cff000000(Bad luck)|r |cff00ff00%u%%|r |cff000000Fail:|r |cffff7777%u%%|r", baseChance, badLuckChance, failChance), 0, 9998)
    else
        player:GossipMenuAddItem(0, string.format("|cff000000Base Success:|r |cff00ff00%u%%|r |cff000000Fail:|r |cffff7777%u%%|r", baseChance, failChance), 0, 9998)
    end
    player:GossipMenuAddItem(0, string.format("|cff000000Cost:|r |cffffd100%s|r |cff000000 You have:|r |cffffd100%s|r", FormatGold(cost), FormatGold(money)), 0, 9998)

    player:GossipMenuAddItem(0, " ", 0, 9998)
    player:GossipMenuAddItem(0, "|cff00c0ffChoose Chance Improvement|r", 0, 9998)
    player:GossipMenuAddItem(0, string.format("|cff000000No Chance Improvement|r |cff00ff00(%u%% success)|r", badLuckChance), 0, 2100)
    
    if keepCount > 0 then
        player:GossipMenuAddItem(0, string.format("|cff000000Keepsake Stone|r |cffffffff(x%u)|r |cff00ff00+25%% (%u%% success)|r", keepCount, keepChance), 0, 2101)
    end
    
    if legCount > 0 then
        player:GossipMenuAddItem(0, string.format("|cff000000Legendary Stone|r |cffffffff(x%u)|r |cffff8000GUARANTEED!|r", legCount), 0, 2102)
    end
    
    player:GossipMenuAddItem(0, "Back", 0, 2109)

    player:GossipSendMenu(1, creature, MENU_IDS.SELECT_PROTECT)
end

function TryUpgradeBackpackSlot(player, bagSlot, chanceImprovementMode, creature)
    if not isValidPlayer(player) then
        return
    end
    if not AcquireUpgradeLock(player) then
        SafePcall("Player.SendBroadcastMessage", player.SendBroadcastMessage, player, "Upgrade already in progress.")
        return
    end

    local ok, err = pcall(function()
        local function Refresh()
            if isValidCreature(creature) then
                ShowBackpackProtectionMenu(player, creature, bagSlot)
                return
            end
            ShowBackpackProtectionMenuIfNearby(player, bagSlot)
        end
        local function Finish()
            return
        end
        local function Abort(msg, extra)
            if msg then SafePcall("Player.SendBroadcastMessage", player.SendBroadcastMessage, player, msg) end
            if extra then SafePcall("Player.SendBroadcastMessage", player.SendBroadcastMessage, player, extra) end
            Refresh()
            Finish()
            return
        end
        local function AbortResult(result, cost)
            HandleUpgradeAbort(player, result, chanceImprovementMode, cost, Refresh, "backpack")
            Finish()
            return
        end

        local it = safeGetItemByPos(player, EQUIP_BAG, bagSlot)
        if not it or not IsEligibleItem(it) then
            return Abort("That slot does not contain eligible rare+ gear.")
        end
        if type(it) ~= "userdata" and type(it) ~= "table" then
            return Abort("Invalid item reference.")
        end

        local p = GetPending(player)
        if p.bagGuidLow and it.GetGUIDLow then
            local okGuid, guidLow = pcall(it.GetGUIDLow, it)
            if okGuid and guidLow ~= p.bagGuidLow then
                return Abort("That backpack slot changed. Please select the item again.")
            end
        end

        local entry = safeItemGetEntry(it)
        if not entry then
            return Abort("Unable to read item data.")
        end
        local baseEntry, tier = GetBaseAndTierForEntry(entry)

        if tier >= MAX_TIER then
            return Abort("That item is already at the maximum tier.")
        end

        local safeClone, cloneReason = IsCloneRangeSafe(baseEntry)
        if not safeClone then
            if cloneReason == "clone mismatch" then
                return Abort("Upgrade data conflict for this item (clone range overlap).")
            end
            if cloneReason == "clone range blocked" then
                return Abort("Upgrade data not found for this item (clone range guard).")
            end
            return Abort("Upgrade data not found for this item (missing clone entry).")
        end

        local normalEntry = GetCloneEntry(baseEntry, tier + 1)
        if not normalEntry or not TemplateExists(normalEntry) then
            return Abort("Upgrade data not found for this item (missing clone entry).")
        end

        local badLuckCount = GetItemBadLuckCount(it)
        local targetTier, targetEntry, tierAdvance, maxAdvance = ResolveTargetTier(baseEntry, tier, badLuckCount)
        if not targetEntry or not TemplateExists(targetEntry) then
            return Abort("Upgrade data not found for this item (missing clone entry).")
        end
        
        local critLevels = math.min(CRITICAL_UPGRADE_LEVELS, MAX_TIER - targetTier)
        local isCritical = false
        local critDenom = GetCriticalUpgradeDenom(tier)
        if critLevels > 0 and math.random(1, critDenom) == 1 then
            local critEntry = GetCloneEntry(baseEntry, targetTier + critLevels)
            if critEntry and TemplateExists(critEntry) then
                isCritical = true
                targetTier = targetTier + critLevels
                targetEntry = critEntry
            end
        end

        if UPGRADE_DEBUG then
            local baseName = GetTemplateName(baseEntry) or "?"
            local cloneName = GetTemplateName(targetEntry) or "?"
            DebugMessage(player, string.format("Attempt: base=%u (%s) -> target=%u (%s) tier=%u->%u bagSlot=%u pity=%u tierAdvance=%u", baseEntry, baseName, targetEntry, cloneName, tier, targetTier, bagSlot, badLuckCount, tierAdvance))
        end
        if not ValidateCloneTemplate(player, baseEntry, targetEntry) then
            return Abort("Upgrade data mismatch for this item. Please fix clone requirements and retry.")
        end

        local cost = GetUpgradeCostCopper(tier, safeGetPlayerLevel(player), it, badLuckCount)
        if safeGetCoinage(player) < cost then
            return Abort("You do not have enough gold to attempt this upgrade.")
        end

        local okStone, errStone = ConsumeProtectionStone(player, chanceImprovementMode)
        if not okStone then
            return Abort(errStone or "Missing protection item.")
        end

        if not ChargeCopper(player, cost) then
            return Abort("You do not have enough gold to attempt this upgrade.")
        end

        if not isCritical then
            local chance = UpgradeSuccessChance(tier, chanceImprovementMode, badLuckCount, player, it)
            local roll = math.random(1, 100)

            if roll > chance then
                IncrementItemBadLuckCount(it)
                local newCount = badLuckCount + 1
                local nextAdvance = math.min(CalculateUpgradeTierAdvance(newCount), maxAdvance)
                player:SendBroadcastMessage(string.format(
                    "Upgrade failed. Bad luck stacks: |cff00ff00%u|r (+|cff00ff00%u%%|r success)",
                    newCount, GetBadLuckBonus(newCount), nextAdvance
                ))
                Refresh()
                Finish()
                return
            end
        end

        local oldGuidLow = safeGetGuidLow(it)
        if not oldGuidLow then
            return Abort("Invalid item reference.")
        end
        local result = UpgradeBackpackItem(player, it, bagSlot, targetEntry, cost, chanceImprovementMode, targetTier, isCritical, oldGuidLow)
        if result == "bagupgraded" then
            ResetItemBadLuckCount(oldGuidLow)
            if isCritical then
                player:SendBroadcastMessage("|cff00ff00CRITICAL SUCCESSFUL UPGRADE!|r |cffffff00Be sure to thank Benson!|r")
            end
            if targetTier > 16 and SendWorldMessage and CanSendUpgradeAnnouncement(player) then
                local baseName = GetTemplateName(baseEntry) or "item"
                local oldTier = math.max(1, targetTier - 1)
                local oldEntry = GetCloneEntry(baseEntry, oldTier)
                local playerName = player:GetName() or "Someone"
                local classColor = GetClassColorHex(player)
                local coloredPlayer = string.format("|cff%s%s|r", classColor, playerName)
                local oldItemLink = CreateItemLink(oldEntry or baseEntry, baseName .. " +" .. oldTier, oldTier)
                local newItemLink = CreateItemLink(targetEntry, baseName .. " +" .. targetTier, targetTier)
                SendWorldMessage(string.format("|cff00cc00[Server]|r %s |cff00cc00has successfully upgraded|r %s |cff00cc00to|r %s", coloredPlayer, oldItemLink, newItemLink))
            end
            
            Refresh()
            Finish()
            return
        end

        return AbortResult(result, cost)
    end)

    ReleaseUpgradeLock(player)
    if not ok and UPGRADE_DEBUG then
        DebugLog("TryUpgradeBackpackSlot error: " .. tostring(err))
    end
end

function GetBadLuckBonus(badLuckCount)
    if not badLuckCount or badLuckCount <= 0 then return 0 end
    local n = #BAD_LUCK_BONUS_TABLE
    if n > 0 and badLuckCount <= n then
        return BAD_LUCK_BONUS_TABLE[badLuckCount] or 0
    end
    local last = (n > 0 and BAD_LUCK_BONUS_TABLE[n]) or 0
    local step = BAD_LUCK_BONUS_STEP_AFTER or 0
    return last + ((badLuckCount - n) * step)
end

function TryUpgradeEquippedSlot(player, slot, chanceImprovementMode, creature)
    if not isValidPlayer(player) then
        return
    end
    if not AcquireUpgradeLock(player) then
        SafePcall("Player.SendBroadcastMessage", player.SendBroadcastMessage, player, "Upgrade already in progress.")
        return
    end

    local ok, err = pcall(function()
    local function Refresh()
        if isValidCreature(creature) then
            ShowEquippedProtectionMenu(player, creature, slot)
            return
        end
        ShowEquippedProtectionMenuIfNearby(player, slot)
    end
    local function Finish()
        return
    end
    local function Abort(msg, extra)
        if msg then SafePcall("Player.SendBroadcastMessage", player.SendBroadcastMessage, player, msg) end
        if extra then SafePcall("Player.SendBroadcastMessage", player.SendBroadcastMessage, player, extra) end
        Refresh()
        Finish()
        return
    end
    local function AbortResult(result, cost)
        HandleUpgradeAbort(player, result, chanceImprovementMode, cost, Refresh, "equipment")
        Finish()
        return
    end

    if EXCLUDED_SLOTS[slot] then
        return Abort("That equipment slot is not eligible for upgrades.")
    end

    local it = GetEquippedItemBySlotSafe(player, slot)
    if not it or not IsEligibleItem(it) then
        return Abort("That slot does not contain eligible rare+ gear.")
    end
    if type(it) ~= "userdata" and type(it) ~= "table" then
        return Abort("Invalid item reference.")
    end

    local p = GetPending(player)
    if p.equipGuidLow and it.GetGUIDLow then
        local okGuid, guidLow = pcall(it.GetGUIDLow, it)
        if okGuid and guidLow ~= p.equipGuidLow then
            return Abort("That equipment slot changed. Please select the item again.")
        end
    end

    local entry = safeItemGetEntry(it)
    if not entry then
        return Abort("Unable to read item data.")
    end
    local baseEntry, tier = GetBaseAndTierForEntry(entry)

    if tier >= MAX_TIER then
        return Abort("That item is already at the maximum tier.")
    end

    local safeClone, cloneReason = IsCloneRangeSafe(baseEntry)
    if not safeClone then
        if cloneReason == "clone mismatch" then
            return Abort("Upgrade data conflict for this item (clone range overlap).")
        end
        if cloneReason == "clone range blocked" then
            return Abort("Upgrade data not found for this item (clone range guard).")
        end
        return Abort("Upgrade data not found for this item (missing clone entry).")
    end

    local badLuckCount = GetItemBadLuckCount(it)
    local targetTier, targetEntry, tierAdvance, maxAdvance = ResolveTargetTier(baseEntry, tier, badLuckCount)
    if not targetEntry or not TemplateExists(targetEntry) then
        return Abort("Upgrade data not found for this item (missing clone entry).")
    end

    local critLevels = math.min(CRITICAL_UPGRADE_LEVELS, MAX_TIER - targetTier)
    local isCritical = false
    local critDenom = GetCriticalUpgradeDenom(tier)
    if critLevels > 0 and math.random(1, critDenom) == 1 then
        local critEntry = GetCloneEntry(baseEntry, targetTier + critLevels)
        if critEntry and TemplateExists(critEntry) then
            isCritical = true
            targetTier = targetTier + critLevels
            targetEntry = critEntry
        end
    end

    if UPGRADE_DEBUG then
        local baseName = GetTemplateName(baseEntry) or "?"
        local cloneName = GetTemplateName(targetEntry) or "?"
        DebugMessage(player, string.format("Attempt: base=%u (%s) -> target=%u (%s) tier=%u->%u slot=%u pity=%u tierAdvance=%u", baseEntry, baseName, targetEntry, cloneName, tier, targetTier, slot, badLuckCount, tierAdvance))
    end
    if not ValidateCloneTemplate(player, baseEntry, targetEntry) then
        return Abort("Upgrade data mismatch for this item. Please fix clone requirements and retry.")
    end

    local cost = GetUpgradeCostCopper(tier, safeGetPlayerLevel(player), it, badLuckCount)
    if safeGetCoinage(player) < cost then
        return Abort("You do not have enough gold to attempt this upgrade.")
    end

    local okStone, errStone = ConsumeProtectionStone(player, chanceImprovementMode)
    if not okStone then
        return Abort(errStone or "Missing protection item.")
    end

    if not ChargeCopper(player, cost) then
        return Abort("You do not have enough gold to attempt this upgrade.")
    end

    if not isCritical then
        local chance = UpgradeSuccessChance(tier, chanceImprovementMode, badLuckCount, player, it)
        local roll = math.random(1, 100)

        if roll > chance then
            IncrementItemBadLuckCount(it)
            local newCount = badLuckCount + 1
            local nextAdvance = math.min(CalculateUpgradeTierAdvance(newCount), maxAdvance)
            player:SendBroadcastMessage(string.format(
                "Upgrade failed. Bad luck stacks: |cff00ff00%u|r (+|cff00ff00%u%%|r success)",
                newCount, GetBadLuckBonus(newCount), nextAdvance
            ))
            Refresh()
            Finish()
            return
        end
    end

    local oldGuidLow = safeGetGuidLow(it)
    local result = UpgradeEquippedItem(player, it, slot, targetEntry, cost, chanceImprovementMode, targetTier, isCritical)
    if result == "equipupgraded" then
        ResetItemBadLuckCount(oldGuidLow)
        if isCritical then
            player:SendBroadcastMessage("|cff00ff00CRITICAL SUCCESSFUL UPGRADE!|r |cffffff00Be sure to thank Benson!|r")
        end
        if targetTier > 16 and SendWorldMessage and CanSendUpgradeAnnouncement(player) then
            local baseName = GetTemplateName(baseEntry) or "item"
            local oldTier = math.max(1, targetTier - 1)
            local oldEntry = GetCloneEntry(baseEntry, oldTier)
            local playerName = player:GetName() or "Someone"
            local classColor = GetClassColorHex(player)
            local coloredPlayer = string.format("|cff%s%s|r", classColor, playerName)
            local oldItemLink = CreateItemLink(oldEntry or baseEntry, baseName .. " +" .. oldTier, oldTier)
            local newItemLink = CreateItemLink(targetEntry, baseName .. " +" .. targetTier, targetTier)
            SendWorldMessage(string.format("|cff00cc00[Server]|r %s |cff00cc00has successfully upgraded|r %s |cff00cc00to|r %s", coloredPlayer, oldItemLink, newItemLink))
        end
        Refresh()
        Finish()
        return
    end

    return AbortResult(result, cost)
    end)

    ReleaseUpgradeLock(player)
    if not ok and UPGRADE_DEBUG then
        DebugLog("TryUpgradeEquippedSlot error: " .. tostring(err))
    end
end


function OnGossipHello(event, player, creature)
    if not isValidPlayer(player) then return end
    if not isValidCreature(creature) then return end
    local ok, entry = pcall(function() return creature:GetEntry() end)
    if not ok or entry ~= UPGRADE_NPC_ENTRY then return end
    if not ScriptReady then
        player:SendBroadcastMessage("Upgrade system disabled.")
        return
    end
    ShowMainMenu(player, creature)
    if AIO then AIO.Handle(player, "UpgradeUI", "OpenUI") end
end

function OnGossipSelect(event, player, creature, sender, intid, code, menu_id)
    if not isValidPlayer(player) then return end
    if not isValidCreature(creature) then return end
    local ok, entry = pcall(function() return creature:GetEntry() end)
    if not ok or entry ~= UPGRADE_NPC_ENTRY then return end
    if not ScriptReady then
        player:GossipComplete()
        return
    end

    if intid == 9998 or intid == 9999 then
        local p = GetPending(player)
        if p and p.mode == "backpack" and p.bagSlot then
            ShowBackpackProtectionMenu(player, creature, p.bagSlot)
        elseif p and p.mode == "equipped" and p.slot then
            ShowEquippedProtectionMenu(player, creature, p.slot)
        else
            ShowMainMenu(player, creature)
        end
        return
    end

    if not EQUIPPED_UPGRADE_ENABLED then
        if intid == 10 or (intid >= 1000 and intid < 1300) then
            player:SendBroadcastMessage("|cffff0000Equipped item upgrades are not currently enabled.|r")
            player:GossipComplete()
            return
        end
    end
    if not BACKPACK_UPGRADE_ENABLED then
        if intid == 30 or (intid >= 4000 and intid < (4000 + BACKPACK_UPGRADE_SLOT_COUNT)) then
            player:SendBroadcastMessage("|cffff0000Backpack item upgrades are not currently enabled.|r")
            player:GossipComplete()
            return
        end
    end

    if intid == 30 then
        ShowBackpackSelectMenu(player, creature)
        return
    end

    if intid == 10 then
        ShowEquippedSelectMenu(player, creature)
        return
    end



    if intid == 20 then
        ShowBuyStonesMenu(player, creature)
        return
    end

    if intid == 11 or intid == 21 or intid == 31 then
        ShowMainMenu(player, creature)
        return
    end

    if intid >= 1000 and intid < 1300 then
        local slot = intid - 1000
        local p = GetPending(player)
        p.slot = slot
        p.bagSlot = nil
        p.bagGuidLow = nil
        p.mode = "equipped"
        p.equipGuidLow = nil
        local it = GetEquippedItemBySlotSafe(player, slot)
        if it and it.GetGUIDLow then
            local okGuid, guidLow = pcall(it.GetGUIDLow, it)
            if okGuid then
                p.equipGuidLow = guidLow
            end
        end
        ShowEquippedProtectionMenu(player, creature, slot)
        return
    end

    if intid >= 4000 and intid < (4000 + BACKPACK_UPGRADE_SLOT_COUNT) then
        local idx = intid - 4000
        local bagSlot = BACKPACK_SLOT_START + idx
        local p = GetPending(player)
        p.bagSlot = bagSlot
        p.bagGuidLow = nil
        p.slot = nil
        p.mode = "backpack"
        p.equipGuidLow = nil
        local it = safeGetItemByPos(player, EQUIP_BAG, bagSlot)
        if it and it.GetGUIDLow then
            local okGuid, guidLow = pcall(it.GetGUIDLow, it)
            if okGuid then
                p.bagGuidLow = guidLow
            end
        end
        ShowBackpackProtectionMenu(player, creature, bagSlot)
        return
    end

    if intid == 2109 then
        local p = GetPending(player)
        if p and p.mode == "backpack" then
            ShowBackpackSelectMenu(player, creature)
        elseif p and p.mode == "equipped" then
            ShowEquippedSelectMenu(player, creature)
        else
            ShowMainMenu(player, creature)
        end
        return
    end

    local p = GetPending(player)
    if (intid == 2100 or intid == 2101 or intid == 2102) and (not p.slot) and (not p.bagSlot) then
        ShowMainMenu(player, creature)
        return
    end

    if intid == 2100 then
        player:GossipComplete()
        if p.mode == "backpack" and p.bagSlot then
            TryUpgradeBackpackSlot(player, p.bagSlot, 0, creature)
        elseif p.mode == "equipped" and p.slot then
            TryUpgradeEquippedSlot(player, p.slot, 0, creature)
        end
        return
    end

    if intid == 2101 then
        player:GossipComplete()
        if p.mode == "backpack" and p.bagSlot then
            TryUpgradeBackpackSlot(player, p.bagSlot, 1, creature)
        elseif p.mode == "equipped" and p.slot then
            TryUpgradeEquippedSlot(player, p.slot, 1, creature)
        end
        return
    end

    if intid == 2102 then
        player:GossipComplete()
        if p.mode == "backpack" and p.bagSlot then
            TryUpgradeBackpackSlot(player, p.bagSlot, 2, creature)
        elseif p.mode == "equipped" and p.slot then
            TryUpgradeEquippedSlot(player, p.slot, 2, creature)
        end
        return
    end

    if intid == 3001 then
        local okBuy, msg = PurchaseStoneForPlayer(player, KEEPSAKE_STONE_ITEM_ID, 1)
        pcall(function() player:SendBroadcastMessage(msg or (okBuy and "Purchased." or "Purchase failed.")) end)
        ShowBuyStonesMenu(player, creature)
        return
    end

    if intid == 3002 then
        local okBuy, msg = PurchaseStoneForPlayer(player, LEGENDARY_STONE_ITEM_ID, 1)
        pcall(function() player:SendBroadcastMessage(msg or (okBuy and "Purchased." or "Purchase failed.")) end)
        ShowBuyStonesMenu(player, creature)
        return
    end

    ShowMainMenu(player, creature)
end

function SendPeriodicLootChanceReminders(eventId, delay, repeats)
    if not ScriptReady then return end
    if not LOOT_UPGRADE_ENABLED or not LOOT_UPGRADE_REMINDER_ENABLED then return end
    if not GetPlayersInWorld then return end

    local players = GetPlayersInWorld()
    if type(players) ~= "table" then return end

    for i = 1, #players do
        local player = players[i]
        if isValidPlayer(player) then
            SendLootChanceReminder(player)
        end
    end
end

function OnStartup(event)
    math.randomseed(os.time())
    InitializePityPersistence()
    ScriptReady = true
    ClearTable(UPGRADE_SWAPS)
    ClearTable(PENDING_EQUIP)
    ClearTable(PendingSelection)
    ClearTable(InProgress)
    ClearTable(RecentAioUpgradeRequests)
    ClearTable(RecentAioStoneBuyRequests)
    ClearTable(PlayerPityLoaded)
    ClearTable(ItemPityLoaded)
    if CLONE_NAMESPACE_STRIDE > 0 and CLONE_RANGE_MIN == nil and CLONE_RANGE_MAX == nil then
        if UPGRADE_DEBUG then
            DebugLog("CLONE_NAMESPACE_STRIDE set without CLONE_RANGE_*; ensure stride >= (max_base_entry * TIERS) to avoid overlaps.")
        end
    end
    if CreateLuaEvent and LOOT_UPGRADE_ENABLED and LOOT_UPGRADE_REMINDER_ENABLED then
        CreateLuaEvent(SendPeriodicLootChanceReminders, LOOT_UPGRADE_REMINDER_INTERVAL_SEC * 1000, 0)
    end
end

function OnPlayerLogin(event, player)
    if not player then return end
    local guidLow = safeGetGuidLow(player)
    if not guidLow then return end
    PlayerPityLoaded[guidLow] = nil
    LoadPlayerPityFromDB(guidLow)
end

function OnPlayerLogout(event, player)
    if not player then return end
    local ok, guidLow = pcall(function() return player:GetGUIDLow() end)
    if ok and guidLow then
        PendingSelection[guidLow] = nil
        UPGRADE_SWAPS[guidLow] = nil
        PENDING_EQUIP[guidLow] = nil
        InProgress[guidLow] = nil
        RecentAioUpgradeRequests[guidLow] = nil
        RecentAioStoneBuyRequests[guidLow] = nil
        AnnounceCooldowns[guidLow] = nil
        
        if CLEAR_PITY_ON_LOGOUT then
            LootBadLuckCounters[guidLow] = nil
            BadLuckCounters[guidLow] = nil
            LootChanceReduction[guidLow] = nil
            SavePlayerPityToDB(guidLow)
        end
        PlayerPityLoaded[guidLow] = nil
    end
end

function OnPlayerSave(event, player)
    if not player then return end
    local ok, guidLow = pcall(function() return player:GetGUIDLow() end)
    if ok and guidLow then
        AnnounceCooldowns[guidLow] = nil
    end
end

function OnPlayerCommand(event, player, command)
    if not isValidPlayer(player) then return end
    if not command or command == "" then return end
    
    local head, tail = command:match("^([%w_%.%-]+)%s*(.*)$")
    if not head then return end
    if head:sub(1, 1) == "." then head = head:sub(2) end
    
    if head:lower() == "upgrade" or head:lower() == "uc" or head:lower() == "ue" then
        tail = tail or ""
        local subcommand = tail:match("^(%S+)") or (head:lower() == "ue" and "explain") or "chance"
        
        if subcommand:lower() == "chance" then
            if not LOOT_UPGRADE_ENABLED then
                player:SendBroadcastMessage("|cffff0000Loot upgrade system is currently disabled.|r")
                return false
            end
            
            local currentChanceDenom, blc = GetCurrentLootUpgradeChanceDenom(player)
            local currentChancePercent = math.floor((1 / currentChanceDenom) * 10000) / 100
            
            player:SendBroadcastMessage("|cff00ff00[Your Current Upgrade Chance]|r")
            player:SendBroadcastMessage(string.format(
                "Upgrade Chance: |cffffff001 in %d|r (|cff00ff00%.2f%%|r)",
                currentChanceDenom, currentChancePercent
            ))
            player:SendBroadcastMessage("When triggered: random |cff00ff00+5 to +20|r tier upgrade")
            player:SendBroadcastMessage("|cffffffffTracks eligible rare+ items gained from loot, group roll, and created/crafted items.|r")
            
            if blc > 0 then
                player:SendBroadcastMessage(string.format("|cff00ff00[Bad Luck Protection]|r %d points (-%d to denominator) [+5 per rare, +20 per epic, +200 per legendary]", blc, blc))
            else
                player:SendBroadcastMessage("|cff00ff00[Status]|r No bad luck points - you're lucky!")
            end
            return false
        elseif subcommand and subcommand:lower() == "explain" then
            player:SendBroadcastMessage("|cff00ff00[Loot Upgrade System Explained]|r")
            player:SendBroadcastMessage("Base: 1 in 300 chance per eligible rare+ item (loot/roll/create)")
            player:SendBroadcastMessage("Each rare failure: +5 bad luck points")
            player:SendBroadcastMessage("Each epic failure: +20 bad luck points")
            player:SendBroadcastMessage("Each legendary failure: +200 bad luck points")
            player:SendBroadcastMessage("Bad luck points directly reduce the denominator (300 - points = new denom)")
            player:SendBroadcastMessage("When triggered: random +5 to +20 tier upgrade")
            player:SendBroadcastMessage("Success resets your points to 0")
            return false
        end
    end
    
    if head:lower() == "upgradetest" then
        if not IsPlayerGM(player) then
            player:SendBroadcastMessage("|cffff0000You do not have permission to use this command.|r")
            return false
        end
        tail = tail or ""
        local subcommand = tail:match("^(%S+)")
        
        if not subcommand or subcommand:lower() == "status" then
            player:SendBroadcastMessage(string.format("|cff00c0ff[Loot Upgrade Test Mode]|r %s", LOOT_UPGRADE_TEST_MODE and "|cff00ff00ENABLED|r" or "|cffff0000DISABLED|r"))
            player:SendBroadcastMessage("|cffffffffWhen enabled: All looted items are upgraded (100%% success, pity not consumed)|r")
            return false
        elseif subcommand:lower() == "on" or subcommand:lower() == "enable" then
            LOOT_UPGRADE_TEST_MODE = true
            player:SendBroadcastMessage("|cff00ff00[Loot Upgrade Test Mode]|r |cff00ff00ENABLED|r - All looted items will be upgraded!")
            return false
        elseif subcommand:lower() == "off" or subcommand:lower() == "disable" then
            LOOT_UPGRADE_TEST_MODE = false
            player:SendBroadcastMessage("|cffff0000[Loot Upgrade Test Mode]|r |cffff0000DISABLED|r - Normal upgrade chances in effect.")
            return false
        else
            player:SendBroadcastMessage("|cff00c0ff[Loot Upgrade Test Mode]|r Usage: .upgradetest [on|off|status]")
            return false
        end
    end
end

if AIO then
    AIO.AddHandlers("UpgradeUI", {

        GetEquippedItems = function(player)
            if not isValidPlayer(player) then return end
            local items = {}
            for slot = 0, 18 do
                if not EXCLUDED_SLOTS[slot] then
                    local it = GetEquippedItemBySlotSafe(player, slot)
                    if it and IsEligibleItem(it) and HasItemStats(it) then
                        local entry = safeItemGetEntry(it)
                        if entry then
                            local baseEntry, tier = GetBaseAndTierForEntry(entry)
                            if tier < MAX_TIER then
                                local supported, reason = IsSupportedForUpgrade(it)
                                local badLuck   = GetItemBadLuckCount(it)
                                local tgt, _    = ResolveTargetTier(baseEntry, tier, badLuck)
                                local cost      = GetUpgradeCostCopper(tier, safeGetPlayerLevel(player), it, badLuck)
                                local chance    = UpgradeSuccessChance(tier, 0, badLuck, player, it)
                                local name      = safeItemGetName(it) or "Unknown"
                                local slotLbl   = GetEquipSlotLabel(slot)
                                items[#items + 1] = {
                                    slot       = slot,
                                    slotLabel  = slotLbl,
                                    entry      = entry,
                                    name       = name,
                                    tier       = tier,
                                    targetTier = tgt,
                                    cost       = cost,
                                    chance     = chance,
                                    supported  = supported,
                                    reason     = reason,
                                    badLuck    = badLuck,
                                }
                            end
                        end
                    end
                end
            end
            AIO.Handle(player, "UpgradeUI", "ReceiveEquippedItems", items)
        end,

        GetItemPreview = function(player, slot)
            if not isValidPlayer(player) then return end
            if type(slot) ~= "number" then return end
            if EXCLUDED_SLOTS[slot] then
                AIO.Handle(player, "UpgradeUI", "ReceiveError", "That slot is not eligible for upgrades.")
                return
            end
            local it = GetEquippedItemBySlotSafe(player, slot)
            if not it then
                AIO.Handle(player, "UpgradeUI", "ReceiveError", "No item in that slot.")
                return
            end
            if not IsEligibleItem(it) then
                AIO.Handle(player, "UpgradeUI", "ReceiveError", "Item is not eligible (Rare+ armor/weapon required).")
                return
            end
            local entry = safeItemGetEntry(it)
            if not entry then
                AIO.Handle(player, "UpgradeUI", "ReceiveError", "Could not read item entry.")
                return
            end
            local baseEntry, tier = GetBaseAndTierForEntry(entry)
            if tier >= MAX_TIER then
                AIO.Handle(player, "UpgradeUI", "ReceiveItemMeta", {
                    slot      = slot,
                    slotLabel = GetEquipSlotLabel(slot),
                    entry     = entry,
                    itemLink  = safeItemGetItemLink(it),
                    itemName  = safeItemGetName(it) or "Unknown",
                    tier      = tier,
                    targetTier = tier,
                })
                AIO.Handle(player, "UpgradeUI", "ReceiveError", "Item is already at maximum tier.")
                return
            end
            local supported, reason = IsSupportedForUpgrade(it)
            if not supported then
                AIO.Handle(player, "UpgradeUI", "ReceiveError", reason or "Item is not supported.")
                return
            end
            local badLuck    = GetItemBadLuckCount(it)
            local tgt, _     = ResolveTargetTier(baseEntry, tier, badLuck)
            local baseChance = UpgradeSuccessChance(tier, 0, 0, player, it)
            local chance     = UpgradeSuccessChance(tier, 0, badLuck, player, it)
            local keepChance = UpgradeSuccessChance(tier, 1, badLuck, player, it)
            local legChance  = UpgradeSuccessChance(tier, 2, badLuck, player, it)
            local failChance = 100 - chance
            local cost       = GetUpgradeCostCopper(tier, safeGetPlayerLevel(player), it, badLuck)
            local money      = safeGetCoinage(player)
            local critDenom  = GetCriticalUpgradeDenom(tier)
            local critLevels = math.min(CRITICAL_UPGRADE_LEVELS, MAX_TIER - tgt)
            local keepCount  = GetStoneCount(player, KEEPSAKE_STONE_ITEM_ID)
            local legCount   = GetStoneCount(player, LEGENDARY_STONE_ITEM_ID)
            local keepPrice  = GetStonePriceCopper(KEEPSAKE_STONE_ITEM_ID) or 0
            local legPrice   = GetStonePriceCopper(LEGENDARY_STONE_ITEM_ID) or 0
            AIO.Handle(player, "UpgradeUI", "ReceiveItemPreview", {
                slot       = slot,
                slotLabel  = GetEquipSlotLabel(slot),
                entry      = entry,
                itemLink   = safeItemGetItemLink(it),
                itemName   = safeItemGetName(it) or "Unknown",
                tier       = tier,
                targetTier = tgt,
                baseChance = baseChance,
                chance     = chance,
                keepChance = keepChance,
                legChance  = legChance,
                failChance = failChance,
                cost       = cost,
                money      = money,
                keepCount  = keepCount,
                legCount   = legCount,
                keepPrice  = keepPrice,
                legPrice   = legPrice,
                badLuck    = badLuck,
                critDenom  = critDenom,
                critLevels = critLevels,
            })
        end,

        BuyStone = function(player, stoneMode, amount, slot, requestId)
            if not isValidPlayer(player) then return end

            if IsDuplicateAioStoneBuyRequest(player, requestId) then
                if UPGRADE_DEBUG then
                    DebugLog("AIO BuyStone deduped duplicate request id " .. tostring(requestId))
                end
                return
            end

            local okRun, runErr = pcall(function()
                local mode = tonumber(stoneMode)
                local itemId = nil
                if mode == 1 then
                    itemId = KEEPSAKE_STONE_ITEM_ID
                elseif mode == 2 then
                    itemId = LEGENDARY_STONE_ITEM_ID
                end
                if not itemId then
                    AIO.Handle(player, "UpgradeUI", "StoneShopResult", false, "Invalid stone selection.")
                    return
                end

                local okBuy, msg = PurchaseStoneForPlayer(player, itemId, amount)
                AIO.Handle(player, "UpgradeUI", "StoneShopResult", okBuy and true or false, msg or (okBuy and "Purchased." or "Purchase failed."))

                local slotNum = tonumber(slot)
                if slotNum then
                    AIO.Handle(player, "UpgradeUI", "GetItemPreview", slotNum)
                end
            end)

            if not okRun then
                DebugLog("BuyStone handler error: " .. tostring(runErr))
                AIO.Handle(player, "UpgradeUI", "StoneShopResult", false, "Purchase failed (server error).")
            end
        end,

        DoUpgrade = function(player, slot, cMode, requestId)
            if not isValidPlayer(player) then return end
            if type(slot) ~= "number" then return end
            cMode = math.max(0, math.min(2, tonumber(cMode) or 0))

            if IsDuplicateAioUpgradeRequest(player, requestId) then
                if UPGRADE_DEBUG then
                    DebugLog("AIO DoUpgrade deduped duplicate request id " .. tostring(requestId))
                end
                return
            end

            if not AcquireUpgradeLock(player) then
                AIO.Handle(player, "UpgradeUI", "UpgradeResult", false, "Upgrade already in progress.")
                return
            end

            local function Fail(msg)
                AIO.Handle(player, "UpgradeUI", "UpgradeResult", false, msg)
            end

            local ok, runErr = pcall(function()
                if EXCLUDED_SLOTS[slot] then return Fail("That slot is not eligible.") end

                local it = GetEquippedItemBySlotSafe(player, slot)
                if not it or not IsEligibleItem(it) then return Fail("No eligible item in that slot.") end

                local entry = safeItemGetEntry(it)
                if not entry then return Fail("Could not read item data.") end

                local baseEntry, tier = GetBaseAndTierForEntry(entry)
                if tier >= MAX_TIER then return Fail("Item is already at maximum tier.") end

                local safeClone, cloneReason = IsCloneRangeSafe(baseEntry)
                if not safeClone then return Fail("Upgrade data not found (" .. (cloneReason or "unknown") .. ").") end

                local badLuck = GetItemBadLuckCount(it)
                local targetTier, targetEntry, _, maxAdvance = ResolveTargetTier(baseEntry, tier, badLuck)
                if not targetEntry or not TemplateExists(targetEntry) then
                    return Fail("Upgrade data not found (missing clone entry).")
                end

                local critLevels = math.min(CRITICAL_UPGRADE_LEVELS, MAX_TIER - targetTier)
                local isCritical = false
                if critLevels > 0 and math.random(1, GetCriticalUpgradeDenom(tier)) == 1 then
                    local critEntry = GetCloneEntry(baseEntry, targetTier + critLevels)
                    if critEntry and TemplateExists(critEntry) then
                        isCritical = true; targetTier = targetTier + critLevels; targetEntry = critEntry
                    end
                end

                if not ValidateCloneTemplate(player, baseEntry, targetEntry) then
                    return Fail("Upgrade data mismatch. Report this issue.")
                end

                local cost = GetUpgradeCostCopper(tier, safeGetPlayerLevel(player), it, badLuck)
                if safeGetCoinage(player) < cost then
                    return Fail("Not enough gold (" .. FormatGold(cost) .. " required).")
                end

                local okStone, errStone = ConsumeProtectionStone(player, cMode)
                if not okStone then return Fail(errStone or "Missing protection stone.") end

                if not ChargeCopper(player, cost) then
                    RefundProtectionStone(player, cMode)
                    return Fail("Failed to charge gold. Please try again.")
                end

                if not isCritical then
                    local chance = UpgradeSuccessChance(tier, cMode, badLuck, player, it)
                    if math.random(1, 100) > chance then
                        IncrementItemBadLuckCount(it)
                        local newCount = badLuck + 1
                        AIO.Handle(player, "UpgradeUI", "UpgradeResult", false,
                            string.format("Upgrade failed! Bad luck stacks: %d (+%d%% bonus)",
                                newCount, GetBadLuckBonus(newCount)))
                        AIO.Handle(player, "UpgradeUI", "GetItemPreview", slot)
                        return
                    end
                end

                local oldGuidLow = safeGetGuidLow(it)
                local result = UpgradeEquippedItem(player, it, slot, targetEntry, cost, cMode, targetTier, isCritical)

                if result == "equipupgraded" then
                    ResetItemBadLuckCount(oldGuidLow)
                    local successMsg = isCritical and "CRITICAL upgrade!" or "Successfully upgraded!"
                    AIO.Handle(player, "UpgradeUI", "UpgradeResult", true,
                        successMsg, isCritical)

                    if targetTier > 16 and SendWorldMessage and CanSendUpgradeAnnouncement(player) then
                        local baseName = GetTemplateName(baseEntry) or "item"
                        local p = player:GetName() or "Someone"
                        local cc = GetClassColorHex(player)
                        local oldLink = CreateItemLink(GetCloneEntry(baseEntry, math.max(1, targetTier - 1)) or baseEntry, baseName .. " +" .. tier, tier)
                        local newLink = CreateItemLink(targetEntry, baseName .. " +" .. targetTier, targetTier)
                        SendWorldMessage(string.format("|cff00cc00[Server]|r |cff%s%s|r upgraded %s to %s", cc, p, oldLink, newLink))
                    end

                    local pguid = safeGetGuidLow(player)
                    local function SendPreviewRefresh()
                        local p2 = GetPlayerByAnyGuid(nil, pguid)
                        if isValidPlayer(p2) then
                            AIO.Handle(p2, "UpgradeUI", "GetItemPreview", slot)
                        end
                    end
                    if CreateLuaEvent and AIO_PREVIEW_REFRESH_DELAY_MS > 0 then
                        CreateLuaEvent(SendPreviewRefresh, AIO_PREVIEW_REFRESH_DELAY_MS, 1)
                    else
                        SendPreviewRefresh()
                    end
                else
                    RefundProtectionStone(player, cMode)
                    if player.ModifyMoney then pcall(player.ModifyMoney, player, cost) end
                    if result == "nobag" then
                        return Fail("Aborted: need a free bag slot. Gold refunded.")
                    elseif result == "swapfail" then
                        return Fail("Aborted: item swap failed. Gold refunded.")
                    else
                        return Fail("Upgrade failed. Gold refunded.")
                    end
                end
            end)

            ReleaseUpgradeLock(player)
            if not ok and UPGRADE_DEBUG then
                DebugLog("AIO DoUpgrade error: " .. tostring(runErr))
            end
        end,
    })
end

CreateLuaEvent(OnStartup, 1000, 1)

RegisterPlayerEvent(3, OnPlayerLogin)
RegisterPlayerEvent(4, OnPlayerLogout)
RegisterPlayerEvent(25, OnPlayerSave)
RegisterPlayerEvent(42, OnPlayerCommand)

RegisterPlayerEvent(32, OnLootItemUpgrade)
RegisterPlayerEvent(53, OnLootItemUpgrade)
RegisterPlayerEvent(56, OnGroupRollRewardItem)
RegisterPlayerEvent(52, OnCreateItemUpgrade)

RegisterCreatureGossipEvent(UPGRADE_NPC_ENTRY, 1, OnGossipHello)
RegisterCreatureGossipEvent(UPGRADE_NPC_ENTRY, 2, OnGossipSelect)
