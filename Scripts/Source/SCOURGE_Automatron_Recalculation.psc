Scriptname SCOURGE_Automatron_Recalculation Extends ActiveMagicEffect

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

Group BuffGlobals
    GlobalVariable Property BuffHPMin Auto
    GlobalVariable Property BuffHPMax Auto
    GlobalVariable Property BuffDRMin Auto
    GlobalVariable Property BuffDRMax Auto
    GlobalVariable Property BuffERMin Auto
    GlobalVariable Property BuffERMax Auto
    GlobalVariable Property BuffSMMin Auto
    GlobalVariable Property BuffSMMax Auto
EndGroup

Group Magic
    Spell Property RecalculationSpell Auto
EndGroup

Group Scripts
    SCOURGE_BoolTracker Property BoolTracker Auto Mandatory
    SCOURGE_Automatron_BoolTracker Property Automatron_BoolTracker Auto Mandatory
EndGroup 

Group Races
    Race Property AssaultronRace Auto
    Race Property EyebotRace Auto
    Race Property MrHandyRace Auto
    Race Property Automatron_MrHandyRace Auto
    Race Property ProtectronRace Auto
    Race Property RobobrainRace Auto
    Race Property SentryBotRace Auto
EndGroup

Int indexMinFLST
Int indexMaxFLST
Int predeterminedValue

