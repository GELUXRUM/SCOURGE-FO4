Scriptname SCOURGE_Patch_10_NPCs_BoolTracker Extends Quest
{Tracks boolean values that are managed through the MCM Menu}

Group Master
    Bool Property EnableSCOURGE = True Auto
    Bool Property EnableHealth = True Auto
    Bool Property EnableDamageResist = True Auto
    Bool Property EnableEnergyResist = True Auto
    Bool Property EnableSpeedMult = True Auto
    Bool Property EnableInfluence = False Auto
EndGroup

Group Health
    Bool Property CustomRaceOneHealth = True Auto
    Bool Property CustomRaceTwoHealth = True Auto
    Bool Property CustomRaceThreeHealth = True Auto
    Bool Property CustomRaceFourHealth = True Auto
    Bool Property CustomRaceFiveHealth = True Auto
    Bool Property CustomRaceSixHealth = True Auto
    Bool Property CustomRaceSevenHealth = True Auto
    Bool Property CustomRaceEightHealth = True Auto
    Bool Property CustomRaceNineHealth = True Auto
    Bool Property CustomRaceTenHealth = True Auto
EndGroup
    
Group DamageResist
    Bool Property CustomRaceOneDamageResist = True Auto
    Bool Property CustomRaceTwoDamageResist = True Auto
    Bool Property CustomRaceThreeDamageResist = True Auto
    Bool Property CustomRaceFourDamageResist = True Auto
    Bool Property CustomRaceFiveDamageResist = True Auto
    Bool Property CustomRaceSixDamageResist = True Auto
    Bool Property CustomRaceSevenDamageResist = True Auto
    Bool Property CustomRaceEightDamageResist = True Auto
    Bool Property CustomRaceNineDamageResist = True Auto
    Bool Property CustomRaceTenDamageResist = True Auto
EndGroup

Group EnergyResist
    Bool Property CustomRaceOneEnergyResist = True Auto
    Bool Property CustomRaceTwoEnergyResist = True Auto
    Bool Property CustomRaceThreeEnergyResist = True Auto
    Bool Property CustomRaceFourEnergyResist = True Auto
    Bool Property CustomRaceFiveEnergyResist = True Auto
    Bool Property CustomRaceSixEnergyResist = True Auto
    Bool Property CustomRaceSevenEnergyResist = True Auto
    Bool Property CustomRaceEightEnergyResist = True Auto
    Bool Property CustomRaceNineEnergyResist = True Auto
    Bool Property CustomRaceTenEnergyResist = True Auto
EndGroup

Group SpeedMult
    Bool Property CustomRaceOneSpeedMult = True Auto
    Bool Property CustomRaceTwoSpeedMult = True Auto
    Bool Property CustomRaceThreeSpeedMult = True Auto
    Bool Property CustomRaceFourSpeedMult = True Auto
    Bool Property CustomRaceFiveSpeedMult = True Auto
    Bool Property CustomRaceSixSpeedMult = True Auto
    Bool Property CustomRaceSevenSpeedMult = True Auto
    Bool Property CustomRaceEightSpeedMult = True Auto
    Bool Property CustomRaceNineSpeedMult = True Auto
    Bool Property CustomRaceTenSpeedMult = True Auto
EndGroup

Group Influence
    Bool Property CustomRaceOneInfluence = False Auto
    Bool Property CustomRaceTwoInfluence = False Auto
    Bool Property CustomRaceThreeInfluence = False Auto
    Bool Property CustomRaceFourInfluence = False Auto
    Bool Property CustomRaceFiveInfluence = False Auto
    Bool Property CustomRaceSixInfluence = False Auto
    Bool Property CustomRaceSevenInfluence = False Auto
    Bool Property CustomRaceEightInfluence = False Auto
    Bool Property CustomRaceNineInfluence = False Auto
    Bool Property CustomRaceTenInfluence = False Auto
EndGroup

Function ToggleHealthSwitchers(bool bToggle)
    CustomRaceOneHealth = bToggle
    CustomRaceTwoHealth = bToggle
    CustomRaceThreeHealth = bToggle
    CustomRaceFourHealth = bToggle
    CustomRaceFiveHealth = bToggle
    CustomRaceSixHealth = bToggle
    CustomRaceSevenHealth = bToggle
    CustomRaceEightHealth = bToggle
    CustomRaceNineHealth = bToggle
    CustomRaceTenHealth = bToggle
EndFunction

Function ToggleDamageResistSwitchers(bool bToggle)
    CustomRaceOneDamageResist = bToggle
    CustomRaceTwoDamageResist = bToggle
    CustomRaceThreeDamageResist = bToggle
    CustomRaceFourDamageResist = bToggle
    CustomRaceFiveDamageResist = bToggle
    CustomRaceSixDamageResist = bToggle
    CustomRaceSevenDamageResist = bToggle
    CustomRaceEightDamageResist = bToggle
    CustomRaceNineDamageResist = bToggle
    CustomRaceTenDamageResist = bToggle
EndFunction

Function ToggleEnergyResistSwitchers(bool bToggle)
    CustomRaceOneEnergyResist = bToggle
    CustomRaceTwoEnergyResist = bToggle
    CustomRaceThreeEnergyResist = bToggle
    CustomRaceFourEnergyResist = bToggle
    CustomRaceFiveEnergyResist = bToggle
    CustomRaceSixEnergyResist = bToggle
    CustomRaceSevenEnergyResist = bToggle
    CustomRaceEightEnergyResist = bToggle
    CustomRaceNineEnergyResist = bToggle
    CustomRaceTenEnergyResist = bToggle
EndFunction

Function ToggleSpeedMultSwitchers(bool bToggle)
    CustomRaceOneSpeedMult = bToggle
    CustomRaceTwoSpeedMult = bToggle
    CustomRaceThreeSpeedMult = bToggle
    CustomRaceFourSpeedMult = bToggle
    CustomRaceFiveSpeedMult = bToggle
    CustomRaceSixSpeedMult = bToggle
    CustomRaceSevenSpeedMult = bToggle
    CustomRaceEightSpeedMult = bToggle
    CustomRaceNineSpeedMult = bToggle
    CustomRaceTenSpeedMult = bToggle
EndFunction

Function ToggleInfluenceSwitchers(bool bToggle)
    CustomRaceOneInfluence = bToggle
    CustomRaceTwoInfluence = bToggle
    CustomRaceThreeInfluence = bToggle
    CustomRaceFourInfluence = bToggle
    CustomRaceFiveInfluence = bToggle
    CustomRaceSixInfluence = bToggle
    CustomRaceSevenInfluence = bToggle
    CustomRaceEightInfluence = bToggle
    CustomRaceNineInfluence = bToggle
    CustomRaceTenInfluence = bToggle
EndFunction