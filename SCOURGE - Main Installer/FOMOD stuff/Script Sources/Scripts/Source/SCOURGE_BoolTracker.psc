Scriptname SCOURGE_BoolTracker Extends Quest
{Tracks boolean values that are managed through the MCM Menu}

Event OnInit()
    Debug.Notification("SCOURGE is up and running")
EndEvent

Group Master
    Bool Property EnableSCOURGE = True Auto
    Bool Property EnableHealth = True Auto
    Bool Property EnableDamageResist = True Auto
    Bool Property EnableEnergyResist = True Auto
    Bool Property EnableSpeedMult = True Auto
    Bool Property EnableInfluence = False Auto
EndGroup

Group Health
    Bool Property AlienHealth = True Auto
    Bool Property AssaultronHealth = True Auto
    Bool Property BehemothHealth = True Auto
    Bool Property BloatflyHealth = True Auto
    Bool Property BloodbugHealth = True Auto
    Bool Property BrahminHealth = True Auto
    Bool Property CatHealth = True Auto
    Bool Property DeathclawHealth = True Auto
    Bool Property DogRaiderHealth = True Auto
    Bool Property DogViciousHealth = True Auto
    Bool Property EyebotHealth = True Auto
    Bool Property FeralHealth = True Auto
    Bool Property FeralGlowingHealth = True Auto
    Bool Property GorillaHealth = True Auto
    Bool Property HumanHealth = True Auto
    Bool Property MirelurkHealth = True Auto
    Bool Property MirelurkHunterHealth = True Auto
    Bool Property MirelurkKingHealth = True Auto
    Bool Property MirelurkQueenHealth = True Auto
    Bool Property MoleratHealth = True Auto
    Bool Property MrHandyHealth = True Auto
    Bool Property MutantHoundHealth = True Auto
    Bool Property ProtectronHealth = True Auto
    Bool Property RadroachHealth = True Auto
    Bool Property RadscorpionHealth = True Auto
    Bool Property RadstagHealth = True Auto
    Bool Property SentryBotHealth = True Auto
    Bool Property StingwingHealth = True Auto
    Bool Property SuperMutantHealth = True Auto
    Bool Property SynthCourserHealth = True Auto
    Bool Property SynthGen1Health = True Auto
    Bool Property SynthGen2Health = True Auto
    Bool Property TurretBubbleHealth = True Auto
    Bool Property TurretTripodHealth = True Auto
    Bool Property VertibirdHealth = True Auto
    Bool Property YaoGuaiHealth = True Auto
EndGroup
    
Group DamageResist
    Bool Property AlienDamageResist = True Auto
    Bool Property AssaultronDamageResist = True Auto
    Bool Property BehemothDamageResist = True Auto
    Bool Property BloatflyDamageResist = True Auto
    Bool Property BloodbugDamageResist = True Auto
    Bool Property BrahminDamageResist = True Auto
    Bool Property CatDamageResist = True Auto
    Bool Property DeathclawDamageResist = True Auto
    Bool Property DogRaiderDamageResist = True Auto
    Bool Property DogViciousDamageResist = True Auto
    Bool Property EyebotDamageResist = True Auto
    Bool Property FeralDamageResist = True Auto
    Bool Property FeralGlowingDamageResist = True Auto
    Bool Property GorillaDamageResist = True Auto
    Bool Property HumanDamageResist = True Auto
    Bool Property MirelurkDamageResist = True Auto
    Bool Property MirelurkHunterDamageResist = True Auto
    Bool Property MirelurkKingDamageResist = True Auto
    Bool Property MirelurkQueenDamageResist = True Auto
    Bool Property MoleratDamageResist = True Auto
    Bool Property MrHandyDamageResist = True Auto
    Bool Property MutantHoundDamageResist = True Auto
    Bool Property ProtectronDamageResist = True Auto
    Bool Property RadroachDamageResist = True Auto
    Bool Property RadscorpionDamageResist = True Auto
    Bool Property RadstagDamageResist = True Auto
    Bool Property SentryBotDamageResist = True Auto
    Bool Property StingwingDamageResist = True Auto
    Bool Property SuperMutantDamageResist = True Auto
    Bool Property SynthCourserDamageResist = True Auto
    Bool Property SynthGen1DamageResist = True Auto
    Bool Property SynthGen2DamageResist = True Auto
    Bool Property TurretBubbleDamageResist = True Auto
    Bool Property TurretTripodDamageResist = True Auto
    Bool Property VertibirdDamageResist = True Auto
    Bool Property YaoGuaiDamageResist = True Auto
EndGroup

