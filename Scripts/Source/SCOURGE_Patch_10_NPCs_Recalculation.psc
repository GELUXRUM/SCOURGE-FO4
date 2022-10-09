Scriptname SCOURGE_Patch_10_NPCs_Recalculation Extends ActiveMagicEffect

; AVs we will be changing
Group ActorValues
    ActorValue Property HealthAV Auto
    ActorValue Property DamageResistAV Auto
    ActorValue Property EnergyResistAV Auto
    ActorValue Property SpeedMultAV Auto
EndGroup

Group FormLists
    FormList Property MathFLST Auto
    FormList Property DamageResistFLST Auto
    FormList Property EnergyResistFLST Auto
    FormList Property HealthFLST Auto
    FormList Property SpeedMultFLST Auto
EndGroup

Group Keywords
    Keyword Property DisableRecalculationKeyword Auto
    Keyword Property DisableHealthKeyword Auto
    Keyword Property DisableDamageResistKeyword Auto
    Keyword Property DisableEnergyResistKeyword Auto
    Keyword Property DisableSpeedMultKeyword Auto
    Keyword Property RecalculationIdentifierKeyword Auto
EndGroup

Group Magic
    Spell Property RecalculationSpell Auto
EndGroup

Group Scripts
    SCOURGE_Patch_10_NPCs_BoolTracker Property BoolTracker Auto Mandatory
EndGroup 

Group Races
    Race Property CustomRaceOne Auto
    Race Property CustomRaceTwo Auto
    Race Property CustomRaceThree Auto
    Race Property CustomRaceFour Auto
    Race Property CustomRaceFive Auto
    Race Property CustomRaceSix Auto
    Race Property CustomRaceSeven Auto
    Race Property CustomRaceEight Auto
    Race Property CustomRaceNine Auto
    Race Property CustomRaceTen Auto
EndGroup

Int indexMinFLST
Int indexMaxFLST
Int predeterminedValue

Event OnEffectStart(actor akTarget, actor akCaster)
    If BoolTracker.EnableSCOURGE == True
        If akTarget.GetRace() == CustomRaceOne
            indexMinFLST = 0
            indexMaxFLST = 1
            If BoolTracker.CustomRaceOneHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If BoolTracker.CustomRaceOneInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.CustomRaceOneDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.CustomRaceOneEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.CustomRaceOneSpeedMult == True && BoolTracker.CustomRaceOneInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == CustomRaceTwo
            indexMinFLST = 2
            indexMaxFLST = 3
            ;---------------------------------------------------------------------
            If BoolTracker.CustomRaceTwoHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If BoolTracker.CustomRaceTwoInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.CustomRaceTwoDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.CustomRaceTwoEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.CustomRaceTwoSpeedMult == True && BoolTracker.CustomRaceTwoInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == CustomRaceThree
            indexMinFLST = 4
            indexMaxFLST = 5
            ;---------------------------------------------------------------------
            If BoolTracker.CustomRaceThreeHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If BoolTracker.CustomRaceThreeInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.CustomRaceThreeDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.CustomRaceThreeEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.CustomRaceThreeSpeedMult == True && BoolTracker.CustomRaceThreeInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == CustomRaceFour
            indexMinFLST = 6
            indexMaxFLST = 7
            ;---------------------------------------------------------------------
            If BoolTracker.CustomRaceFourHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If BoolTracker.CustomRaceFourInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.CustomRaceFourDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.CustomRaceFourEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.CustomRaceFourSpeedMult == True && BoolTracker.CustomRaceFourInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == CustomRaceFive
            indexMinFLST = 8
            indexMaxFLST = 9
            ;---------------------------------------------------------------------
            If BoolTracker.CustomRaceFiveHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If BoolTracker.CustomRaceFiveInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.CustomRaceFiveDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.CustomRaceFiveEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.CustomRaceFiveSpeedMult == True && BoolTracker.CustomRaceFiveInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == CustomRaceSix
            indexMinFLST = 10
            indexMaxFLST = 11
            ;---------------------------------------------------------------------
            If BoolTracker.CustomRaceSixHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If BoolTracker.CustomRaceSixInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.CustomRaceSixDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.CustomRaceSixEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.CustomRaceSixSpeedMult == True && BoolTracker.CustomRaceSixInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == CustomRaceSeven
            indexMinFLST = 12
            indexMaxFLST = 13
            ;---------------------------------------------------------------------
            If BoolTracker.CustomRaceSevenHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If BoolTracker.CustomRaceSevenInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.CustomRaceSevenDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.CustomRaceSevenEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.CustomRaceSevenSpeedMult == True && BoolTracker.CustomRaceSevenInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == CustomRaceEight
            indexMinFLST = 14
            indexMaxFLST = 15
            ;---------------------------------------------------------------------
            If BoolTracker.CustomRaceEightHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If BoolTracker.CustomRaceEightInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.CustomRaceEightDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.CustomRaceEightEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.CustomRaceEightSpeedMult == True && BoolTracker.CustomRaceEightInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == CustomRaceNine
            indexMinFLST = 16
            indexMaxFLST = 17
            ;---------------------------------------------------------------------
            If BoolTracker.CustomRaceNineHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If BoolTracker.CustomRaceNineInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.CustomRaceNineDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.CustomRaceNineEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.CustomRaceNineSpeedMult == True && BoolTracker.CustomRaceNineInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == CustomRaceTen
            indexMinFLST = 18
            indexMaxFLST = 19
            ;---------------------------------------------------------------------
            If BoolTracker.CustomRaceTenHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If BoolTracker.CustomRaceTenInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.CustomRaceTenDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.CustomRaceTenEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.CustomRaceTenSpeedMult == True && BoolTracker.CustomRaceTenInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        EndIf
        akTarget.AddKeyword(RecalculationIdentifierKeyword)
    EndIf
    akTarget.RemoveSpell(RecalculationSpell)
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