Scriptname SCOURGE_Reroll Extends ActiveMagicEffect
{this script is used to allow the player to reroll and NPC's stats}

Group ActorValues
    ActorValue Property HealthAV Auto
    ActorValue Property DamageResistAV Auto
    ActorValue Property EnergyResistAV Auto
    ActorValue Property SpeedMultAV Auto
EndGroup

Group Keywords
    Keyword Property DisableRecalculationKeyword Auto
    Keyword Property DisableHealthKeyword Auto
    Keyword Property DisableDamageResistKeyword Auto
    Keyword Property DisableEnergyResistKeyword Auto
    Keyword Property DisableSpeedMultKeyword Auto
EndGroup

Group Magic
    Spell Property RecalculationSpell Auto
    Spell Property RerollSpell Auto
EndGroup

string KeywordsList = "Keywords found:"
bool KeywordsFound = False

Event OnEffectStart(actor akTarget, actor akCaster)
    ; check and tell the player if the NPC has any disabler keywords
    Debug.Notification("Start")
    If akTarget.HasKeyword(DisableHealthKeyword) == True
        KeywordsList = KeywordsList + "  Health"
        KeywordsFound = True
    EndIf
    If akTarget.HasKeyword(DisableDamageResistKeyword) == True
        KeywordsList = KeywordsList + "  DamageResist"
        KeywordsFound = True
    EndIf
    If akTarget.HasKeyword(DisableEnergyResistKeyword) == True
        KeywordsList = KeywordsList + "  EnergyResist"
        KeywordsFound = True
    EndIf
    If akTarget.HasKeyword(DisableSpeedMultKeyword) == True
        KeywordsList = KeywordsList + "  SpeedMult"
        KeywordsFound = True
    EndIf
    If KeywordsFound == True
        Debug.Notification(KeywordsFound)
    EndIf
    ;/ if the NPC has been affected before, then we want to remove this
    keyword as it will block the spell from being attached again. If perchance
    the NPC just bugged out and didn't get the spell, we don't need to remove
    the keyword as it does not exist. /;
    If akTarget.HasKeyword(DisableRecalculationKeyword) == True
        akTarget.RemoveKeyword(DisableRecalculationKeyword)
    EndIf
    ; we tell the player what the old stats were
    Debug.Notification("Old --- H: " + akTarget.GetValue(HealthAV) as int + " • DR: " + akTarget.GetValue(DamageResistAV) as int + " • ER: " + akTarget.GetValue(EnergyResistAV) as int + " • SM: " + akTarget.GetValue(SpeedMultAV) as int)
    ; then we add the spell again which will refresh the NPC's stats
    akTarget.AddSpell(RecalculationSpell)
    ;/ we tell the player to wait and give the main script some time to go over
    the NPC again and change its stats. /;
    Debug.Notification("Please wait...")
    Utility.Wait(2)
    ; we tell the player what the new stats are
    Debug.Notification("New --- H: " + akTarget.GetValue(HealthAV) as int + " • DR: " + akTarget.GetValue(DamageResistAV) as int + " • ER: " + akTarget.GetValue(EnergyResistAV) as int + " • SM: " + akTarget.GetValue(SpeedMultAV) as int)
    akTarget.RemoveSpell(RerollSpell)
EndEvent