Group EnergyResist
    Bool Property AlienEnergyResist = True Auto
    Bool Property AssaultronEnergyResist = True Auto
    Bool Property BehemothEnergyResist = True Auto
    Bool Property BloatflyEnergyResist = True Auto
    Bool Property BloodbugEnergyResist = True Auto
    Bool Property BrahminEnergyResist = True Auto
    Bool Property CatEnergyResist = True Auto
    Bool Property DeathclawEnergyResist = True Auto
    Bool Property DogRaiderEnergyResist = True Auto
    Bool Property DogViciousEnergyResist = True Auto
    Bool Property EyebotEnergyResist = True Auto
    Bool Property FeralEnergyResist = True Auto
    Bool Property FeralGlowingEnergyResist = True Auto
    Bool Property GorillaEnergyResist = True Auto
    Bool Property HumanEnergyResist = True Auto
    Bool Property MirelurkEnergyResist = True Auto
    Bool Property MirelurkHunterEnergyResist = True Auto
    Bool Property MirelurkKingEnergyResist = True Auto
    Bool Property MirelurkQueenEnergyResist = True Auto
    Bool Property MoleratEnergyResist = True Auto
    Bool Property MrHandyEnergyResist = True Auto
    Bool Property MutantHoundEnergyResist = True Auto
    Bool Property ProtectronEnergyResist = True Auto
    Bool Property RadroachEnergyResist = True Auto
    Bool Property RadscorpionEnergyResist = True Auto
    Bool Property RadstagEnergyResist = True Auto
    Bool Property SentryBotEnergyResist = True Auto
    Bool Property StingwingEnergyResist = True Auto
    Bool Property SuperMutantEnergyResist = True Auto
    Bool Property SynthCourserEnergyResist = True Auto
    Bool Property SynthGen1EnergyResist = True Auto
    Bool Property SynthGen2EnergyResist = True Auto
    Bool Property TurretBubbleEnergyResist = True Auto
    Bool Property TurretTripodEnergyResist = True Auto
    Bool Property VertibirdEnergyResist = True Auto
    Bool Property YaoGuaiEnergyResist = True Auto
EndGroup

Group SpeedMult
    Bool Property AlienSpeedMult = True Auto
    Bool Property AssaultronSpeedMult = True Auto
    Bool Property BehemothSpeedMult = True Auto
    Bool Property BloatflySpeedMult = True Auto
    Bool Property BloodbugSpeedMult = True Auto
    Bool Property BrahminSpeedMult = True Auto
    Bool Property CatSpeedMult = True Auto
    Bool Property DeathclawSpeedMult = True Auto
    Bool Property DogRaiderSpeedMult = True Auto
    Bool Property DogViciousSpeedMult = True Auto
    Bool Property EyebotSpeedMult = True Auto
    Bool Property FeralSpeedMult = True Auto
    Bool Property FeralGlowingSpeedMult = True Auto
    Bool Property GorillaSpeedMult = True Auto
    Bool Property HumanSpeedMult = True Auto
    Bool Property MirelurkSpeedMult = True Auto
    Bool Property MirelurkHunterSpeedMult = True Auto
    Bool Property MirelurkKingSpeedMult = True Auto
    Bool Property MirelurkQueenSpeedMult = True Auto
    Bool Property MoleratSpeedMult = True Auto
    Bool Property MrHandySpeedMult = True Auto
    Bool Property MutantHoundSpeedMult = True Auto
    Bool Property ProtectronSpeedMult = True Auto
    Bool Property RadroachSpeedMult = True Auto
    Bool Property RadscorpionSpeedMult = True Auto
    Bool Property RadstagSpeedMult = True Auto
    Bool Property SentryBotSpeedMult = True Auto
    Bool Property StingwingSpeedMult = True Auto
    Bool Property SuperMutantSpeedMult = True Auto
    Bool Property SynthCourserSpeedMult = True Auto
    Bool Property SynthGen1SpeedMult = True Auto
    Bool Property SynthGen2SpeedMult = True Auto
    ;Bool Property TurretBubbleSpeedMult = True Auto
    ;Bool Property TurretTripodSpeedMult = True Auto
    Bool Property VertibirdSpeedMult = True Auto
    Bool Property YaoGuaiSpeedMult = True Auto
EndGroup

