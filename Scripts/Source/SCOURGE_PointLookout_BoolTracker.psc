Scriptname SCOURGE_PointLookout_BoolTracker Extends Quest
{Tracks boolean values that are managed through the MCM Menu}

Event OnInit()
    Debug.Notification("SCOURGE - Point Lookout is up and running")
EndEvent

Group Master
    Bool Property EnableHealth = True Auto
    Bool Property EnableDamageResist = True Auto
    Bool Property EnableEnergyResist = True Auto
    Bool Property EnableSpeedMult = True Auto
    Bool Property EnableInfluence = False Auto
EndGroup


Group Health
    Bool Property ChickenHealth = True Auto
    Bool Property FrogHealth = True Auto
    Bool Property SwampfolkLargeHealth = True Auto
    Bool Property SwampfolkMediumHealth = True Auto
    Bool Property SwampfolkSmallHealth = True Auto
    Bool Property SwamplurkQueenHealth = True Auto
EndGroup
    
Group DamageResist
    Bool Property ChickenDamageResist = True Auto
    Bool Property FrogDamageResist = True Auto
    Bool Property SwampfolkLargeDamageResist = True Auto
    Bool Property SwampfolkMediumDamageResist = True Auto
    Bool Property SwampfolkSmallDamageResist = True Auto
    Bool Property SwamplurkQueenDamageResist = True Auto
EndGroup

Group EnergyResist
    Bool Property ChickenEnergyResist = True Auto
    Bool Property FrogEnergyResist = True Auto
    Bool Property SwampfolkLargeEnergyResist = True Auto
    Bool Property SwampfolkMediumEnergyResist = True Auto
    Bool Property SwampfolkSmallEnergyResist = True Auto
    Bool Property SwamplurkQueenEnergyResist = True Auto
EndGroup

Group SpeedMult
    Bool Property ChickenSpeedMult = True Auto
    Bool Property FrogSpeedMult = True Auto
    Bool Property SwampfolkLargeSpeedMult = True Auto
    Bool Property SwampfolkMediumSpeedMult = True Auto
    Bool Property SwampfolkSmallSpeedMult = True Auto
    Bool Property SwamplurkQueenSpeedMult = True Auto
EndGroup

Group Influence
    Bool Property ChickenInfluence = False Auto
    Bool Property FrogInfluence = False Auto
    Bool Property SwampfolkLargeInfluence = False Auto
    Bool Property SwampfolkMediumInfluence = False Auto
    Bool Property SwampfolkSmallInfluence = False Auto
    Bool Property SwamplurkQueenInfluence = False Auto
EndGroup

Function ToggleHealthSwitchers(bool bToggle)
    ChickenHealth = bToggle
    FrogHealth = bToggle
    SwampfolkLargeHealth = bToggle
    SwampfolkMediumHealth = bToggle
    SwampfolkSmallHealth = bToggle
    SwamplurkQueenHealth = bToggle
EndFunction

Function ToggleDamageResistSwitchers(bool bToggle)
    ChickenDamageResist = bToggle
    FrogDamageResist = bToggle
    SwampfolkLargeDamageResist = bToggle
    SwampfolkMediumDamageResist = bToggle
    SwampfolkSmallDamageResist = bToggle
    SwamplurkQueenDamageResist = bToggle
EndFunction

Function ToggleEnergyResistSwitchers(bool bToggle)
    ChickenEnergyResist = bToggle
    FrogEnergyResist = bToggle
    SwampfolkLargeEnergyResist = bToggle
    SwampfolkMediumEnergyResist = bToggle
    SwampfolkSmallEnergyResist = bToggle
    SwamplurkQueenEnergyResist = bToggle
EndFunction

Function ToggleSpeedMultSwitchers(bool bToggle)
    ChickenSpeedMult = bToggle
    FrogSpeedMult = bToggle
    SwampfolkLargeSpeedMult = bToggle
    SwampfolkMediumSpeedMult = bToggle
    SwampfolkSmallSpeedMult = bToggle
    SwamplurkQueenSpeedMult = bToggle
EndFunction

Function ToggleInfluenceSwitchers(bool bToggle)
    ChickenInfluence = bToggle
    FrogInfluence = bToggle
    SwampfolkLargeInfluence = bToggle
    SwampfolkMediumInfluence = bToggle
    SwampfolkSmallInfluence = bToggle
    SwamplurkQueenInfluence = bToggle
EndFunction