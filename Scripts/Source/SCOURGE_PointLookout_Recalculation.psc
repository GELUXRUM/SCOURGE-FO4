Scriptname SCOURGE_PointLookout_Recalculation Extends ActiveMagicEffect

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
    FormList Property HealthFLSTBase Auto
    FormList Property DamageResistFLSTBase Auto
    FormList Property EnergyResistFLSTBase Auto
    FormList Property SpeedMultFLSTBase Auto
    ; for Robobrain support
    FormList Property RobobrainFLST Auto
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
    SCOURGE_PointLookout_BoolTracker Property PointLookout_BoolTracker Auto Mandatory
    SCOURGE_BoolTracker Property BoolTracker Auto Mandatory
    SCOURGE_Automatron_BoolTracker Property Automatron_BoolTracker Auto Mandatory
EndGroup 

Group Races
    Race Property ChickenRace Auto
    Race Property FrogRace Auto
    Race Property SwampfolkLargeRace Auto
    Race Property SwampfolkMediumRace Auto
    Race Property SwampfolkSmallRace Auto
    Race Property SwamplurkQueenRace Auto
    Race Property RobobrainRace Auto
    Race Property FeralRace Auto
    Race Property FeralGlowingRace Auto
    Race Property GhoulRace Auto
    Race Property HumanRace Auto
    Race Property ProtectronRace Auto
    Race Property TurretTripodRace Auto
EndGroup

Int indexMinFLST
Int indexMaxFLST
Int predeterminedValue

