Scriptname SCOURGE_FarHarbor_BoolTracker Extends Quest
{Tracks boolean values that are managed through the MCM Menu}

Event OnInit()
    Debug.Notification("SCOURGE - Far Harbor is up and running")
EndEvent

Group Master
    Bool Property EnableHealth = True Auto
    Bool Property EnableDamageResist = True Auto
    Bool Property EnableEnergyResist = True Auto
    Bool Property EnableSpeedMult = True Auto
    Bool Property EnableInfluence = False Auto
EndGroup


Group Health
    Bool Property AnglerHealth = True Auto
    Bool Property ChickenHealth = True Auto
    Bool Property FogCrawlerHealth = True Auto
    Bool Property GulperHealth = True Auto
    Bool Property GulperDevourerHealth = True Auto
    Bool Property GulperYoungHealth = True Auto
    Bool Property HermitCrabHealth = True Auto
    Bool Property RabbitHealth = True Auto
    Bool Property WolfHealth = True Auto
EndGroup
    
Group DamageResist
    Bool Property AnglerDamageResist = True Auto
    Bool Property ChickenDamageResist = True Auto
    Bool Property FogCrawlerDamageResist = True Auto
    Bool Property GulperDamageResist = True Auto
    Bool Property GulperDevourerDamageResist = True Auto
    Bool Property GulperYoungDamageResist = True Auto
    Bool Property HermitCrabDamageResist = True Auto
    Bool Property RabbitDamageResist = True Auto
    Bool Property WolfDamageResist = True Auto
EndGroup

Group EnergyResist
    Bool Property AnglerEnergyResist = True Auto
    Bool Property ChickenEnergyResist = True Auto
    Bool Property FogCrawlerEnergyResist = True Auto
    Bool Property GulperEnergyResist = True Auto
    Bool Property GulperDevourerEnergyResist = True Auto
    Bool Property GulperYoungEnergyResist = True Auto
    Bool Property HermitCrabEnergyResist = True Auto
    Bool Property RabbitEnergyResist = True Auto
    Bool Property WolfEnergyResist = True Auto
EndGroup

Group SpeedMult
    Bool Property AnglerSpeedMult = True Auto
    Bool Property ChickenSpeedMult = True Auto
    Bool Property FogCrawlerSpeedMult = True Auto
    Bool Property GulperSpeedMult = True Auto
    Bool Property GulperDevourerSpeedMult = True Auto
    Bool Property GulperYoungSpeedMult = True Auto
    Bool Property HermitCrabSpeedMult = True Auto
    Bool Property RabbitSpeedMult = True Auto
    Bool Property WolfSpeedMult = True Auto
EndGroup

Group Influence
    Bool Property AnglerInfluence = False Auto
    Bool Property ChickenInfluence = False Auto
    Bool Property FogCrawlerInfluence = False Auto
    Bool Property GulperInfluence = False Auto
    Bool Property GulperDevourerInfluence = True Auto
    Bool Property GulperYoungInfluence = False Auto
    Bool Property HermitCrabInfluence = False Auto
    Bool Property RabbitInfluence = False Auto
    Bool Property WolfInfluence = False Auto
EndGroup

Function ToggleHealthSwitchers(bool bToggle)
    AnglerHealth = bToggle
    ChickenHealth = bToggle
    FogCrawlerHealth = bToggle
    GulperHealth = bToggle
    GulperDevourerHealth = bToggle
    GulperYoungHealth = bToggle
    HermitCrabHealth = bToggle
    RabbitHealth = bToggle
    WolfHealth = bToggle
EndFunction

Function ToggleDamageResistSwitchers(bool bToggle)
    AnglerDamageResist = bToggle
    ChickenDamageResist = bToggle
    FogCrawlerDamageResist = bToggle
    GulperDamageResist = bToggle
    GulperDevourerDamageResist = bToggle
    GulperYoungDamageResist = bToggle
    HermitCrabDamageResist = bToggle
    RabbitDamageResist = bToggle
    WolfDamageResist = bToggle
EndFunction

Function ToggleEnergyResistSwitchers(bool bToggle)
    AnglerEnergyResist = bToggle
    ChickenEnergyResist = bToggle
    FogCrawlerEnergyResist = bToggle
    GulperEnergyResist = bToggle
    GulperDevourerEnergyResist = bToggle
    GulperYoungEnergyResist = bToggle
    HermitCrabEnergyResist = bToggle
    RabbitEnergyResist = bToggle
    WolfEnergyResist = bToggle
EndFunction

Function ToggleSpeedMultSwitchers(bool bToggle)
    AnglerSpeedMult = bToggle
    ChickenSpeedMult = bToggle
    FogCrawlerSpeedMult = bToggle
    GulperSpeedMult = bToggle
    GulperDevourerSpeedMult = bToggle
    GulperYoungSpeedMult = bToggle
    HermitCrabSpeedMult = bToggle
    RabbitSpeedMult = bToggle
    WolfSpeedMult = bToggle
EndFunction

Function ToggleInfluenceSwitchers(bool bToggle)
    AnglerInfluence = bToggle
    ChickenInfluence = bToggle
    FogCrawlerInfluence = bToggle
    GulperInfluence = bToggle
    GulperDevourerInfluence = bToggle
    GulperYoungInfluence = bToggle
    HermitCrabInfluence = bToggle
    RabbitInfluence = bToggle
    WolfInfluence = bToggle
EndFunction