Event OnEffectStart(actor akTarget, actor akCaster)
    If BoolTracker.EnableSCOURGE == True
        ;/ AUTOMATRON ONLY
        to make them stronger than vanilla variants, we give them a
        buff to their stats based on the values that the player has
        chosen in the MCM. These will multiply the value gained using
        the sliders of vanilla NPCs. /;
        Float HealthBuff = GenerateRandom(BuffHPMin.GetValue(), BuffHPMax.GetValue())
        Float DamageResistBuff = GenerateRandom(BuffDRMin.GetValue(), BuffDRMax.GetValue())
        Float EnergyResistBuff = GenerateRandom(BuffERMin.GetValue(), BuffERMax.GetValue())
        Float SpeedMultBuff = GenerateRandom(BuffSMMin.GetValue(), BuffSMMax.GetValue())
        If akTarget.GetRace() == AssaultronRace
            indexMinFLST = 2
            indexMaxFLST = 3
            ;---------------------------------------------------------------------
            If BoolTracker.AssaultronHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If BoolTracker.AssaultronInfluence == False
                        akTarget.SetValue(HealthAV, Math.Floor((GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) * HealthBuff) + 0.5))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, Math.Floor((GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) * HealthBuff) + 0.5))
                        akTarget.SetValue(SpeedMultAV, Math.Floor((GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) * SpeedMultBuff) + 0.5))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.AssaultronDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, Math.Floor(((GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV)) * DamageResistBuff) + 0.5))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.AssaultronEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, Math.Floor((GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) * EnergyResistBuff) + 0.5))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.AssaultronSpeedMult == True && BoolTracker.AssaultronInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, Math.Floor((GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) * SpeedMultBuff) + 0.5 ))
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
                        akTarget.SetValue(HealthAV, Math.Floor((GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) * HealthBuff) + 0.5))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, Math.Floor((GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) * HealthBuff) + 0.5))
                        akTarget.SetValue(SpeedMultAV, Math.Floor((GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) * SpeedMultBuff) + 0.5))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.EyebotDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, Math.Floor(((GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV)) * DamageResistBuff) + 0.5))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.EyebotEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, Math.Floor((GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) * EnergyResistBuff) + 0.5))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.EyebotSpeedMult == True && BoolTracker.EyebotInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, Math.Floor((GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) * SpeedMultBuff) + 0.5 ))
                EndIf
            EndIf
            ;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        ElseIf akTarget.GetRace() == MrHandyRace || akTarget.GetRace() == Automatron_MrHandyRace
            indexMinFLST = 40
            indexMaxFLST = 41
            ;---------------------------------------------------------------------
            If BoolTracker.MrHandyHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If BoolTracker.MrHandyInfluence == False
                        akTarget.SetValue(HealthAV, Math.Floor((GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) * HealthBuff) + 0.5))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, Math.Floor((GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) * HealthBuff) + 0.5))
                        akTarget.SetValue(SpeedMultAV, Math.Floor((GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) * SpeedMultBuff) + 0.5))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.MrHandyDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, Math.Floor(((GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV)) * DamageResistBuff) + 0.5))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.MrHandyEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, Math.Floor((GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) * EnergyResistBuff) + 0.5))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.MrHandySpeedMult == True && BoolTracker.MrHandyInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, Math.Floor((GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) * SpeedMultBuff) + 0.5 ))
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
                        akTarget.SetValue(HealthAV, Math.Floor((GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) * HealthBuff) + 0.5))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, Math.Floor((GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) * HealthBuff) + 0.5))
                        akTarget.SetValue(SpeedMultAV, Math.Floor((GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) * SpeedMultBuff) + 0.5))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.ProtectronDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, Math.Floor(((GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV)) * DamageResistBuff) + 0.5))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.ProtectronEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, Math.Floor((GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) * EnergyResistBuff) + 0.5))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.ProtectronSpeedMult == True && BoolTracker.ProtectronInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, Math.Floor((GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) * SpeedMultBuff) + 0.5 ))
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
        ElseIf akTarget.GetRace() == SentryBotRace
            indexMinFLST = 52
            indexMaxFLST = 53
            ;---------------------------------------------------------------------
            If BoolTracker.SentryBotHealth == True
                If akTarget.HasKeyword(DisableHealthKeyword) == False
                    If BoolTracker.SentryBotInfluence == False
                        akTarget.SetValue(HealthAV, Math.Floor((GenerateRandom((HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) * HealthBuff) + 0.5))
                    Else
                        predeterminedValue = Utility.RandomInt(0,126)
                        akTarget.SetValue(HealthAV, Math.Floor((GeneratePredetermined(predeterminedValue, (HealthFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (HealthFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) * HealthBuff) + 0.5))
                        akTarget.SetValue(SpeedMultAV, Math.Floor((GeneratePredeterminedInfluence(predeterminedValue, (SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) * SpeedMultBuff) + 0.5))
                    EndIf
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.SentryBotDamageResist == True
                If akTarget.HasKeyword(DisableDamageResistKeyword) == False
                    akTarget.ModValue(DamageResistAV, Math.Floor(((GenerateRandom((DamageResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (DamageResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) - akTarget.GetValue(DamageResistAV)) * DamageResistBuff) + 0.5))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.SentryBotEnergyResist == True
                If akTarget.HasKeyword(DisableEnergyResistKeyword) == False
                    akTarget.SetValue(EnergyResistAV, Math.Floor((GenerateRandom((EnergyResistFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (EnergyResistFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) * EnergyResistBuff) + 0.5))
                EndIf
            EndIf
            ;---------------------------------------------------------------------
            If BoolTracker.SentryBotSpeedMult == True && BoolTracker.SentryBotInfluence == False
                If akTarget.HasKeyword(DisableSpeedMultKeyword) == False
                    akTarget.SetValue(SpeedMultAV, Math.Floor((GenerateRandom((SpeedMultFLST.GetAt(indexMinFLST) as GlobalVariable).GetValue(), (SpeedMultFLST.GetAt(indexMaxFLST) as GlobalVariable).GetValue()) * SpeedMultBuff) + 0.5 ))
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

Float Function GenerateRandom(float afMin, float afMax)
    If afMin == afMax
        Return afMin
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
    ;/ we don't round the value for Automatron as this is
    not the final value that will be used for the stats /;
    return NrmlDistrValue * stdDeviation + Average
EndFunction

Float Function GeneratePredetermined(int afInt, float afMin, float afMax)
    If afMin == afMax
        Return afMin
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
    return NrmlDistrValue * stdDeviation + Average
EndFunction

Float Function GeneratePredeterminedInfluence(int afInt, float afMin, float afMax)
    If afMin == afMax
        Return afMin
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
    return NrmlDistrValue * stdDeviation + Average
EndFunction