Event OnEffectStart(actor akTarget, actor akCaster)

    If BoolTracker.EnableSCOURGE == True

        If akTarget.GetRace() == ChickenRace
            indexMinFLST = 0
            indexMaxFLST = 1
            ;---------------------------------------------------------------------
            If PointLookout_BoolTracker.ChickenHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If PointLookout_BoolTracker.ChickenInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If PointLookout_BoolTracker.ChickenDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If PointLookout_BoolTracker.ChickenEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If PointLookout_BoolTracker.ChickenSpeedMult == True && PointLookout_BoolTracker.ChickenInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == FrogRace
            indexMinFLST = 2
            indexMaxFLST = 3
            ;---------------------------------------------------------------------
            If PointLookout_BoolTracker.FrogHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If PointLookout_BoolTracker.FrogInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If PointLookout_BoolTracker.FrogDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If PointLookout_BoolTracker.FrogEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If PointLookout_BoolTracker.FrogSpeedMult == True && PointLookout_BoolTracker.FrogInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == SwampfolkLargeRace
            indexMinFLST = 4
            indexMaxFLST = 5
            ;---------------------------------------------------------------------
            If PointLookout_BoolTracker.SwampfolkLargeHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If PointLookout_BoolTracker.SwampfolkLargeInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If PointLookout_BoolTracker.SwampfolkLargeDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If PointLookout_BoolTracker.SwampfolkLargeEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If PointLookout_BoolTracker.SwampfolkLargeSpeedMult == True && PointLookout_BoolTracker.SwampfolkLargeInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == SwampfolkMediumRace
            indexMinFLST = 6
            indexMaxFLST = 7
            ;---------------------------------------------------------------------
            If PointLookout_BoolTracker.SwampfolkMediumHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If PointLookout_BoolTracker.SwampfolkMediumInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If PointLookout_BoolTracker.SwampfolkMediumDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If PointLookout_BoolTracker.SwampfolkMediumEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If PointLookout_BoolTracker.SwampfolkMediumSpeedMult == True && PointLookout_BoolTracker.SwampfolkMediumInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == SwampfolkSmallRace
            indexMinFLST = 8
            indexMaxFLST = 9
            ;---------------------------------------------------------------------
            If PointLookout_BoolTracker.SwampfolkSmallHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If PointLookout_BoolTracker.SwampfolkSmallInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If PointLookout_BoolTracker.SwampfolkSmallDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If PointLookout_BoolTracker.SwampfolkSmallEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If PointLookout_BoolTracker.SwampfolkSmallSpeedMult == True && PointLookout_BoolTracker.SwampfolkSmallInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == SwamplurkQueenRace
            indexMinFLST = 10
            indexMaxFLST = 11
            ;---------------------------------------------------------------------
            If PointLookout_BoolTracker.SwamplurkQueenHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If PointLookout_BoolTracker.SwamplurkQueenInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If PointLookout_BoolTracker.SwamplurkQueenDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If PointLookout_BoolTracker.SwamplurkQueenEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If PointLookout_BoolTracker.SwamplurkQueenSpeedMult == True && PointLookout_BoolTracker.SwamplurkQueenInfluence == False
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
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLSTBase.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLSTBase.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLSTBase.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLSTBase.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLSTBase.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLSTBase.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.FeralDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLSTBase.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLSTBase.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.FeralEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLSTBase.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLSTBase.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.FeralSpeedMult == True && BoolTracker.FeralInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLSTBase.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLSTBase.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
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
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLSTBase.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLSTBase.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLSTBase.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLSTBase.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLSTBase.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLSTBase.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.FeralGlowingDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLSTBase.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLSTBase.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.FeralGlowingEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLSTBase.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLSTBase.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.FeralGlowingSpeedMult == True && BoolTracker.FeralGlowingInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLSTBase.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLSTBase.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == HumanRace || akTarget.GetRace() == GhoulRace 
            indexMinFLST = 28
            indexMaxFLST = 29
            ;---------------------------------------------------------------------
            If BoolTracker.HumanHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If BoolTracker.HumanInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLSTBase.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLSTBase.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLSTBase.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLSTBase.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLSTBase.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLSTBase.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.HumanDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLSTBase.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLSTBase.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.HumanEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLSTBase.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLSTBase.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.HumanSpeedMult == True && BoolTracker.HumanInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLSTBase.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLSTBase.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
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
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLSTBase.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLSTBase.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLSTBase.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLSTBase.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLSTBase.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLSTBase.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.ProtectronDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLSTBase.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLSTBase.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.ProtectronEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLSTBase.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLSTBase.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.ProtectronSpeedMult == True && BoolTracker.ProtectronInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLSTBase.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLSTBase.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == TurretTripodRace
            indexMinFLST = 66
            indexMaxFLST = 67
            ;---------------------------------------------------------------------
            If BoolTracker.TurretTripodHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    akTarget.SetValue(HealthAV, GenerateRandom((HealthFLSTBase.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLSTBase.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.TurretTripodDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLSTBase.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLSTBase.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.TurretTripodEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLSTBase.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLSTBase.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == RobobrainRace
            ;---------------------------------------------------------------------
            If Automatron_BoolTracker.RobobrainHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If Automatron_BoolTracker.RobobrainInfluence == False
                        akTarget.SetValue(HealthAV, Math.Floor((GenerateRandom((RobobrainFLST.GetAt(0) as GlobalVariable).GetValue(), (RobobrainFLST.GetAt(1) as GlobalVariable).GetValue())) + 0.5))
                    ElseIf Automatron_BoolTracker.RobobrainInfluence == True
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, Math.Floor((GeneratePredetermined(predeterminedValue, (RobobrainFLST.GetAt(0) as GlobalVariable).GetValue(), (RobobrainFLST.GetAt(1) as GlobalVariable).GetValue())) + 0.5))
                        akTarget.SetValue(SpeedMultAV, Math.Floor((GeneratePredeterminedInfluence(predeterminedValue, (RobobrainFLST.GetAt(6) as GlobalVariable).GetValue(), (RobobrainFLST.GetAt(7) as GlobalVariable).GetValue())) + 0.5))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If Automatron_BoolTracker.RobobrainDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, Math.Floor((GenerateRandom((RobobrainFLST.GetAt(2) as GlobalVariable).GetValue(), (RobobrainFLST.GetAt(3) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV)) + 0.5))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If Automatron_BoolTracker.RobobrainEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, Math.Floor((GenerateRandom((RobobrainFLST.GetAt(4) as GlobalVariable).GetValue(), (RobobrainFLST.GetAt(5) as GlobalVariable).GetValue())) + 0.5))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If Automatron_BoolTracker.RobobrainSpeedMult == True && Automatron_BoolTracker.RobobrainInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, Math.Floor((GenerateRandom((RobobrainFLST.GetAt(6) as GlobalVariable).GetValue(), (RobobrainFLST.GetAt(7) as GlobalVariable).GetValue())) + 0.5))
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