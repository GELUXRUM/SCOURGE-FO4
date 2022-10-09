Scriptname SCOURGE_MutantMenagerie_BoolTracker Extends Quest
{Tracks boolean values that are managed through the MCM Menu}

Event OnInit()
    Debug.Notification("SCOURGE - Mutant Menagerie is up and running")
EndEvent

Group Master
    Bool Property EnableHealth = True Auto
    Bool Property EnableDamageResist = True Auto
    Bool Property EnableEnergyResist = True Auto
    Bool Property EnableSpeedMult = True Auto
    Bool Property EnableInfluence = False Auto
EndGroup


Group Health
    Bool Property RadSquirrelHealth = True Auto
    Bool Property RadcoonHealth = True Auto
    Bool Property BeeswarmHealth = True Auto
    Bool Property BobcatHealth = True Auto
    Bool Property BeaverHealth = True Auto
    Bool Property PheasantHealth = True Auto
    Bool Property HoneybeeHealth = True Auto
    Bool Property LeechHealth = True Auto
    Bool Property SkunkHealth = True Auto
    Bool Property IguanaHealth = True Auto
    Bool Property CatfishHealth = True Auto
    Bool Property OpossumHealth = True Auto
    Bool Property WhaleHealth = True Auto
    Bool Property DuckHealth = True Auto
    Bool Property TurkeyHealth = True Auto
    Bool Property SquidHealth = True Auto
    Bool Property GargoyleHealth = True Auto
    Bool Property GoatHealth = True Auto
    Bool Property LadybugHealth = True Auto
    Bool Property SpiderHealth = True Auto
    Bool Property OwlHealth = True Auto
    Bool Property BoarHealth = True Auto
    Bool Property Ladybug2Health = True Auto
    Bool Property KatydidHealth = True Auto
    Bool Property PirahnaHealth = True Auto
    Bool Property RadsnakeHealth = True Auto
    Bool Property RadtoadHealth = True Auto
    Bool Property GooseHealth = True Auto
    Bool Property LoonHealth = True Auto
    Bool Property WanamingoHealth = True Auto
    Bool Property MuskratHealth = True Auto
    Bool Property SharkHealth = True Auto
    Bool Property DolphinHealth = True Auto
    Bool Property FoxHealth = True Auto
EndGroup
    
Group DamageResist
    Bool Property RadSquirrelDamageResist = True Auto
    Bool Property RadcoonDamageResist = True Auto
    Bool Property BeeswarmDamageResist = True Auto
    Bool Property BobcatDamageResist = True Auto
    Bool Property BeaverDamageResist = True Auto
    Bool Property PheasantDamageResist = True Auto
    Bool Property HoneybeeDamageResist = True Auto
    Bool Property LeechDamageResist = True Auto
    Bool Property SkunkDamageResist = True Auto
    Bool Property IguanaDamageResist = True Auto
    Bool Property CatfishDamageResist = True Auto
    Bool Property OpossumDamageResist = True Auto
    Bool Property WhaleDamageResist = True Auto
    Bool Property DuckDamageResist = True Auto
    Bool Property TurkeyDamageResist = True Auto
    Bool Property SquidDamageResist = True Auto
    Bool Property GargoyleDamageResist = True Auto
    Bool Property GoatDamageResist = True Auto
    Bool Property LadybugDamageResist = True Auto
    Bool Property SpiderDamageResist = True Auto
    Bool Property OwlDamageResist = True Auto
    Bool Property BoarDamageResist = True Auto
    Bool Property Ladybug2DamageResist = True Auto
    Bool Property KatydidDamageResist = True Auto
    Bool Property PirahnaDamageResist = True Auto
    Bool Property RadsnakeDamageResist = True Auto
    Bool Property RadtoadDamageResist = True Auto
    Bool Property GooseDamageResist = True Auto
    Bool Property LoonDamageResist = True Auto
    Bool Property WanamingoDamageResist = True Auto
    Bool Property MuskratDamageResist = True Auto
    Bool Property SharkDamageResist = True Auto
    Bool Property DolphinDamageResist = True Auto
    Bool Property FoxDamageResist = True Auto
EndGroup

