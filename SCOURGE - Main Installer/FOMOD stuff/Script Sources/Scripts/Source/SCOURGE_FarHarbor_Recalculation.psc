Scriptname SCOURGE_FarHarbor_Recalculation Extends ActiveMagicEffect

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
    Keyword Property GulperDevourerIdentifier Auto
EndGroup

Group Magic
    Spell Property RecalculationSpell Auto
EndGroup

Group Scripts
    SCOURGE_FarHarbor_BoolTracker Property FarHarbor_BoolTracker Auto Mandatory
    SCOURGE_BoolTracker Property BoolTracker Auto Mandatory
EndGroup 

Group Races
    Race Property AnglerRace Auto
    Race Property ChickenRace Auto
    Race Property FogCrawlerRace Auto
    Race Property GulperRace Auto
    Race Property GulperYoungRace Auto
    Race Property HermitCrabRace Auto
    Race Property RabbitRace Auto
    Race Property WolfRace Auto
EndGroup

Int indexMinFLST
Int indexMaxFLST
Int predeterminedValue

Event OnEffectStart(actor akTarget, actor akCaster)
    If BoolTracker.EnableSCOURGE == True
        If akTarget.GetRace() == AnglerRace
            indexMinFLST = 0
            indexMaxFLST = 1
            ;---------------------------------------------------------------------
            If FarHarbor_BoolTracker.AnglerHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If FarHarbor_BoolTracker.AnglerInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If FarHarbor_BoolTracker.AnglerDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If FarHarbor_BoolTracker.AnglerEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If FarHarbor_BoolTracker.AnglerSpeedMult == True && FarHarbor_BoolTracker.AnglerInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == ChickenRace
            indexMinFLST = 2
            indexMaxFLST = 3
            ;---------------------------------------------------------------------
            If FarHarbor_BoolTracker.ChickenHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If FarHarbor_BoolTracker.ChickenInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If FarHarbor_BoolTracker.ChickenDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If FarHarbor_BoolTracker.ChickenEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If FarHarbor_BoolTracker.ChickenSpeedMult == True && FarHarbor_BoolTracker.ChickenInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == FogCrawlerRace
            indexMinFLST = 4
            indexMaxFLST = 5
            ;---------------------------------------------------------------------
            If FarHarbor_BoolTracker.FogCrawlerHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If FarHarbor_BoolTracker.FogCrawlerInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If FarHarbor_BoolTracker.FogCrawlerDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If FarHarbor_BoolTracker.FogCrawlerEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If FarHarbor_BoolTracker.FogCrawlerSpeedMult == True && FarHarbor_BoolTracker.FogCrawlerInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == GulperRace
            If akTarget.HasKeyword(GulperDevourerIdentifier) == False
                indexMinFLST = 6
                indexMaxFLST = 7
                ;---------------------------------------------------------------------
                If FarHarbor_BoolTracker.GulperHealth == True
                    If akTarget.HasKeyword(DisableHealthKeyword) == False
                        If FarHarbor_BoolTracker.GulperInfluence == False
                            akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        Else
                            predeterminedValue = Utility.RandomInt(0,126)
                            akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                            akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        EndIf
                    EndIf
                EndIf
                ;---------------------------------------------------------------------
                If FarHarbor_BoolTracker.GulperDamageResist == True
                    If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                        akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                    EndIf
                EndIf
                ;---------------------------------------------------------------------
                If FarHarbor_BoolTracker.GulperEnergyResist == True
                    If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                        akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
                ;---------------------------------------------------------------------
                If FarHarbor_BoolTracker.GulperSpeedMult == True && FarHarbor_BoolTracker.GulperInfluence == False
                    If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                        akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            ElseIf akTarget.HasKeyword(GulperDevourerIdentifier) == True
                indexMinFLST = 8
                indexMaxFLST = 9
                ;---------------------------------------------------------------------
                If FarHarbor_BoolTracker.GulperDevourerHealth == True
                    If akTarget.HasKeyword(DisableHealthKeyword) == False
                        If FarHarbor_BoolTracker.GulperDevourerInfluence == False
                            akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        Else
                            predeterminedValue = Utility.RandomInt(0,126)
                            akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                            akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        EndIf
                    EndIf
                EndIf
                ;---------------------------------------------------------------------
                If FarHarbor_BoolTracker.GulperDevourerDamageResist == True
                    If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                        akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                    EndIf
                EndIf
                ;---------------------------------------------------------------------
                If FarHarbor_BoolTracker.GulperDevourerEnergyResist == True
                    If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                        akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
                ;---------------------------------------------------------------------
                If FarHarbor_BoolTracker.GulperDevourerSpeedMult == True && FarHarbor_BoolTracker.GulperDevourerInfluence == False
                    If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                        akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == GulperYoungRace
            indexMinFLST = 10
            indexMaxFLST = 11
            ;---------------------------------------------------------------------
            If FarHarbor_BoolTracker.GulperYoungHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If FarHarbor_BoolTracker.GulperYoungInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If FarHarbor_BoolTracker.GulperYoungDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If FarHarbor_BoolTracker.GulperYoungEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If FarHarbor_BoolTracker.GulperYoungSpeedMult == True && FarHarbor_BoolTracker.GulperYoungInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == HermitCrabRace
            indexMinFLST = 12
            indexMaxFLST = 13
            ;---------------------------------------------------------------------
            If FarHarbor_BoolTracker.HermitCrabHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If FarHarbor_BoolTracker.HermitCrabInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If FarHarbor_BoolTracker.HermitCrabDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If FarHarbor_BoolTracker.HermitCrabEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If FarHarbor_BoolTracker.HermitCrabSpeedMult == True && FarHarbor_BoolTracker.HermitCrabInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == RabbitRace
            indexMinFLST = 14
            indexMaxFLST = 15
            ;---------------------------------------------------------------------
            If FarHarbor_BoolTracker.RabbitHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If FarHarbor_BoolTracker.RabbitInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If FarHarbor_BoolTracker.RabbitDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If FarHarbor_BoolTracker.RabbitEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If FarHarbor_BoolTracker.RabbitSpeedMult == True && FarHarbor_BoolTracker.RabbitInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == WolfRace
            indexMinFLST = 16
            indexMaxFLST = 17
            ;---------------------------------------------------------------------
            If FarHarbor_BoolTracker.WolfHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If FarHarbor_BoolTracker.WolfInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If FarHarbor_BoolTracker.WolfDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If FarHarbor_BoolTracker.WolfEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If FarHarbor_BoolTracker.WolfSpeedMult == True && FarHarbor_BoolTracker.WolfInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        EndIf
        akTarget.AddKeyword(DisableRecalculationKeyword)
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