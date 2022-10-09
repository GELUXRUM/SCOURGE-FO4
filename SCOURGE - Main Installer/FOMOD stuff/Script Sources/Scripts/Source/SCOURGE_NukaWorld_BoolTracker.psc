Scriptname SCOURGE_NukaWorld_BoolTracker Extends Quest
{Tracks boolean values that are managed through the MCM Menu}

Event OnInit()
    Debug.Notification("SCOURGE - Nuka World is up and running")
EndEvent

Group Master
    Bool Property EnableHealth = True Auto
    Bool Property EnableDamageResist = True Auto
    Bool Property EnableEnergyResist = True Auto
    Bool Property EnableSpeedMult = True Auto
    Bool Property EnableInfluence = False Auto
EndGroup


Group Health
    Bool Property AnimatronicAlienHealth = True Auto
    Bool Property AntHealth = True Auto
    Bool Property BloodwormHealth = True Auto
    Bool Property BrahmiluffHealth = True Auto
    Bool Property CricketHealth = True Auto
    Bool Property DeathclawQuantumHealth = True Auto
    Bool Property GatorclawHealth = True Auto
    Bool Property GhoulrillaHealth = True Auto
    Bool Property RatHealth = True Auto
    Bool Property SwarmHealth = True Auto
EndGroup
    
Group DamageResist
    Bool Property AnimatronicAlienDamageResist = True Auto
    Bool Property AntDamageResist = True Auto
    Bool Property BloodwormDamageResist = True Auto
    Bool Property BrahmiluffDamageResist = True Auto
    Bool Property CricketDamageResist = True Auto
    Bool Property DeathclawQuantumDamageResist = True Auto
    Bool Property GatorclawDamageResist = True Auto
    Bool Property GhoulrillaDamageResist = True Auto
    Bool Property RatDamageResist = True Auto
    Bool Property SwarmDamageResist = True Auto
EndGroup

Group EnergyResist
    Bool Property AnimatronicAlienEnergyResist = True Auto
    Bool Property AntEnergyResist = True Auto
    Bool Property BloodwormEnergyResist = True Auto
    Bool Property BrahmiluffEnergyResist = True Auto
    Bool Property CricketEnergyResist = True Auto
    Bool Property DeathclawQuantumEnergyResist = True Auto
    Bool Property GatorclawEnergyResist = True Auto
    Bool Property GhoulrillaEnergyResist = True Auto
    Bool Property RatEnergyResist = True Auto
    Bool Property SwarmEnergyResist = True Auto
EndGroup

Group SpeedMult
    Bool Property AnimatronicAlienSpeedMult = True Auto
    Bool Property AntSpeedMult = True Auto
    Bool Property BloodwormSpeedMult = True Auto
    Bool Property BrahmiluffSpeedMult = True Auto
    Bool Property CricketSpeedMult = True Auto
    Bool Property DeathclawQuantumSpeedMult = True Auto
    Bool Property GatorclawSpeedMult = True Auto
    Bool Property GhoulrillaSpeedMult = True Auto
    Bool Property RatSpeedMult = True Auto
    Bool Property SwarmSpeedMult = True Auto
EndGroup

Group Influence
    Bool Property AnimatronicAlienInfluence = False Auto
    Bool Property AntInfluence = False Auto
    Bool Property BloodwormInfluence = False Auto
    Bool Property BrahmiluffInfluence = False Auto
    Bool Property CricketInfluence = False Auto
    Bool Property DeathclawQuantumInfluence = False Auto
    Bool Property GatorclawInfluence = False Auto
    Bool Property GhoulrillaInfluence = False Auto
    Bool Property RatInfluence = False Auto
    Bool Property SwarmInfluence = False Auto
EndGroup

Function ToggleHealthSwitchers(bool bToggle)
    AnimatronicAlienHealth = bToggle
    AntHealth = bToggle
    BloodwormHealth = bToggle
    BrahmiluffHealth = bToggle
    CricketHealth = bToggle
    DeathclawQuantumHealth = bToggle
    GatorclawHealth = bToggle
    GhoulrillaHealth = bToggle
    RatHealth = bToggle
    SwarmHealth = bToggle
EndFunction

Function ToggleDamageResistSwitchers(bool bToggle)
    AnimatronicAlienDamageResist = bToggle
    AntDamageResist = bToggle
    BloodwormDamageResist = bToggle
    BrahmiluffDamageResist = bToggle
    CricketDamageResist = bToggle
    DeathclawQuantumDamageResist = bToggle
    GatorclawDamageResist = bToggle
    GhoulrillaDamageResist = bToggle
    RatDamageResist = bToggle
    SwarmDamageResist = bToggle
EndFunction

Function ToggleEnergyResistSwitchers(bool bToggle)
    AnimatronicAlienEnergyResist = bToggle
    AntEnergyResist = bToggle
    BloodwormEnergyResist = bToggle
    BrahmiluffEnergyResist = bToggle
    CricketEnergyResist = bToggle
    DeathclawQuantumEnergyResist = bToggle
    GatorclawEnergyResist = bToggle
    GhoulrillaEnergyResist = bToggle
    RatEnergyResist = bToggle
    SwarmEnergyResist = bToggle
EndFunction

Function ToggleSpeedMultSwitchers(bool bToggle)
    AnimatronicAlienSpeedMult = bToggle
    AntSpeedMult = bToggle
    BloodwormSpeedMult = bToggle
    BrahmiluffSpeedMult = bToggle
    CricketSpeedMult = bToggle
    DeathclawQuantumSpeedMult = bToggle
    GatorclawSpeedMult = bToggle
    GhoulrillaSpeedMult = bToggle
    RatSpeedMult = bToggle
    SwarmSpeedMult = bToggle
EndFunction

Function ToggleInfluenceSwitchers(bool bToggle)
    AnimatronicAlienInfluence = bToggle
    AntInfluence = bToggle
    BloodwormInfluence = bToggle
    BrahmiluffInfluence = bToggle
    CricketInfluence = bToggle
    DeathclawQuantumInfluence = bToggle
    GatorclawInfluence = bToggle
    GhoulrillaInfluence = bToggle
    RatInfluence = bToggle
    SwarmInfluence = bToggle
EndFunction