Group EnergyResist
    Bool Property RadSquirrelEnergyResist = True Auto
    Bool Property RadcoonEnergyResist = True Auto
    Bool Property BeeswarmEnergyResist = True Auto
    Bool Property BobcatEnergyResist = True Auto
    Bool Property BeaverEnergyResist = True Auto
    Bool Property PheasantEnergyResist = True Auto
    Bool Property HoneybeeEnergyResist = True Auto
    Bool Property LeechEnergyResist = True Auto
    Bool Property SkunkEnergyResist = True Auto
    Bool Property IguanaEnergyResist = True Auto
    Bool Property CatfishEnergyResist = True Auto
    Bool Property OpossumEnergyResist = True Auto
    Bool Property WhaleEnergyResist = True Auto
    Bool Property DuckEnergyResist = True Auto
    Bool Property TurkeyEnergyResist = True Auto
    Bool Property SquidEnergyResist = True Auto
    Bool Property GargoyleEnergyResist = True Auto
    Bool Property GoatEnergyResist = True Auto
    Bool Property LadybugEnergyResist = True Auto
    Bool Property SpiderEnergyResist = True Auto
    Bool Property OwlEnergyResist = True Auto
    Bool Property BoarEnergyResist = True Auto
    Bool Property Ladybug2EnergyResist = True Auto
    Bool Property KatydidEnergyResist = True Auto
    Bool Property PirahnaEnergyResist = True Auto
    Bool Property RadsnakeEnergyResist = True Auto
    Bool Property RadtoadEnergyResist = True Auto
    Bool Property GooseEnergyResist = True Auto
    Bool Property LoonEnergyResist = True Auto
    Bool Property WanamingoEnergyResist = True Auto
    Bool Property MuskratEnergyResist = True Auto
    Bool Property SharkEnergyResist = True Auto
    Bool Property DolphinEnergyResist = True Auto
    Bool Property FoxEnergyResist = True Auto
EndGroup

Group SpeedMult
    Bool Property RadSquirrelSpeedMult = True Auto
    Bool Property RadcoonSpeedMult = True Auto
    Bool Property BeeswarmSpeedMult = True Auto
    Bool Property BobcatSpeedMult = True Auto
    Bool Property BeaverSpeedMult = True Auto
    Bool Property PheasantSpeedMult = True Auto
    Bool Property HoneybeeSpeedMult = True Auto
    Bool Property LeechSpeedMult = True Auto
    Bool Property SkunkSpeedMult = True Auto
    Bool Property IguanaSpeedMult = True Auto
    Bool Property CatfishSpeedMult = True Auto
    Bool Property OpossumSpeedMult = True Auto
    Bool Property WhaleSpeedMult = True Auto
    Bool Property DuckSpeedMult = True Auto
    Bool Property TurkeySpeedMult = True Auto
    Bool Property SquidSpeedMult = True Auto
    Bool Property GargoyleSpeedMult = True Auto
    Bool Property GoatSpeedMult = True Auto
    Bool Property LadybugSpeedMult = True Auto
    Bool Property SpiderSpeedMult = True Auto
    Bool Property OwlSpeedMult = True Auto
    Bool Property BoarSpeedMult = True Auto
    Bool Property Ladybug2SpeedMult = True Auto
    Bool Property KatydidSpeedMult = True Auto
    Bool Property PirahnaSpeedMult = True Auto
    Bool Property RadsnakeSpeedMult = True Auto
    Bool Property RadtoadSpeedMult = True Auto
    Bool Property GooseSpeedMult = True Auto
    Bool Property LoonSpeedMult = True Auto
    Bool Property WanamingoSpeedMult = True Auto
    Bool Property MuskratSpeedMult = True Auto
    Bool Property SharkSpeedMult = True Auto
    Bool Property DolphinSpeedMult = True Auto
    Bool Property FoxSpeedMult = True Auto
EndGroup

