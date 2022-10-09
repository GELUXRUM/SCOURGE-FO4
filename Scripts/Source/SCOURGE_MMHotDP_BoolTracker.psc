Scriptname SCOURGE_MMHotDP_BoolTracker Extends Quest
{Tracks boolean values that are managed through the MCM Menu}

Event OnInit()
    Debug.Notification("SCOURGE - Horrors of the Deep Fog is up and running")
EndEvent

Group Master
    Bool Property EnableHealth = True Auto
    Bool Property EnableDamageResist = True Auto
    Bool Property EnableEnergyResist = True Auto
    Bool Property EnableSpeedMult = True Auto
    Bool Property EnableInfluence = False Auto
EndGroup


Group Health
    Bool Property BarracudaHealth = True Auto
    Bool Property BobtailHealth = True Auto
    Bool Property BottomfeederHealth = True Auto
    Bool Property CrayfishHealth = True Auto
    Bool Property FloaterHealth = True Auto
    Bool Property JellyfishHealth = True Auto
    Bool Property KrakenHealth = True Auto
    Bool Property OctopusHealth = True Auto
    Bool Property SeaTurtleHealth = True Auto
    Bool Property SharkHybridHealth = True Auto
    Bool Property StingrayHealth = True Auto
    Bool Property TickHealth = True Auto
    Bool Property WendigoHealth = True Auto
EndGroup
    
Group DamageResist
    Bool Property BarracudaDamageResist = True Auto
    Bool Property BobtailDamageResist = True Auto
    Bool Property BottomfeederDamageResist = True Auto
    Bool Property CrayfishDamageResist = True Auto
    Bool Property FloaterDamageResist = True Auto
    Bool Property JellyfishDamageResist = True Auto
    Bool Property KrakenDamageResist = True Auto
    Bool Property OctopusDamageResist = True Auto
    Bool Property SeaTurtleDamageResist = True Auto
    Bool Property SharkHybridDamageResist = True Auto
    Bool Property StingrayDamageResist = True Auto
    Bool Property TickDamageResist = True Auto
    Bool Property WendigoDamageResist = True Auto
EndGroup

Group EnergyResist
    Bool Property BarracudaEnergyResist = True Auto
    Bool Property BobtailEnergyResist = True Auto
    Bool Property BottomfeederEnergyResist = True Auto
    Bool Property CrayfishEnergyResist = True Auto
    Bool Property FloaterEnergyResist = True Auto
    Bool Property JellyfishEnergyResist = True Auto
    Bool Property KrakenEnergyResist = True Auto
    Bool Property OctopusEnergyResist = True Auto
    Bool Property SeaTurtleEnergyResist = True Auto
    Bool Property SharkHybridEnergyResist = True Auto
    Bool Property StingrayEnergyResist = True Auto
    Bool Property TickEnergyResist = True Auto
    Bool Property WendigoEnergyResist = True Auto
EndGroup

Group SpeedMult
    Bool Property BarracudaSpeedMult = True Auto
    Bool Property BobtailSpeedMult = True Auto
    Bool Property BottomfeederSpeedMult = True Auto
    Bool Property CrayfishSpeedMult = True Auto
    Bool Property FloaterSpeedMult = True Auto
    Bool Property JellyfishSpeedMult = True Auto
    Bool Property KrakenSpeedMult = True Auto
    Bool Property OctopusSpeedMult = True Auto
    Bool Property SeaTurtleSpeedMult = True Auto
    Bool Property SharkHybridSpeedMult = True Auto
    Bool Property StingraySpeedMult = True Auto
    Bool Property TickSpeedMult = True Auto
    Bool Property WendigoSpeedMult = True Auto
EndGroup

Group Influence
    Bool Property BarracudaInfluence = False Auto
    Bool Property BobtailInfluence = False Auto
    Bool Property BottomfeederInfluence = False Auto
    Bool Property CrayfishInfluence = False Auto
    Bool Property FloaterInfluence = False Auto
    Bool Property JellyfishInfluence = False Auto
    Bool Property KrakenInfluence = False Auto
    Bool Property OctopusInfluence = False Auto
    Bool Property SeaTurtleInfluence = False Auto
    Bool Property SharkHybridInfluence = False Auto
    Bool Property StingrayInfluence = False Auto
    Bool Property TickInfluence = False Auto
    Bool Property WendigoInfluence = False Auto
EndGroup

Function ToggleHealthSwitchers(bool bToggle)
    BarracudaHealth = bToggle
    BobtailHealth = bToggle
    BottomfeederHealth = bToggle
    CrayfishHealth = bToggle
    FloaterHealth = bToggle
    JellyfishHealth = bToggle
    KrakenHealth = bToggle
    OctopusHealth = bToggle
    SeaTurtleHealth = bToggle
    SharkHybridHealth = bToggle
    StingrayHealth = bToggle
    TickHealth = bToggle
    WendigoHealth = bToggle
EndFunction

Function ToggleDamageResistSwitchers(bool bToggle)
    BarracudaDamageResist = bToggle
    BobtailDamageResist = bToggle
    BottomfeederDamageResist = bToggle
    CrayfishDamageResist = bToggle
    FloaterDamageResist = bToggle
    JellyfishDamageResist = bToggle
    KrakenDamageResist = bToggle
    OctopusDamageResist = bToggle
    SeaTurtleDamageResist = bToggle
    SharkHybridDamageResist = bToggle
    StingrayDamageResist = bToggle
    TickDamageResist = bToggle
    WendigoDamageResist = bToggle
EndFunction

Function ToggleEnergyResistSwitchers(bool bToggle)
    BarracudaEnergyResist = bToggle
    BobtailEnergyResist = bToggle
    BottomfeederEnergyResist = bToggle
    CrayfishEnergyResist = bToggle
    FloaterEnergyResist = bToggle
    JellyfishEnergyResist = bToggle
    KrakenEnergyResist = bToggle
    OctopusEnergyResist = bToggle
    SeaTurtleEnergyResist = bToggle
    SharkHybridEnergyResist = bToggle
    StingrayEnergyResist = bToggle
    TickEnergyResist = bToggle
    WendigoEnergyResist = bToggle
EndFunction

Function ToggleSpeedMultSwitchers(bool bToggle)
    BarracudaSpeedMult = bToggle
    BobtailSpeedMult = bToggle
    BottomfeederSpeedMult = bToggle
    CrayfishSpeedMult = bToggle
    FloaterSpeedMult = bToggle
    JellyfishSpeedMult = bToggle
    KrakenSpeedMult = bToggle
    OctopusSpeedMult = bToggle
    SeaTurtleSpeedMult = bToggle
    SharkHybridSpeedMult = bToggle
    StingraySpeedMult = bToggle
    TickSpeedMult = bToggle
    WendigoSpeedMult = bToggle
EndFunction

Function ToggleInfluenceSwitchers(bool bToggle)
    BarracudaInfluence = bToggle
    BobtailInfluence = bToggle
    BottomfeederInfluence = bToggle
    CrayfishInfluence = bToggle
    FloaterInfluence = bToggle
    JellyfishInfluence = bToggle
    KrakenInfluence = bToggle
    OctopusInfluence = bToggle
    SeaTurtleInfluence = bToggle
    SharkHybridInfluence = bToggle
    StingrayInfluence = bToggle
    TickInfluence = bToggle
    WendigoInfluence = bToggle
EndFunction