Group Influence
    Bool Property AlienInfluence = False Auto
    Bool Property AssaultronInfluence = False Auto
    Bool Property BehemothInfluence = False Auto
    Bool Property BloatflyInfluence = False Auto
    Bool Property BloodbugInfluence = False Auto
    Bool Property BrahminInfluence = False Auto
    Bool Property CatInfluence = False Auto
    Bool Property DeathclawInfluence = False Auto
    Bool Property DogRaiderInfluence = False Auto
    Bool Property DogViciousInfluence = False Auto
    Bool Property EyebotInfluence = False Auto
    Bool Property FeralInfluence = False Auto
    Bool Property FeralGlowingInfluence = False Auto
    Bool Property GorillaInfluence = False Auto
    Bool Property HumanInfluence = False Auto
    Bool Property MirelurkInfluence = False Auto
    Bool Property MirelurkHunterInfluence = False Auto
    Bool Property MirelurkKingInfluence = False Auto
    Bool Property MirelurkQueenInfluence = False Auto
    Bool Property MoleratInfluence = False Auto
    Bool Property MrHandyInfluence = False Auto
    Bool Property MutantHoundInfluence = False Auto
    Bool Property ProtectronInfluence = False Auto
    Bool Property RadroachInfluence = False Auto
    Bool Property RadscorpionInfluence = False Auto
    Bool Property RadstagInfluence = False Auto
    Bool Property SentryBotInfluence = False Auto
    Bool Property StingwingInfluence = False Auto
    Bool Property SuperMutantInfluence = False Auto
    Bool Property SynthCourserInfluence = False Auto
    Bool Property SynthGen1Influence = False Auto
    Bool Property SynthGen2Influence = False Auto
    ;Bool Property TurretBubbleInfluence = False Auto
    ;Bool Property TurretTripodInfluence = False Auto
    Bool Property VertibirdInfluence = False Auto
    Bool Property YaoGuaiInfluence = False Auto
EndGroup

Function ToggleHealthSwitchers(bool bToggle)
    AlienHealth = bToggle
    AssaultronHealth = bToggle
    BehemothHealth = bToggle
    BloatflyHealth = bToggle
    BloodbugHealth = bToggle
    BrahminHealth = bToggle
    CatHealth = bToggle
    DeathclawHealth = bToggle
    DogRaiderHealth = bToggle
    DogViciousHealth = bToggle
    EyebotHealth = bToggle
    FeralHealth = bToggle
    FeralGlowingHealth = bToggle
    GorillaHealth = bToggle
    HumanHealth = bToggle
    MirelurkHealth = bToggle
    MirelurkHunterHealth = bToggle
    MirelurkKingHealth = bToggle
    MirelurkQueenHealth = bToggle
    MoleratHealth = bToggle
    MrHandyHealth = bToggle
    MutantHoundHealth = bToggle
    ProtectronHealth = bToggle
    RadroachHealth = bToggle
    RadscorpionHealth = bToggle
    RadstagHealth = bToggle
    SentryBotHealth = bToggle
    StingwingHealth = bToggle
    SuperMutantHealth = bToggle
    SynthCourserHealth = bToggle
    SynthGen1Health = bToggle
    SynthGen2Health = bToggle
    TurretBubbleHealth = bToggle
    TurretTripodHealth = bToggle
    VertibirdHealth = bToggle
    YaoGuaiHealth = bToggle
EndFunction

Function ToggleDamageResistSwitchers(bool bToggle)
    AlienDamageResist = bToggle
    AssaultronDamageResist = bToggle
    BehemothDamageResist = bToggle
    BloatflyDamageResist = bToggle
    BloodbugDamageResist = bToggle
    BrahminDamageResist = bToggle
    CatDamageResist = bToggle
    DeathclawDamageResist = bToggle
    DogRaiderDamageResist = bToggle
    DogViciousDamageResist = bToggle
    EyebotDamageResist = bToggle
    FeralDamageResist = bToggle
    FeralGlowingDamageResist = bToggle
    GorillaDamageResist = bToggle
    HumanDamageResist = bToggle
    MirelurkDamageResist = bToggle
    MirelurkHunterDamageResist = bToggle
    MirelurkKingDamageResist = bToggle
    MirelurkQueenDamageResist = bToggle
    MoleratDamageResist = bToggle
    MrHandyDamageResist = bToggle
    MutantHoundDamageResist = bToggle
    ProtectronDamageResist = bToggle
    RadroachDamageResist = bToggle
    RadscorpionDamageResist = bToggle
    RadstagDamageResist = bToggle
    SentryBotDamageResist = bToggle
    StingwingDamageResist = bToggle
    SuperMutantDamageResist = bToggle
    SynthCourserDamageResist = bToggle
    SynthGen1DamageResist = bToggle
    SynthGen2DamageResist = bToggle
    TurretBubbleDamageResist = bToggle
    TurretTripodDamageResist = bToggle
    VertibirdDamageResist = bToggle
    YaoGuaiDamageResist = bToggle
EndFunction