Group Influence
    Bool Property RadSquirrelInfluence = False Auto
    Bool Property RadcoonInfluence = False Auto
    Bool Property BeeswarmInfluence = False Auto
    Bool Property BobcatInfluence = False Auto
    Bool Property BeaverInfluence = False Auto
    Bool Property PheasantInfluence = False Auto
    Bool Property HoneybeeInfluence = False Auto
    Bool Property LeechInfluence = False Auto
    Bool Property SkunkInfluence = False Auto
    Bool Property IguanaInfluence = False Auto
    Bool Property CatfishInfluence = False Auto
    Bool Property OpossumInfluence = False Auto
    Bool Property WhaleInfluence = False Auto
    Bool Property DuckInfluence = False Auto
    Bool Property TurkeyInfluence = False Auto
    Bool Property SquidInfluence = False Auto
    Bool Property GargoyleInfluence = False Auto
    Bool Property GoatInfluence = False Auto
    Bool Property LadybugInfluence = False Auto
    Bool Property SpiderInfluence = False Auto
    Bool Property OwlInfluence = False Auto
    Bool Property BoarInfluence = False Auto
    Bool Property Ladybug2Influence = False Auto
    Bool Property KatydidInfluence = False Auto
    Bool Property PirahnaInfluence = False Auto
    Bool Property RadsnakeInfluence = False Auto
    Bool Property RadtoadInfluence = False Auto
    Bool Property GooseInfluence = False Auto
    Bool Property LoonInfluence = False Auto
    Bool Property WanamingoInfluence = False Auto
    Bool Property MuskratInfluence = False Auto
    Bool Property SharkInfluence = False Auto
    Bool Property DolphinInfluence = False Auto
    Bool Property FoxInfluence = False Auto
EndGroup

Function ToggleHealthSwitchers(bool bToggle)
    RadSquirrelHealth = bToggle
    RadcoonHealth = bToggle
    BeeswarmHealth = bToggle
    BobcatHealth = bToggle
    BeaverHealth = bToggle
    PheasantHealth = bToggle
    HoneybeeHealth = bToggle
    LeechHealth = bToggle
    SkunkHealth = bToggle
    IguanaHealth = bToggle
    CatfishHealth = bToggle
    OpossumHealth = bToggle
    WhaleHealth = bToggle
    DuckHealth = bToggle
    TurkeyHealth = bToggle
    SquidHealth = bToggle
    GargoyleHealth = bToggle
    GoatHealth = bToggle
    LadybugHealth = bToggle
    SpiderHealth = bToggle
    OwlHealth = bToggle
    BoarHealth = bToggle
    Ladybug2Health = bToggle
    KatydidHealth = bToggle
    PirahnaHealth = bToggle
    RadsnakeHealth = bToggle
    RadtoadHealth = bToggle
    GooseHealth = bToggle
    LoonHealth = bToggle
    WanamingoHealth = bToggle
    MuskratHealth = bToggle
    SharkHealth = bToggle
    DolphinHealth = bToggle
    FoxHealth = bToggle
EndFunction

Function ToggleDamageResistSwitchers(bool bToggle)
    RadSquirrelDamageResist = bToggle
    RadcoonDamageResist = bToggle
    BeeswarmDamageResist = bToggle
    BobcatDamageResist = bToggle
    BeaverDamageResist = bToggle
    PheasantDamageResist = bToggle
    HoneybeeDamageResist = bToggle
    LeechDamageResist = bToggle
    SkunkDamageResist = bToggle
    IguanaDamageResist = bToggle
    CatfishDamageResist = bToggle
    OpossumDamageResist = bToggle
    WhaleDamageResist = bToggle
    DuckDamageResist = bToggle
    TurkeyDamageResist = bToggle
    SquidDamageResist = bToggle
    GargoyleDamageResist = bToggle
    GoatDamageResist = bToggle
    LadybugDamageResist = bToggle
    SpiderDamageResist = bToggle
    OwlDamageResist = bToggle
    BoarDamageResist = bToggle
    Ladybug2DamageResist = bToggle
    KatydidDamageResist = bToggle
    PirahnaDamageResist = bToggle
    RadsnakeDamageResist = bToggle
    RadtoadDamageResist = bToggle
    GooseDamageResist = bToggle
    LoonDamageResist = bToggle
    WanamingoDamageResist = bToggle
    MuskratDamageResist = bToggle
    SharkDamageResist = bToggle
    DolphinDamageResist = bToggle
    FoxDamageResist = bToggle
EndFunction

