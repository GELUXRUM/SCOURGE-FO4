Scriptname SCOURGE_Recalculation Extends ActiveMagicEffect

; AVs we will be changing
Group ActorValues
    ActorValue Property HealthAV Auto
    ActorValue Property DamageResistAV Auto
    ActorValue Property EnergyResistAV Auto
    ActorValue Property SpeedMultAV Auto
EndGroup

;/ formlists that contain all the globals we will be using
to generate the stats /;
Group FormLists
    FormList Property MathFLST Auto
    FormList Property DamageResistFLST Auto
    FormList Property EnergyResistFLST Auto
    FormList Property HealthFLST Auto
    FormList Property SpeedMultFLST Auto
EndGroup

; keywords for tracking and exclusions
Group Keywords
    Keyword Property DisableRecalculationKeyword Auto
    Keyword Property DisableHealthKeyword Auto
    Keyword Property DisableDamageResistKeyword Auto
    Keyword Property DisableEnergyResistKeyword Auto
    Keyword Property DisableSpeedMultKeyword Auto
    Keyword Property SynthCourserKeyword Auto
EndGroup

;/ the spell itself. It only runs once per NPC so we
can remove it at the end to keep it nice and tidy /;
Group Magic
    Spell Property RecalculationSpell Auto
EndGroup

; the tracker that tells us which stats we can change
Group Scripts
    SCOURGE_BoolTracker Property BoolTracker Auto Mandatory
EndGroup 

; the Races we are changing
Group Races
    Race Property AlienRace Auto
    Race Property AssaultronRace Auto
    Race Property BehemothRace Auto
    Race Property BloatflyRace Auto
    Race Property BloodbugRace Auto
    Race Property BrahminRace Auto
    Race Property CatRace Auto
    Race Property ChildRace Auto
    Race Property DeathclawRace Auto
    Race Property DogmeatRace Auto
    Race Property DogRaiderRace Auto
    Race Property DogViciousRace Auto
    Race Property EyebotRace Auto
    Race Property FeralRace Auto
    Race Property FeralGlowingRace Auto
    Race Property GorillaRace Auto
    Race Property HumanRace Auto
    Race Property MirelurkRace Auto
    Race Property MirelurkHunterRace Auto
    Race Property MirelurkKingRace Auto
    Race Property MirelurkQueenRace Auto
    Race Property MoleratRace Auto
    Race Property MrHandyRace Auto
    Race Property MutantHoundRace Auto
    Race Property PreWarGhoulRace Auto
    Race Property ProtectronRace Auto
    Race Property RadroachRace Auto
    Race Property RadscorpionRace Auto
    Race Property RadstagRace Auto
    Race Property SentryBotRace Auto
    Race Property StingwingRace Auto
    Race Property SuperMutantRace Auto
    Race Property SynthGen1Race Auto
    Race Property SynthGen2Race Auto
    Race Property SynthGen2ValentineRace Auto
    Race Property TurretBubbleRace Auto
    Race Property TurretTripodRace Auto
    Race Property VertibirdRace Auto
    Race Property YaoGuaiRace Auto
EndGroup

; location of the stat's min and max values in the FormList
Int indexMinFLST
Int indexMaxFLST
; used for influence system
Int predeterminedValue

;/ before you say anything; yes, I could reduce this to only a few
hundred lines, but it would look messier and more convoluted, would
require extra steps (which would just increase script load) and I
would lose out on the amount of control I have on what happens with
the NPCs. Also, future updates like dynamic NPC renaming will require
this big-ass structure so it's gonna stay like this. Unless you know
of a way to make this more optimised without sacrificing control, I
don't care. You're welcome to make your own PERSONAL version if that's
what you desire. Honestly, the only reason it's like this is because I
give the players the ability to toggle NPCs' stats individually; you
can see that it's the same code with only BoolTracker.NameSomething
being different. /;