Function ToggleEnergyResistSwitchers(bool bToggle)
    AlienEnergyResist = bToggle
    AssaultronEnergyResist = bToggle
    BehemothEnergyResist = bToggle
    BloatflyEnergyResist = bToggle
    BloodbugEnergyResist = bToggle
    BrahminEnergyResist = bToggle
    CatEnergyResist = bToggle
    DeathclawEnergyResist = bToggle
    DogRaiderEnergyResist = bToggle
    DogViciousEnergyResist = bToggle
    EyebotEnergyResist = bToggle
    FeralEnergyResist = bToggle
    FeralGlowingEnergyResist = bToggle
    GorillaEnergyResist = bToggle
    HumanEnergyResist = bToggle
    MirelurkEnergyResist = bToggle
    MirelurkHunterEnergyResist = bToggle
    MirelurkKingEnergyResist = bToggle
    MirelurkQueenEnergyResist = bToggle
    MoleratEnergyResist = bToggle
    MrHandyEnergyResist = bToggle
    MutantHoundEnergyResist = bToggle
    ProtectronEnergyResist = bToggle
    RadroachEnergyResist = bToggle
    RadscorpionEnergyResist = bToggle
    RadstagEnergyResist = bToggle
    SentryBotEnergyResist = bToggle
    StingwingEnergyResist = bToggle
    SuperMutantEnergyResist = bToggle
    SynthCourserEnergyResist = bToggle
    SynthGen1EnergyResist = bToggle
    SynthGen2EnergyResist = bToggle
    TurretBubbleEnergyResist = bToggle
    TurretTripodEnergyResist = bToggle
    VertibirdEnergyResist = bToggle
    YaoGuaiEnergyResist = bToggle
EndFunction

Function ToggleSpeedMultSwitchers(bool bToggle)
    AlienSpeedMult = bToggle
    AssaultronSpeedMult = bToggle
    BehemothSpeedMult = bToggle
    BloatflySpeedMult = bToggle
    BloodbugSpeedMult = bToggle
    BrahminSpeedMult = bToggle
    CatSpeedMult = bToggle
    DeathclawSpeedMult = bToggle
    DogRaiderSpeedMult = bToggle
    DogViciousSpeedMult = bToggle
    EyebotSpeedMult = bToggle
    FeralSpeedMult = bToggle
    FeralGlowingSpeedMult = bToggle
    GorillaSpeedMult = bToggle
    HumanSpeedMult = bToggle
    MirelurkSpeedMult = bToggle
    MirelurkHunterSpeedMult = bToggle
    MirelurkKingSpeedMult = bToggle
    MirelurkQueenSpeedMult = bToggle
    MoleratSpeedMult = bToggle
    MrHandySpeedMult = bToggle
    MutantHoundSpeedMult = bToggle
    ProtectronSpeedMult = bToggle
    RadroachSpeedMult = bToggle
    RadscorpionSpeedMult = bToggle
    RadstagSpeedMult = bToggle
    SentryBotSpeedMult = bToggle
    StingwingSpeedMult = bToggle
    SuperMutantSpeedMult = bToggle
    SynthCourserSpeedMult = bToggle
    SynthGen1SpeedMult = bToggle
    SynthGen2SpeedMult = bToggle
    ;TurretBubbleSpeedMult = bToggle
    ;TurretTripodSpeedMult = bToggle
    VertibirdSpeedMult = bToggle
    YaoGuaiSpeedMult = bToggle
EndFunction

Function ToggleInfluenceSwitchers(bool bToggle)
    AlienInfluence = bToggle
    AssaultronInfluence = bToggle
    BehemothInfluence = bToggle
    BloatflyInfluence = bToggle
    BloodbugInfluence = bToggle
    BrahminInfluence = bToggle
    CatInfluence = bToggle
    DeathclawInfluence = bToggle
    DogRaiderInfluence = bToggle
    DogViciousInfluence = bToggle
    EyebotInfluence = bToggle
    FeralInfluence = bToggle
    FeralGlowingInfluence = bToggle
    GorillaInfluence = bToggle
    HumanInfluence = bToggle
    MirelurkInfluence = bToggle
    MirelurkHunterInfluence = bToggle
    MirelurkKingInfluence = bToggle
    MirelurkQueenInfluence = bToggle
    MoleratInfluence = bToggle
    MrHandyInfluence = bToggle
    MutantHoundInfluence = bToggle
    ProtectronInfluence = bToggle
    RadroachInfluence = bToggle
    RadscorpionInfluence = bToggle
    RadstagInfluence = bToggle
    SentryBotInfluence = bToggle
    StingwingInfluence = bToggle
    SuperMutantInfluence = bToggle
    SynthCourserInfluence = bToggle
    SynthGen1Influence = bToggle
    SynthGen2Influence = bToggle
    ;TurretBubbleInfluence = bToggle
    ;TurretTripodInfluence = bToggle
    VertibirdInfluence = bToggle
    YaoGuaiInfluence = bToggle
EndFunction