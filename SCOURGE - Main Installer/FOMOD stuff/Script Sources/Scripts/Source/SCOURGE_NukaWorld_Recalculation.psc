Scriptname SCOURGE_NukaWorld_Recalculation Extends ActiveMagicEffect

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
EndGroup

Group Magic
    Spell Property RecalculationSpell Auto
EndGroup

Group Scripts
    SCOURGE_NukaWorld_BoolTracker Property NukaWorld_BoolTracker Auto Mandatory
    SCOURGE_BoolTracker Property BoolTracker Auto Mandatory
EndGroup 

Group Races
    Race Property AnimatronicAlienRace Auto
    Race Property AntRace Auto
    Race Property BloodwormRace Auto
    Race Property BrahmiluffRace Auto
    Race Property CricketRace Auto
    Race Property DeathclawQuantumRace Auto
    Race Property GatorclawRace Auto
    Race Property GhoulrillaRace Auto
    Race Property RatRace Auto
    Race Property SwarmRace Auto
EndGroup

Int indexMinFLST
Int indexMaxFLST
Int predeterminedValue

Event OnEffectStart(actor akTarget, actor akCaster)
    If BoolTracker.EnableSCOURGE == True
        If akTarget.GetRace() == AnimatronicAlienRace
            indexMinFLST = 0
            indexMaxFLST = 1
            ;---------------------------------------------------------------------
            If NukaWorld_BoolTracker.AnimatronicAlienHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If NukaWorld_BoolTracker.AnimatronicAlienInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If NukaWorld_BoolTracker.AnimatronicAlienDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If NukaWorld_BoolTracker.AnimatronicAlienEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If NukaWorld_BoolTracker.AnimatronicAlienSpeedMult == True && NukaWorld_BoolTracker.AnimatronicAlienInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == AntRace
            indexMinFLST = 2
            indexMaxFLST = 3
            ;---------------------------------------------------------------------
            If NukaWorld_BoolTracker.AntHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If NukaWorld_BoolTracker.AntInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If NukaWorld_BoolTracker.AntDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If NukaWorld_BoolTracker.AntEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If NukaWorld_BoolTracker.AntSpeedMult == True && NukaWorld_BoolTracker.AntInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == BloodwormRace
            indexMinFLST = 4
            indexMaxFLST = 5
            ;---------------------------------------------------------------------
            If NukaWorld_BoolTracker.BloodwormHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If NukaWorld_BoolTracker.BloodwormInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If NukaWorld_BoolTracker.BloodwormDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If NukaWorld_BoolTracker.BloodwormEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If NukaWorld_BoolTracker.BloodwormSpeedMult == True && NukaWorld_BoolTracker.BloodwormInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == BrahmiluffRace
            indexMinFLST = 6
            indexMaxFLST = 7
            ;---------------------------------------------------------------------
            If NukaWorld_BoolTracker.BrahmiluffHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If NukaWorld_BoolTracker.BrahmiluffInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If NukaWorld_BoolTracker.BrahmiluffDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If NukaWorld_BoolTracker.BrahmiluffEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If NukaWorld_BoolTracker.BrahmiluffSpeedMult == True && NukaWorld_BoolTracker.BrahmiluffInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == CricketRace
            indexMinFLST = 8
            indexMaxFLST = 9
            ;---------------------------------------------------------------------
            If NukaWorld_BoolTracker.CricketHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If NukaWorld_BoolTracker.CricketInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If NukaWorld_BoolTracker.CricketDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If NukaWorld_BoolTracker.CricketEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If NukaWorld_BoolTracker.CricketSpeedMult == True && NukaWorld_BoolTracker.CricketInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == DeathclawQuantumRace
            ;---------------------------------------------------------------------
            If NukaWorld_BoolTracker.DeathclawQuantumHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If NukaWorld_BoolTracker.DeathclawQuantumInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If NukaWorld_BoolTracker.DeathclawQuantumDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If NukaWorld_BoolTracker.DeathclawQuantumEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If NukaWorld_BoolTracker.DeathclawQuantumSpeedMult == True && NukaWorld_BoolTracker.DeathclawQuantumInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == GatorclawRace
            indexMinFLST = 12
            indexMaxFLST = 13
            ;---------------------------------------------------------------------
            If NukaWorld_BoolTracker.GatorclawHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If NukaWorld_BoolTracker.GatorclawInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If NukaWorld_BoolTracker.GatorclawDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If NukaWorld_BoolTracker.GatorclawEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If NukaWorld_BoolTracker.GatorclawSpeedMult == True && NukaWorld_BoolTracker.GatorclawInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == GhoulrillaRace
            indexMinFLST = 14
            indexMaxFLST = 15
            ;---------------------------------------------------------------------
            If NukaWorld_BoolTracker.GhoulrillaHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If NukaWorld_BoolTracker.GhoulrillaInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If NukaWorld_BoolTracker.GhoulrillaDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If NukaWorld_BoolTracker.GhoulrillaEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If NukaWorld_BoolTracker.GhoulrillaSpeedMult == True && NukaWorld_BoolTracker.GhoulrillaInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == RatRace
            indexMinFLST = 16
            indexMaxFLST = 17
            ;---------------------------------------------------------------------
            If NukaWorld_BoolTracker.RatHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If NukaWorld_BoolTracker.RatInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If NukaWorld_BoolTracker.RatDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If NukaWorld_BoolTracker.RatEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If NukaWorld_BoolTracker.RatSpeedMult == True && NukaWorld_BoolTracker.RatInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == SwarmRace
            indexMinFLST = 18
            indexMaxFLST = 19
            ;---------------------------------------------------------------------
            If NukaWorld_BoolTracker.SwarmHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If NukaWorld_BoolTracker.SwarmInfluence == False
                        akTarget.SetValue(HealthAV, GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                        akTarget.SetValue(SpeedMultAV, GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If NukaWorld_BoolTracker.SwarmDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If NukaWorld_BoolTracker.SwarmEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If NukaWorld_BoolTracker.SwarmSpeedMult == True && NukaWorld_BoolTracker.SwarmInfluence == False
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