Function ToggleEnergyResistSwitchers(bool bToggle)
    RadSquirrelEnergyResist = bToggle
    RadcoonEnergyResist = bToggle
    BeeswarmEnergyResist = bToggle
    BobcatEnergyResist = bToggle
    BeaverEnergyResist = bToggle
    PheasantEnergyResist = bToggle
    HoneybeeEnergyResist = bToggle
    LeechEnergyResist = bToggle
    SkunkEnergyResist = bToggle
    IguanaEnergyResist = bToggle
    CatfishEnergyResist = bToggle
    OpossumEnergyResist = bToggle
    WhaleEnergyResist = bToggle
    DuckEnergyResist = bToggle
    TurkeyEnergyResist = bToggle
    SquidEnergyResist = bToggle
    GargoyleEnergyResist = bToggle
    GoatEnergyResist = bToggle
    LadybugEnergyResist = bToggle
    SpiderEnergyResist = bToggle
    OwlEnergyResist = bToggle
    BoarEnergyResist = bToggle
    Ladybug2EnergyResist = bToggle
    KatydidEnergyResist = bToggle
    PirahnaEnergyResist = bToggle
    RadsnakeEnergyResist = bToggle
    RadtoadEnergyResist = bToggle
    GooseEnergyResist = bToggle
    LoonEnergyResist = bToggle
    WanamingoEnergyResist = bToggle
    MuskratEnergyResist = bToggle
    SharkEnergyResist = bToggle
    DolphinEnergyResist = bToggle
    FoxEnergyResist = bToggle
EndFunction

Function ToggleSpeedMultSwitchers(bool bToggle)
    RadSquirrelSpeedMult = bToggle
    RadcoonSpeedMult = bToggle
    BeeswarmSpeedMult = bToggle
    BobcatSpeedMult = bToggle
    BeaverSpeedMult = bToggle
    PheasantSpeedMult = bToggle
    HoneybeeSpeedMult = bToggle
    LeechSpeedMult = bToggle
    SkunkSpeedMult = bToggle
    IguanaSpeedMult = bToggle
    CatfishSpeedMult = bToggle
    OpossumSpeedMult = bToggle
    WhaleSpeedMult = bToggle
    DuckSpeedMult = bToggle
    TurkeySpeedMult = bToggle
    SquidSpeedMult = bToggle
    GargoyleSpeedMult = bToggle
    GoatSpeedMult = bToggle
    LadybugSpeedMult = bToggle
    SpiderSpeedMult = bToggle
    OwlSpeedMult = bToggle
    BoarSpeedMult = bToggle
    Ladybug2SpeedMult = bToggle
    KatydidSpeedMult = bToggle
    PirahnaSpeedMult = bToggle
    RadsnakeSpeedMult = bToggle
    RadtoadSpeedMult = bToggle
    GooseSpeedMult = bToggle
    LoonSpeedMult = bToggle
    WanamingoSpeedMult = bToggle
    MuskratSpeedMult = bToggle
    SharkSpeedMult = bToggle
    DolphinSpeedMult = bToggle
    FoxSpeedMult = bToggle
EndFunction

Function ToggleInfluenceSwitchers(bool bToggle)
    RadSquirrelInfluence = bToggle
    RadcoonInfluence = bToggle
    BeeswarmInfluence = bToggle
    BobcatInfluence = bToggle
    BeaverInfluence = bToggle
    PheasantInfluence = bToggle
    HoneybeeInfluence = bToggle
    LeechInfluence = bToggle
    SkunkInfluence = bToggle
    IguanaInfluence = bToggle
    CatfishInfluence = bToggle
    OpossumInfluence = bToggle
    WhaleInfluence = bToggle
    DuckInfluence = bToggle
    TurkeyInfluence = bToggle
    SquidInfluence = bToggle
    GargoyleInfluence = bToggle
    GoatInfluence = bToggle
    LadybugInfluence = bToggle
    SpiderInfluence = bToggle
    OwlInfluence = bToggle
    BoarInfluence = bToggle
    Ladybug2Influence = bToggle
    KatydidInfluence = bToggle
    PirahnaInfluence = bToggle
    RadsnakeInfluence = bToggle
    RadtoadInfluence = bToggle
    GooseInfluence = bToggle
    LoonInfluence = bToggle
    WanamingoInfluence = bToggle
    MuskratInfluence = bToggle
    SharkInfluence = bToggle
    DolphinInfluence = bToggle
    FoxInfluence = bToggle
EndFunction