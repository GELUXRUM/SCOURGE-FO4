Scriptname SCOURGE_MutantMenagerie_Recalculation Extends ActiveMagicEffect

Group ActorValues
    ActorValue Property HealthAV Auto
    ActorValue Property DamageResistAV Auto
    ActorValue Property EnergyResistAV Auto
    ActorValue Property SpeedMultAV Auto
EndGroup

Group FormLists
    FormList Property MathFLST Auto
    FormList Property HealthFLST Auto
    FormList Property DamageResistFLST Auto
    FormList Property EnergyResistFLST Auto
    FormList Property SpeedMultFLST Auto
EndGroup

Group Keywords
    Keyword Property DisableHealthKeyword Auto
    Keyword Property DisableDamageResistKeyword Auto
    Keyword Property DisableEnergyResistKeyword Auto
    Keyword Property DisableSpeedMultKeyword Auto
    Keyword Property DisableRecalculationKeyword Auto
    Keyword Property RecalculationIdentifierKeyword Auto
EndGroup

Group Magic
    Spell Property RecalculationSpell Auto
EndGroup

Group Scripts
    SCOURGE_MutantMenagerie_BoolTracker Property MutantMenagerie_BoolTracker Auto Mandatory
    SCOURGE_BoolTracker Property BoolTracker Auto Mandatory
EndGroup 

Group Races
    Race Property RadSquirrelRace Auto
    Race Property RadcoonRace Auto
    Race Property BeeswarmRace Auto
    Race Property BobcatRace Auto
    Race Property BeaverRace Auto
    Race Property PheasantRace Auto
    Race Property HoneybeeRace Auto
    Race Property LeechRace Auto
    Race Property SkunkRace Auto
    Race Property IguanaRace Auto
    Race Property CatfishRace Auto
    Race Property OpossumRace Auto
    Race Property WhaleRace Auto
    Race Property DuckRace Auto
    Race Property TurkeyRace Auto
    Race Property SquidRace Auto
    Race Property GargoyleRace Auto
    Race Property GoatRace Auto
    Race Property LadybugRace Auto
    Race Property SpiderRace Auto
    Race Property OwlRace Auto
    Race Property BoarRace Auto
    Race Property Ladybug2Race Auto
    Race Property KatydidRace Auto
    Race Property PirahnaRace Auto
    Race Property RadsnakeRace Auto
    Race Property RadtoadRace Auto
    Race Property GooseRace Auto
    Race Property LoonRace Auto
    Race Property WanamingoRace Auto
    Race Property MuskratRace Auto
    Race Property SharkRace Auto
    Race Property DolphinRace Auto
    Race Property FoxRace Auto
EndGroup

Int indexMinFLST
Int indexMaxFLST
Int predeterminedValue
Float tempValue