Event OnEffectStart(actor akTarget, actor akCaster)
    ; check if mod is enabled
    If BoolTracker.EnableSCOURGE == True
        ; check for race
        If akTarget.GetRace() == AlienRace
            ;/ if race matches set an index for FormLists
            these are where the race-specific values are stored.
            Any edits to the FormLists will make the values
            mismatched this is better than calling the globals
            directly as I will not need to add 500 properties /;
            indexMinFLST = 0
            indexMaxFLST = 1
            ; check if the stat is enabled for the NPC
            If BoolTracker.AlienHealth == True
                ; check if this NPC has any exemption keywords
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    ; check if stat influence is enabled on the NPC
                    If BoolTracker.AlienInfluence == False
                        ; if it is not (default) calculate their new Health
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        ; if it is enabled, then we will calculate their SpeedMult early
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.AlienDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    ; fuck you Todd, why is SetValue() not working for DamageResist >:(
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.AlienEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.AlienSpeedMult == True && BoolTracker.AlienInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == AssaultronRace
            indexMinFLST = 2
            indexMaxFLST = 3
            ;---------------------------------------------------------------------
            If BoolTracker.AssaultronHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If BoolTracker.AssaultronInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.AssaultronDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.AssaultronEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.AssaultronSpeedMult == True && BoolTracker.AssaultronInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == BehemothRace
            indexMinFLST = 4
            indexMaxFLST = 5
            ;---------------------------------------------------------------------
            If BoolTracker.BehemothHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If BoolTracker.BehemothInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.BehemothDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.BehemothEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.BehemothSpeedMult == True && BoolTracker.BehemothInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == BloatflyRace
            indexMinFLST = 6
            indexMaxFLST = 7
            ;---------------------------------------------------------------------
            If BoolTracker.BloatflyHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If BoolTracker.BloatflyInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.BloatflyDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.BloatflyEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.BloatflySpeedMult == True && BoolTracker.BloatflyInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == BloodbugRace
            indexMinFLST = 8
            indexMaxFLST = 9
            ;---------------------------------------------------------------------
            If BoolTracker.BloodbugHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If BoolTracker.BloodbugInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.BloodbugDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.BloodbugEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.BloodbugSpeedMult == True && BoolTracker.BloodbugInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == BrahminRace
            indexMinFLST = 10
            indexMaxFLST = 11
            ;---------------------------------------------------------------------
            If BoolTracker.BrahminHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If BoolTracker.BrahminInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.BrahminDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.BrahminEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.BrahminSpeedMult == True && BoolTracker.BrahminInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == CatRace
            indexMinFLST = 12
            indexMaxFLST = 13
            ;---------------------------------------------------------------------
            If BoolTracker.CatHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If BoolTracker.CatInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.CatDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.CatEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.CatSpeedMult == True && BoolTracker.CatInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == ChildRace
            indexMinFLST = 28
            indexMaxFLST = 29
            ;---------------------------------------------------------------------
            If BoolTracker.HumanHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If BoolTracker.HumanInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.HumanDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.HumanEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.HumanSpeedMult == True && BoolTracker.HumanInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == DeathclawRace
            indexMinFLST = 14
            indexMaxFLST = 15
            ;---------------------------------------------------------------------
            If BoolTracker.DeathclawHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If BoolTracker.DeathclawInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.DeathclawDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.DeathclawEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.DeathclawSpeedMult == True && BoolTracker.DeathclawInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == DogRaiderRace || akTarget.GetRace() == DogmeatRace
            indexMinFLST = 16
            indexMaxFLST = 17
            ;---------------------------------------------------------------------
            If BoolTracker.DogRaiderHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If BoolTracker.DogRaiderInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.DogRaiderDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.DogRaiderEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.ModValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.DogRaiderSpeedMult == True && BoolTracker.DogRaiderInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == DogViciousRace
            indexMinFLST = 18
            indexMaxFLST = 19
            ;---------------------------------------------------------------------
            If BoolTracker.DogViciousHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If BoolTracker.DogViciousInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.DogViciousDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.DogViciousEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.DogViciousSpeedMult == True && BoolTracker.DogViciousInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == EyebotRace
            indexMinFLST = 20
            indexMaxFLST = 21
            ;---------------------------------------------------------------------
            If BoolTracker.EyebotHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If BoolTracker.EyebotInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.EyebotDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.EyebotEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.EyebotSpeedMult == True && BoolTracker.EyebotInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == FeralRace
            indexMinFLST = 22
            indexMaxFLST = 23
            ;---------------------------------------------------------------------
            If BoolTracker.FeralHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If BoolTracker.FeralInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.FeralDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.FeralEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.FeralSpeedMult == True && BoolTracker.FeralInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == FeralGlowingRace
            indexMinFLST = 24
            indexMaxFLST = 25
            ;---------------------------------------------------------------------
            If BoolTracker.FeralGlowingHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If BoolTracker.FeralGlowingInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.FeralGlowingDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.FeralGlowingEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.FeralGlowingSpeedMult == True && BoolTracker.FeralGlowingInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == GorillaRace
            indexMinFLST = 26
            indexMaxFLST = 27
            ;---------------------------------------------------------------------
            If BoolTracker.GorillaHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If BoolTracker.GorillaInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.GorillaDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.GorillaEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.GorillaSpeedMult == True && BoolTracker.GorillaInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == HumanRace || akTarget.GetRace() == PreWarGhoulRace || akTarget.GetRace() == SynthGen2ValentineRace
            If akTarget.HasKeyword(SynthCourserKeyword) == False
                indexMinFLST = 28
                indexMaxFLST = 29
            ;---------------------------------------------------------------------
                If BoolTracker.HumanHealth == True
                    If akTarget.HasKeyword(DisableHealthKeyword) == False
                        If BoolTracker.HumanInfluence == False
                            akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        Else
                            predeterminedValue = Utility.RandomInt(0,126)
                            akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                            akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        EndIf
                    EndIf
                EndIf
            ;---------------------------------------------------------------------
                If BoolTracker.HumanDamageResist == True
                    If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                        akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            ;---------------------------------------------------------------------
                If BoolTracker.HumanEnergyResist == True
                    If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                        akTarget.ModValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            ;---------------------------------------------------------------------
                If BoolTracker.HumanSpeedMult == True && BoolTracker.HumanInfluence == False
                    If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                        akTarget.ModValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
            ElseIf akTarget.HasKeyword(SynthCourserKeyword) == True
                indexMinFLST = 58
                indexMaxFLST = 59
            ;---------------------------------------------------------------------
                If BoolTracker.SynthCourserHealth == True
                    If akTarget.HasKeyword(DisableHealthKeyword) == False
                        If BoolTracker.SynthCourserInfluence == False
                            akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        Else
                            predeterminedValue = Utility.RandomInt(0,126)
                            akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                            akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        EndIf
                    EndIf
                EndIf
            ;---------------------------------------------------------------------
                If BoolTracker.SynthCourserDamageResist == True
                    If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                        akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            ;---------------------------------------------------------------------
                If BoolTracker.SynthCourserEnergyResist == True
                    If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                        akTarget.ModValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            ;---------------------------------------------------------------------
                If BoolTracker.SynthCourserSpeedMult == True && BoolTracker.SynthCourserInfluence == False
                    If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                        akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == MirelurkRace
            indexMinFLST = 30
            indexMaxFLST = 31
            ;---------------------------------------------------------------------
            If BoolTracker.MirelurkHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If BoolTracker.MirelurkInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.MirelurkDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.MirelurkEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.MirelurkSpeedMult == True && BoolTracker.MirelurkInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == MirelurkHunterRace
            indexMinFLST = 32
            indexMaxFLST = 33
            ;---------------------------------------------------------------------
            If BoolTracker.MirelurkHunterHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If BoolTracker.MirelurkHunterInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.MirelurkHunterDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.MirelurkHunterEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.MirelurkHunterSpeedMult == True && BoolTracker.MirelurkHunterInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == MirelurkKingRace
            indexMinFLST = 34
            indexMaxFLST = 35
            ;---------------------------------------------------------------------
            If BoolTracker.MirelurkKingHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If BoolTracker.MirelurkKingInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.MirelurkKingDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.MirelurkKingEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.MirelurkKingSpeedMult == True && BoolTracker.MirelurkKingInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == MirelurkQueenRace
            indexMinFLST = 36
            indexMaxFLST = 37
            ;---------------------------------------------------------------------
            If BoolTracker.MirelurkQueenHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If BoolTracker.MirelurkQueenInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.MirelurkQueenDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.MirelurkQueenEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.MirelurkQueenSpeedMult == True && BoolTracker.MirelurkQueenInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == MoleratRace
            indexMinFLST = 38
            indexMaxFLST = 39
            ;---------------------------------------------------------------------
            If BoolTracker.MoleratHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If BoolTracker.MoleratInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.MoleratDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.MoleratEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.MoleratSpeedMult == True && BoolTracker.MoleratInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == MrHandyRace
            indexMinFLST = 40
            indexMaxFLST = 41
            ;---------------------------------------------------------------------
            If BoolTracker.MrHandyHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If BoolTracker.MrHandyInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.MrHandyDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.MrHandyEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.MrHandySpeedMult == True && BoolTracker.MrHandyInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == MutantHoundRace
            indexMinFLST = 42
            indexMaxFLST = 43
            ;---------------------------------------------------------------------
            If BoolTracker.MutantHoundHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If BoolTracker.MutantHoundInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.MutantHoundDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.MutantHoundEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.MutantHoundSpeedMult == True && BoolTracker.MutantHoundInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == ProtectronRace
            indexMinFLST = 44
            indexMaxFLST = 45
            ;---------------------------------------------------------------------
            If BoolTracker.ProtectronHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If BoolTracker.ProtectronInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.ProtectronDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.ProtectronEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.ProtectronSpeedMult == True && BoolTracker.ProtectronInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == RadroachRace
            indexMinFLST = 46
            indexMaxFLST = 47
            ;---------------------------------------------------------------------
            If BoolTracker.RadroachHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If BoolTracker.RadroachInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.RadroachDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.RadroachEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.RadroachSpeedMult == True && BoolTracker.RadroachInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == RadscorpionRace
            indexMinFLST = 48
            indexMaxFLST = 49
            ;---------------------------------------------------------------------
            If BoolTracker.RadscorpionHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If BoolTracker.RadscorpionInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.RadscorpionDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.RadscorpionEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.RadscorpionSpeedMult == True && BoolTracker.RadscorpionInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == RadstagRace
            indexMinFLST = 50
            indexMaxFLST = 51
            ;---------------------------------------------------------------------
            If BoolTracker.RadstagHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If BoolTracker.RadstagInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.RadstagDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.RadstagEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.RadstagSpeedMult == True && BoolTracker.RadstagInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == SentryBotRace
            indexMinFLST = 52
            indexMaxFLST = 53
            ;---------------------------------------------------------------------
            If BoolTracker.SentryBotHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If BoolTracker.SentryBotInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.SentryBotDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.SentryBotEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.SentryBotSpeedMult == True && BoolTracker.SentryBotInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == StingwingRace
            indexMinFLST = 54
            indexMaxFLST = 55
            ;---------------------------------------------------------------------
            If BoolTracker.StingwingHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If BoolTracker.StingwingInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.StingwingDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.StingwingEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.StingwingSpeedMult == True && BoolTracker.StingwingInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == SuperMutantRace
            indexMinFLST = 56
            indexMaxFLST = 57
            ;---------------------------------------------------------------------
            If BoolTracker.SuperMutantHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If BoolTracker.SuperMutantInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.SuperMutantDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.SuperMutantEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.SuperMutantSpeedMult == True && BoolTracker.SuperMutantInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == SynthGen1Race
            indexMinFLST = 60
            indexMaxFLST = 61
            ;---------------------------------------------------------------------
            If BoolTracker.SynthGen1Health == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If BoolTracker.SynthGen1Influence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.SynthGen1DamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.SynthGen1EnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.ModValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.SynthGen1SpeedMult == True && BoolTracker.SynthGen1Influence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == SynthGen2Race
            indexMinFLST = 62
            indexMaxFLST = 63
            ;---------------------------------------------------------------------
            If BoolTracker.SynthGen2Health == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If BoolTracker.SynthGen2Influence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.SynthGen2DamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.SynthGen2EnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.ModValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.SynthGen2SpeedMult == True && BoolTracker.SynthGen2Influence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == TurretBubbleRace
            indexMinFLST = 64
            indexMaxFLST = 65
            ;---------------------------------------------------------------------
            If BoolTracker.TurretBubbleHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.TurretBubbleDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.TurretBubbleEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == TurretTripodRace
            indexMinFLST = 66
            indexMaxFLST = 67
            ;---------------------------------------------------------------------
            If BoolTracker.TurretTripodHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.TurretTripodDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.TurretTripodEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == VertibirdRace
            indexMinFLST = 68
            indexMaxFLST = 69
            ;---------------------------------------------------------------------
            If BoolTracker.VertibirdHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If BoolTracker.VertibirdInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.VertibirdDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.VertibirdEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.VertibirdSpeedMult == True && BoolTracker.VertibirdInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == YaoGuaiRace
            indexMinFLST = 70
            indexMaxFLST = 71
            ;---------------------------------------------------------------------
            If BoolTracker.YaoGuaiHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If BoolTracker.YaoGuaiInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.YaoGuaiDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.YaoGuaiEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.YaoGuaiSpeedMult == True && BoolTracker.YaoGuaiInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        EndIf
        ;/ once the NPC has been changed, we add a keyword to it to prevent any future changes
        in case the spell gets reapplied after we remove it /;
        akTarget.AddKeyword(DisableRecalculationKeyword)
    EndIf
    ;/ we remove the spell with this scipt on it to keep things nice and tidy as well as
    reduce any potential bloat created by having thousands of spells on all NPCs
    Note that this only seems to remove the MGEF, but it's better than nothing /;
    akTarget.RemoveSpell(RecalculationSpell)
EndEvent

;---------------------------------------------------------------------
; FUNCTIONS
;---------------------------------------------------------------------

Int Function GenerateRandom(float afMin, float afMax)
    ; if both are equal then don't do anything
    If afMin == afMax
        Return afMin as int
    EndIf
    ; make sure min is min and max is max
    If afMin > afMax
        float temp = afMin
        afMin = afMax
        afMax = temp
    EndIf
    ; values for later
    float Average = (afMin + afMax) / 2.0
    float stdDeviation = (afMax - afMin) / 6.0
    ; indexes for later
    int midpointIndex = 63
    int randomIndex = Utility.RandomInt(0, 126)
    ;/ generate a random value that is normally distributed. However,
    because we only have 127 values to choose from, we will one neighbouring
    value so that we can generate a truly random value which will still
    follow normal distribution. In the case of getting 64, we will use both
    neighbouring values, but only half in both sides./;
    float NrmlDistrValue
    If randomIndex < midpointIndex
        NrmlDistrValue = Utility.RandomFloat((MathFLST.GetAt(randomIndex) as GlobalVariable).GetValue(), (MathFLST.GetAt(randomIndex + 1) as GlobalVariable).GetValue())
    ElseIf randomIndex > midpointIndex
        NrmlDistrValue = Utility.RandomFloat((MathFLST.GetAt(randomIndex - 1) as GlobalVariable).GetValue(), (MathFLST.GetAt(randomIndex) as GlobalVariable).GetValue())
    Else
        NrmlDistrValue = Utility.RandomFloat((MathFLST.GetAt(randomIndex - 1) as GlobalVariable).GetValue() / 2.0 , (MathFLST.GetAt(randomIndex + 1) as GlobalVariable).GetValue() / 2.0)
    EndIf
    ; round the final value to the nearest integer and return
    return Math.Floor((NrmlDistrValue * stdDeviation + Average) + 0.5) as int
EndFunction

Int Function GeneratePredetermined(int afInt, float afMin, float afMax)
    If afMin == afMax
        Return afMin as int
    EndIf
    If afMin > afMax
        float temp = afMin
        afMin = afMax
        afMax = temp
    EndIf
    float Average = (afMin + afMax) / 2.0
    float stdDeviation = (afMax - afMin) / 6.0
    int midpointIndex = 63
    ; instead of random index we have afInt
    float NrmlDistrValue
    If afInt < midpointIndex
        NrmlDistrValue = Utility.RandomFloat((MathFLST.GetAt(afInt) as GlobalVariable).GetValue(), (MathFLST.GetAt(afInt + 1) as GlobalVariable).GetValue())
    ElseIf afInt > midpointIndex
        NrmlDistrValue = Utility.RandomFloat((MathFLST.GetAt(afInt - 1) as GlobalVariable).GetValue(), (MathFLST.GetAt(afInt) as GlobalVariable).GetValue())
    Else
        NrmlDistrValue = Utility.RandomFloat((MathFLST.GetAt(afInt - 1) as GlobalVariable).GetValue() / 2.0 , (MathFLST.GetAt(afInt + 1) as GlobalVariable).GetValue() / 2.0)
    EndIf
    return Math.Floor((NrmlDistrValue * stdDeviation + Average) + 0.5) as int
EndFunction

Int Function GeneratePredeterminedInfluence(int afInt, float afMin, float afMax)
    If afMin == afMax
        Return afMin as int
    EndIf
    If afMin > afMax
        float temp = afMin
        afMin = afMax
        afMax = temp
    EndIf
    float Average = (afMin + afMax) / 2.0
    float stdDeviation = (afMax - afMin) / 6.0
    int midpointIndex = 63
    ;/ the randomIndex is now created differently for the Influence system:
    we take the value we generated/created externally and based on it, the
    randomIndex will be limited. If the value was 10, we only want the last
    10 values to be usable. If we get 117, we only want the first 10. If it's
    exactly in the middle, we will use 10 values around it/;
    int randomIndex
    If afInt < 63
        randomIndex = Utility.RandomInt(126 - afInt, 126)
    ElseIf afInt > 63
        randomIndex = Utility.RandomInt(0, 126 - afInt)
    Else
        randomIndex = Utility.RandomInt(54, 74)
    EndIf
    float NrmlDistrValue
    If randomIndex < midpointIndex
        NrmlDistrValue = Utility.RandomFloat((MathFLST.GetAt(randomIndex) as GlobalVariable).GetValue(), (MathFLST.GetAt(randomIndex + 1) as GlobalVariable).GetValue())
    ElseIf randomIndex > midpointIndex
        NrmlDistrValue = Utility.RandomFloat((MathFLST.GetAt(randomIndex - 1) as GlobalVariable).GetValue(), (MathFLST.GetAt(randomIndex) as GlobalVariable).GetValue())
    Else
        NrmlDistrValue = Utility.RandomFloat((MathFLST.GetAt(randomIndex - 1) as GlobalVariable).GetValue() / 2.0 , (MathFLST.GetAt(randomIndex + 1) as GlobalVariable).GetValue() / 2.0)
    EndIf
    return Math.Floor((NrmlDistrValue * stdDeviation + Average) + 0.5) as int
EndFunction