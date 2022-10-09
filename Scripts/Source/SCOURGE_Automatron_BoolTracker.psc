Scriptname SCOURGE_Automatron_BoolTracker Extends Quest
{Tracks boolean values that are managed through the MCM Menu}

Event OnInit()
    Debug.Notification("SCOURGE - Automatron is up and running")
EndEvent

Group Health
    Bool Property RobobrainHealth = True Auto
EndGroup
    
Group DamageResist
    Bool Property RobobrainDamageResist = True Auto
EndGroup

Group EnergyResist
    Bool Property RobobrainEnergyResist = True Auto
EndGroup

Group SpeedMult
    Bool Property RobobrainSpeedMult = True Auto
EndGroup

Group Influence
    Bool Property RobobrainInfluence = False Auto
EndGroup