Event OnEffectStart(actor akTarget, actor akCaster)

    If BoolTracker.EnableSCOURGE == True

        If akTarget.GetRace() == RadSquirrelRace
            indexMinFLST = 0
            indexMaxFLST = 1
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.RadSquirrelHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If MutantMenagerie_BoolTracker.RadSquirrelInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.RadSquirrelDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.RadSquirrelEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.RadSquirrelSpeedMult == True && MutantMenagerie_BoolTracker.RadSquirrelInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == RadcoonRace
            indexMinFLST = 2
            indexMaxFLST = 3
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.RadcoonHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If MutantMenagerie_BoolTracker.RadcoonInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.RadcoonDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.RadcoonEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.RadcoonSpeedMult == True && MutantMenagerie_BoolTracker.RadcoonInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == BeeswarmRace
            indexMinFLST = 4
            indexMaxFLST = 5
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.BeeswarmHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If MutantMenagerie_BoolTracker.BeeswarmInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.BeeswarmDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.BeeswarmEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.BeeswarmSpeedMult == True && MutantMenagerie_BoolTracker.BeeswarmInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == BobcatRace
            indexMinFLST = 6
            indexMaxFLST = 7
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.BobcatHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If MutantMenagerie_BoolTracker.BobcatInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.BobcatDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.BobcatEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.BobcatSpeedMult == True && MutantMenagerie_BoolTracker.BobcatInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == BeaverRace
            indexMinFLST = 8
            indexMaxFLST = 9
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.BeaverHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If MutantMenagerie_BoolTracker.BeaverInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.BeaverDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.BeaverEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.BeaverSpeedMult == True && MutantMenagerie_BoolTracker.BeaverInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == PheasantRace
            indexMinFLST = 10
            indexMaxFLST = 11
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.PheasantHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If MutantMenagerie_BoolTracker.PheasantInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.PheasantDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.PheasantEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.PheasantSpeedMult == True && MutantMenagerie_BoolTracker.PheasantInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == HoneybeeRace
            indexMinFLST = 12
            indexMaxFLST = 13
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.HoneybeeHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If MutantMenagerie_BoolTracker.HoneybeeInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.HoneybeeDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.HoneybeeEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.HoneybeeSpeedMult == True && MutantMenagerie_BoolTracker.HoneybeeInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == LeechRace
            indexMinFLST = 14
            indexMaxFLST = 15
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.LeechHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If MutantMenagerie_BoolTracker.LeechInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.LeechDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.LeechEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.LeechSpeedMult == True && MutantMenagerie_BoolTracker.LeechInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == SkunkRace
            indexMinFLST = 16
            indexMaxFLST = 17
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.SkunkHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If MutantMenagerie_BoolTracker.SkunkInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.SkunkDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.SkunkEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.SkunkSpeedMult == True && MutantMenagerie_BoolTracker.SkunkInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == IguanaRace
            indexMinFLST = 18
            indexMaxFLST = 19
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.IguanaHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If MutantMenagerie_BoolTracker.IguanaInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.IguanaDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.IguanaEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.IguanaSpeedMult == True && MutantMenagerie_BoolTracker.IguanaInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == CatfishRace
            indexMinFLST = 20
            indexMaxFLST = 21
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.CatfishHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If MutantMenagerie_BoolTracker.CatfishInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.CatfishDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.CatfishEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.CatfishSpeedMult == True && MutantMenagerie_BoolTracker.CatfishInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == OpossumRace
            indexMinFLST = 22
            indexMaxFLST = 23
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.OpossumHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If MutantMenagerie_BoolTracker.OpossumInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.OpossumDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.OpossumEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.OpossumSpeedMult == True && MutantMenagerie_BoolTracker.OpossumInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == WhaleRace
            indexMinFLST = 24
            indexMaxFLST = 25
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.WhaleHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If MutantMenagerie_BoolTracker.WhaleInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.WhaleDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.WhaleEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.WhaleSpeedMult == True && MutantMenagerie_BoolTracker.WhaleInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == DuckRace
            indexMinFLST = 26
            indexMaxFLST = 27
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.DuckHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If MutantMenagerie_BoolTracker.DuckInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.DuckDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.DuckEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.DuckSpeedMult == True && MutantMenagerie_BoolTracker.DuckInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == TurkeyRace
            indexMinFLST = 28
            indexMaxFLST = 29
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.TurkeyHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If MutantMenagerie_BoolTracker.TurkeyInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.TurkeyDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.TurkeyEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.TurkeySpeedMult == True && MutantMenagerie_BoolTracker.TurkeyInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == SquidRace
            indexMinFLST = 30
            indexMaxFLST = 31
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.SquidHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If MutantMenagerie_BoolTracker.SquidInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.SquidDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.SquidEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.SquidSpeedMult == True && MutantMenagerie_BoolTracker.SquidInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == GargoyleRace
            indexMinFLST = 32
            indexMaxFLST = 33
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.GargoyleHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If MutantMenagerie_BoolTracker.GargoyleInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.GargoyleDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.GargoyleEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.GargoyleSpeedMult == True && MutantMenagerie_BoolTracker.GargoyleInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == GoatRace
            indexMinFLST = 34
            indexMaxFLST = 35
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.GoatHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If MutantMenagerie_BoolTracker.GoatInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.GoatDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.GoatEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.GoatSpeedMult == True && MutantMenagerie_BoolTracker.GoatInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == LadybugRace
            indexMinFLST = 36
            indexMaxFLST = 37
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.LadybugHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If MutantMenagerie_BoolTracker.LadybugInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.LadybugDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.LadybugEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.LadybugSpeedMult == True && MutantMenagerie_BoolTracker.LadybugInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == SpiderRace
            indexMinFLST = 38
            indexMaxFLST = 39
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.SpiderHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If MutantMenagerie_BoolTracker.SpiderInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.SpiderDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.SpiderEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.SpiderSpeedMult == True && MutantMenagerie_BoolTracker.SpiderInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == OwlRace
            indexMinFLST = 40
            indexMaxFLST = 41
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.OwlHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If MutantMenagerie_BoolTracker.OwlInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.OwlDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.OwlEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.OwlSpeedMult == True && MutantMenagerie_BoolTracker.OwlInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == BoarRace
            indexMinFLST = 42
            indexMaxFLST = 43
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.BoarHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If MutantMenagerie_BoolTracker.BoarInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.BoarDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.BoarEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.BoarSpeedMult == True && MutantMenagerie_BoolTracker.BoarInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == Ladybug2Race
            indexMinFLST = 44
            indexMaxFLST = 45
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.Ladybug2Health == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If MutantMenagerie_BoolTracker.Ladybug2Influence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.Ladybug2DamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.Ladybug2EnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.Ladybug2SpeedMult == True && MutantMenagerie_BoolTracker.Ladybug2Influence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == KatydidRace
            indexMinFLST = 46
            indexMaxFLST = 47
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.KatydidHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If MutantMenagerie_BoolTracker.KatydidInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.KatydidDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.KatydidEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.KatydidSpeedMult == True && MutantMenagerie_BoolTracker.KatydidInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == PirahnaRace
            indexMinFLST = 48
            indexMaxFLST = 49
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.PirahnaHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If MutantMenagerie_BoolTracker.PirahnaInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.PirahnaDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.PirahnaEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.PirahnaSpeedMult == True && MutantMenagerie_BoolTracker.PirahnaInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == RadsnakeRace
            indexMinFLST = 50
            indexMaxFLST = 51
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.RadsnakeHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If MutantMenagerie_BoolTracker.RadsnakeInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.RadsnakeDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.RadsnakeEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.RadsnakeSpeedMult == True && MutantMenagerie_BoolTracker.RadsnakeInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == RadtoadRace
            indexMinFLST = 52
            indexMaxFLST = 53
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.RadtoadHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If MutantMenagerie_BoolTracker.RadtoadInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.RadtoadDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.RadtoadEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.RadtoadSpeedMult == True && MutantMenagerie_BoolTracker.RadtoadInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == GooseRace
            indexMinFLST = 54
            indexMaxFLST = 55
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.GooseHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If MutantMenagerie_BoolTracker.GooseInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.GooseDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.GooseEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.GooseSpeedMult == True && MutantMenagerie_BoolTracker.GooseInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == LoonRace
            indexMinFLST = 56
            indexMaxFLST = 57
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.LoonHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If MutantMenagerie_BoolTracker.LoonInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.LoonDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.LoonEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.LoonSpeedMult == True && MutantMenagerie_BoolTracker.LoonInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == WanamingoRace
            indexMinFLST = 58
            indexMaxFLST = 59
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.WanamingoHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If MutantMenagerie_BoolTracker.WanamingoInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.WanamingoDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.WanamingoEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.WanamingoSpeedMult == True && MutantMenagerie_BoolTracker.WanamingoInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == MuskratRace
            indexMinFLST = 60
            indexMaxFLST = 61
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.MuskratHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If MutantMenagerie_BoolTracker.MuskratInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.MuskratDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.MuskratEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.MuskratSpeedMult == True && MutantMenagerie_BoolTracker.MuskratInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == SharkRace
            indexMinFLST = 62
            indexMaxFLST = 63
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.SharkHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If MutantMenagerie_BoolTracker.SharkInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.SharkDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.SharkEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.SharkSpeedMult == True && MutantMenagerie_BoolTracker.SharkInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == DolphinRace
            indexMinFLST = 64
            indexMaxFLST = 65
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.DolphinHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If MutantMenagerie_BoolTracker.DolphinInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.DolphinDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.DolphinEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.DolphinSpeedMult == True && MutantMenagerie_BoolTracker.DolphinInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == FoxRace
            indexMinFLST = 66
            indexMaxFLST = 67
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.FoxHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If MutantMenagerie_BoolTracker.FoxInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.FoxDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.FoxEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If MutantMenagerie_BoolTracker.FoxSpeedMult == True && MutantMenagerie_BoolTracker.FoxInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        EndIf
        akTarget.AddKeyword(RecalculationIdentifierKeyword)
    EndIf
    akTarget.DispelSpell(RecalculationSpell)
EndEvent

;---------------------------------------------------------------------
; FUNCTIONS
;---------------------------------------------------------------------

Int Function GenerateRandom(float afMin, float afMax)
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
    int randomIndex = Utility.RandomInt(0, 126)
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