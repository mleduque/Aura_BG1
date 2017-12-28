BEGIN C0AUIN3

IF ~IsGabber("C0Aura")~ THEN BEGIN a0
SAY ~The automaton stands at attention.~
+ ~OR(2)
Global("RuneCooldown","LOCALS",0)
GlobalTimerExpired("RuneCooldown","LOCALS")~ + ~Imbue Rune.~ DO ~RemoveFamiliar()~ + a0.1 
++ ~Open inventory.~ DO ~StartStore("C0AUTINV",Lasttalkedtoby(Myself))~ EXIT
++ ~Dismantle.~ DO ~Kill(Myself)~ EXIT
+ ~Global("C0MurasameAI","GLOBAL",0)~ + ~Disable self-defense protocol.~ + disableAI
+ ~Global("C0MurasameAI","GLOBAL",1)~ + ~Enable self-defense protocol.~ + enableAI
++ ~Exit~ EXIT
END 

IF ~~ disableAI
SAY ~Self-defense protocol deactivated. The automaton will no longer take action of its own accord except for following and protecting its creator.~
IF ~~ DO ~SetGlobal("C0MurasameAI","GLOBAL",1)~ EXIT
END

IF ~~ enableAI
SAY ~Self-defense protocol activated. The automaton will defend itself and its creator from all hostiles.~
IF ~~ DO ~SetGlobal("C0MurasameAI","GLOBAL",0)~ EXIT
END

IF ~~ a0.1
SAY ~The automaton may have its abilities enhanced by imbuing an arcane rune upon it. After a rune has been applied, a full turn must pass before it can be done again.~
+ ~OR(5)
HasItem("c0rune1a",Lasttalkedtoby(Myself))
HasItem("c0rune2a",Lasttalkedtoby(Myself))
HasItem("c0rune2e",Lasttalkedtoby(Myself))
HasItem("c0rune3a",Lasttalkedtoby(Myself))
HasItem("c0rune4a",Lasttalkedtoby(Myself))~ + ~Insert a Fire Rune.~ + a1
+ ~OR(2)
HasItem("c0rune1b",Lasttalkedtoby(Myself))
HasItem("c0rune4b",Lasttalkedtoby(Myself))~ + ~Insert an Ice Rune.~ + a2
+ ~OR(3)
HasItem("c0rune1c",Lasttalkedtoby(Myself))
HasItem("c0rune3c",Lasttalkedtoby(Myself))
HasItem("c0rune4c",Lasttalkedtoby(Myself))~ + ~Insert an Arcane Rune.~ + a3
+ ~OR(4)
HasItem("c0rune1d",Lasttalkedtoby(Myself))
HasItem("c0rune2c",Lasttalkedtoby(Myself))
HasItem("c0rune2h",Lasttalkedtoby(Myself))
HasItem("c0rune3d",Lasttalkedtoby(Myself))~ + ~Insert an Illusion Rune.~ + a4
+ ~HasItem("c0rune3b",Lasttalkedtoby(Myself))~ + ~Insert an Earth Rune.~ + a5
+ ~HasItem("c0rune2g",Lasttalkedtoby(Myself))~ + ~Insert a Time Rune.~ + a6
+ ~HasItem("c0rune2b",Lasttalkedtoby(Myself))~ + ~Insert a Strength Rune.~ + a7
+ ~OR(2)
HasItem("c0rune1e",Lasttalkedtoby(Myself))
HasItem("c0rune2f",Lasttalkedtoby(Myself))~ + ~Insert a Lightning Rune.~ + a8
+ ~OR(3)
HasItem("c0rune1f",Lasttalkedtoby(Myself))
HasItem("c0rune3f",Lasttalkedtoby(Myself))
HasItem("c0rune4e",Lasttalkedtoby(Myself))~ + ~Insert a Shield Rune.~ + a9
+ ~HasItem("c0rune2d",Lasttalkedtoby(Myself))~ + ~Insert a Dust Rune.~ + a10
+ ~OR(2)
HasItem("c0rune3e",Lasttalkedtoby(Myself))
HasItem("c0rune4d",Lasttalkedtoby(Myself))~ + ~Insert a Scrying Rune.~ + a11
++ ~Don't insert any runes.~ DO ~AddFamiliar()~ EXIT
END

IF ~~ a1
SAY ~Fire Runes enhance the automaton with heat and flame, providing it with immunity to fire damage. Additionally, the automaton's attacks become enchanted weapons and deal bonus fire damage on hit. Duration: 1 turn

Which Fire Rune shall be inserted?~
+ ~HasItem("c0rune1a",Lasttalkedtoby(Myself))~ + ~Minor Fire Rune: +1d2 fire damage, +1 enchantment bonus~ DO ~ActionOverride(Myself,TakePartyItemNum("c0rune1a",1)) ActionOverride(Myself,DestroyItem("c0rune1a")) SetGlobalTimer("RuneCooldown","LOCALS",60) ReallyForceSpellRES("c0afire1",Myself) AddFamiliar()~ EXIT
+ ~HasItem("c0rune2a",Lasttalkedtoby(Myself))~ + ~Lesser Fire Rune: +1d4 fire damage, +2 enchantment bonus~ DO ~ActionOverride(Myself,TakePartyItemNum("c0rune2a",1)) ActionOverride(Myself,DestroyItem("c0rune2a")) SetGlobalTimer("RuneCooldown","LOCALS",60) ReallyForceSpellRES("c0afire2",Myself) AddFamiliar()~ EXIT
+ ~HasItem("c0rune2e",Lasttalkedtoby(Myself))~ + ~Fire Rune: +1d6 fire damage, +3 enchantment bonus~ DO ~ActionOverride(Myself,TakePartyItemNum("c0rune3a",1)) ActionOverride(Myself,DestroyItem("c0rune3a")) SetGlobalTimer("RuneCooldown","LOCALS",60) ReallyForceSpellRES("c0afire3",Myself) AddFamiliar()~ EXIT
+ ~HasItem("c0rune3a",Lasttalkedtoby(Myself))~ + ~Greater Fire Rune: +1d8 fire damage, +4 enchantment bonus~ DO ~ActionOverride(Myself,TakePartyItemNum("c0rune4a",1)) ActionOverride(Myself,DestroyItem("c0rune4a")) SetGlobalTimer("RuneCooldown","LOCALS",60) ReallyForceSpellRES("c0afire4",Myself) AddFamiliar()~ EXIT
+ ~HasItem("c0rune4a",Lasttalkedtoby(Myself))~ + ~Perfect Fire Rune: +1d10 fire damage, +5 enchantment bonus~ DO ~ActionOverride(Myself,TakePartyItemNum("c0rune5a",1)) ActionOverride(Myself,DestroyItem("c0rune5a")) SetGlobalTimer("RuneCooldown","LOCALS",60) ReallyForceSpellRES("c0afire5",Myself) AddFamiliar()~ EXIT
++ ~Go back.~ + a0.1
++ ~Don't insert any runes.~ DO ~AddFamiliar()~ EXIT
END

IF ~~ a2
SAY ~Ice Runes enhance the automaton with extreme cold, providing it with immunity to cold damage and causing it to emanate a cold aura that affects all nearby creatures. Duration: 1 turn

Which Ice Rune shall be inserted?~
+ ~HasItem("c0rune1b",Lasttalkedtoby(Myself))~ + ~Minor Ice Rune: -1 to Armor Class, THAC0 and damage~ DO ~ActionOverride(Myself,TakePartyItemNum("c0rune1b",1)) ActionOverride(Myself,DestroyItem("c0rune1b")) SetGlobalTimer("RuneCooldown","LOCALS",60) ReallyForceSpellRES("c0acold1",Myself) AddFamiliar()~ EXIT
+ ~HasItem("c0rune4b",Lasttalkedtoby(Myself))~ + ~Perfect Ice Rune: -3 to Armor Class, THAC0 and damage, Slow~ DO ~ActionOverride(Myself,TakePartyItemNum("c0rune4b",1)) ActionOverride(Myself,DestroyItem("c0rune4b")) SetGlobalTimer("RuneCooldown","LOCALS",60) ReallyForceSpellRES("c0acold2",Myself) AddFamiliar()~ EXIT
++ ~Go back.~ + a0.1
++ ~Don't insert any runes.~ DO ~AddFamiliar()~ EXIT
END

IF ~~ a3
SAY ~Arcane Runes enhance the automaton with resistance to magic and provides it with immunity to a limited number spells below a certain level. Duration: 1 turn

Which Arcane Rune shall be inserted?~
+ ~HasItem("c0rune1c",Lasttalkedtoby(Myself))~ + ~Minor Arcane Rune: +10% magic resistance, absorbs one spell of 2nd level and below~ DO ~ActionOverride(Myself,TakePartyItemNum("c0rune1c",1)) ActionOverride(Myself,DestroyItem("c0rune1c")) SetGlobalTimer("RuneCooldown","LOCALS",60) ReallyForceSpellRES("c0amagi1",Myself) AddFamiliar()~ EXIT
+ ~HasItem("c0rune3c",Lasttalkedtoby(Myself))~ + ~Greater Arcane Rune: +30% magic resistance, absorbs two spells of 4th level and below~ DO ~ActionOverride(Myself,TakePartyItemNum("c0rune3c",1)) ActionOverride(Myself,DestroyItem("c0rune3c")) SetGlobalTimer("RuneCooldown","LOCALS",60) ReallyForceSpellRES("c0amagi2",Myself) AddFamiliar()~ EXIT
+ ~HasItem("c0rune4c",Lasttalkedtoby(Myself))~ + ~Perfect Arcane Rune: +40% magic resistance, absorbs three spells of 6th level and below~ DO ~ActionOverride(Myself,TakePartyItemNum("c0rune4c",1)) ActionOverride(Myself,DestroyItem("c0rune4c")) SetGlobalTimer("RuneCooldown","LOCALS",60) ReallyForceSpellRES("c0amagi3",Myself) AddFamiliar()~ EXIT
++ ~Go back.~ + a0.1
++ ~Don't insert any runes.~ DO ~AddFamiliar()~ EXIT
END

IF ~~ a4
SAY ~Illusion Runes enhance the automaton with magical illusions, providing it with various illusory effects. Duration: Special

Which Illusion Rune shall be inserted?~
+ ~HasItem("c0rune1d",Lasttalkedtoby(Myself))~ + ~Minor Illusion Rune: Reflected Image~ DO ~ActionOverride(Myself,TakePartyItemNum("c0rune1d",1)) ActionOverride(Myself,DestroyItem("c0rune1d")) SetGlobalTimer("RuneCooldown","LOCALS",60) ReallyForceSpellRES("spwi120",Myself) AddFamiliar()~ EXIT
+ ~HasItem("c0rune2c",Lasttalkedtoby(Myself))~ + ~Lesser Illusion Rune: Blur~ DO ~ActionOverride(Myself,TakePartyItemNum("c0rune2c",1)) ActionOverride(Myself,DestroyItem("c0rune2c")) SetGlobalTimer("RuneCooldown","LOCALS",60) ReallyForceSpellRES("spwi201",Myself) AddFamiliar()~ EXIT
+ ~HasItem("c0rune2h",Lasttalkedtoby(Myself))~ + ~Illusion Rune: Mirror Image~ DO ~ActionOverride(Myself,TakePartyItemNum("c0rune2h",1)) ActionOverride(Myself,DestroyItem("c0rune2h")) SetGlobalTimer("RuneCooldown","LOCALS",60) ReallyForceSpellRES("spwi212",Myself) AddFamiliar()~ EXIT
+ ~HasItem("c0rune3d",Lasttalkedtoby(Myself))~ + ~Greater Illusion Rune: Improved Invisibility~ DO ~ActionOverride(Myself,TakePartyItemNum("c0rune3d",1)) ActionOverride(Myself,DestroyItem("c0rune3d")) SetGlobalTimer("RuneCooldown","LOCALS",60) ReallyForceSpellRES("spwi405",Myself) AddFamiliar()~ EXIT
++ ~Go back.~ + a0.1
++ ~Don't insert any runes.~ DO ~AddFamiliar()~ EXIT
END

IF ~~ a5
SAY ~Earth Runes bolster the automaton's durability, increasing its resistance to all physical damage. Duration: 1 turn

Which Earth Rune shall be inserted?~
+ ~HasItem("c0rune3b",Lasttalkedtoby(Myself))~ + ~Greater Earth Rune: +30% resistance to crushing, slashing, piercing and missile damage.~ DO ~ActionOverride(Myself,TakePartyItemNum("c0rune3b",1)) ActionOverride(Myself,DestroyItem("c0rune3b")) SetGlobalTimer("RuneCooldown","LOCALS",60) ReallyForceSpellRES("c0aearth",Myself) AddFamiliar()~ EXIT
++ ~Go back.~ + a0.1
++ ~Don't insert any runes.~ DO ~AddFamiliar()~ EXIT
END

IF ~~ a6
SAY ~Time Runes enhance the automaton with increased speed, allowing it to act with greater celerity. Duration: 1 turn

Which Time Rune shall be inserted?~
+ ~HasItem("c0rune2g",Lasttalkedtoby(Myself))~ + ~Time Rune: Haste (self only)~ DO ~ActionOverride(Myself,TakePartyItemNum("c0rune2g",1)) ActionOverride(Myself,DestroyItem("c0rune2g")) SetGlobalTimer("RuneCooldown","LOCALS",60) ReallyForceSpellRES("c0atime1",Myself) AddFamiliar()~ EXIT
++ ~Go back.~ + a0.1
++ ~Don't insert any runes.~ DO ~AddFamiliar()~ EXIT
END

IF ~~ a7
SAY ~Strength Runes enhance the automaton's physical prowess, allowing to strike harder and more accurately. Duration: 1 turn

Which Strength Rune shall be inserted?~
+ ~HasItem("c0rune2b",Lasttalkedtoby(Myself))~ + ~Strength Rune: +2 bonus to THAC0 and damage~ DO ~ActionOverride(Myself,TakePartyItemNum("c0rune2b",1)) ActionOverride(Myself,DestroyItem("c0rune2b")) SetGlobalTimer("RuneCooldown","LOCALS",60) ReallyForceSpellRES("c0astre1",Myself) AddFamiliar()~ EXIT
++ ~Go back.~ + a0.1
++ ~Don't insert any runes.~ DO ~AddFamiliar()~ EXIT
END

IF ~~ a8
SAY ~Lightning Runes charge the automaton, healing it and allowing it to launch bolts of lightning. Duration: Permanent

Which Lightning Rune shall be inserted?~
+ ~HasItem("c0rune1e",Lasttalkedtoby(Myself))~ + ~Minor Lightning Rune: Restore 30% of maximum hit points, next attack launches a lightning bolt dealing 3d6+3 electrical damage to all targets in a line~ DO ~ActionOverride(Myself,TakePartyItemNum("c0rune1e",1)) ActionOverride(Myself,DestroyItem("c0rune1e")) SetGlobalTimer("RuneCooldown","LOCALS",60) ReallyForceSpellRES("c0aligh1",Myself) AddFamiliar()~ EXIT
+ ~HasItem("c0rune2f",Lasttalkedtoby(Myself))~ + ~Lightning Rune: Restore 50% of maximum hit points, next three attacks launch a lightning bolt dealing 3d6+3 electrical damage to all targets in a line~ DO ~ActionOverride(Myself,TakePartyItemNum("c0rune2f",1)) ActionOverride(Myself,DestroyItem("c0rune2f")) SetGlobalTimer("RuneCooldown","LOCALS",60) ReallyForceSpellRES("c0aligh2",Myself) AddFamiliar()~ EXIT
++ ~Go back.~ + a0.1
++ ~Don't insert any runes.~ DO ~AddFamiliar()~ EXIT
END

IF ~~ a9
SAY ~Shield Runes enhance the automaton's defenses, increasing its armor class. Duration: 1 turn

Which Shield Rune shall be inserted?~
+ ~HasItem("c0rune1f",Lasttalkedtoby(Myself))~ + ~Minor Shield Rune: +2 to Armor Class~ DO ~ActionOverride(Myself,TakePartyItemNum("c0rune1f",1)) ActionOverride(Myself,DestroyItem("c0rune1f")) SetGlobalTimer("RuneCooldown","LOCALS",60) ReallyForceSpellRES("c0ashie1",Myself) AddFamiliar()~ EXIT
+ ~HasItem("c0rune3f",Lasttalkedtoby(Myself))~ + ~Greater Shield Rune: +4 to Armor Class~ DO ~ActionOverride(Myself,TakePartyItemNum("c0rune3f",1)) ActionOverride(Myself,DestroyItem("c0rune3f")) SetGlobalTimer("RuneCooldown","LOCALS",60) ReallyForceSpellRES("c0ashie2",Myself) AddFamiliar()~ EXIT
+ ~HasItem("c0rune4e",Lasttalkedtoby(Myself))~ + ~Perfect Shield Rune: +8 to Armor Class~ DO ~ActionOverride(Myself,TakePartyItemNum("c0rune4e",1)) ActionOverride(Myself,DestroyItem("c0rune4e")) SetGlobalTimer("RuneCooldown","LOCALS",60) ReallyForceSpellRES("c0ashie3",Myself) AddFamiliar()~ EXIT
++ ~Go back.~ + a0.1
++ ~Don't insert any runes.~ DO ~AddFamiliar()~ EXIT
END

IF ~~ a10
SAY ~Dust Runes enhance the automaton's breath attack, allowing it to release a cloud of dust that blinds all creatures around it. Duration: Permanent until cast

Which Dust Rune shall be inserted?~
+ ~HasItem("c0rune2d",Lasttalkedtoby(Myself))~ + ~Lesser Dust Rune: Blindness (-4 penalty to AC and THAC0) for 5 rounds~ DO ~ActionOverride(Myself,TakePartyItemNum("c0rune2d",1)) ActionOverride(Myself,DestroyItem("c0rune2d")) SetGlobalTimer("RuneCooldown","LOCALS",60) ReallyForceSpellRES("c0adust1",Myself) AddFamiliar()~ EXIT
++ ~Go back.~ + a0.1
++ ~Don't insert any runes.~ DO ~AddFamiliar()~ EXIT
END

IF ~~ a11
SAY ~Scrying Runes enhance the automaton's sight radius and ability to see through illusions. Duration: 1 turn

Which Scrying Rune shall be inserted?~
+ ~HasItem("c0rune3e",Lasttalkedtoby(Myself))~ + ~Greater Scrying Rune: Increased visual range, can attack invisible creatures~ DO ~ActionOverride(Myself,TakePartyItemNum("c0rune3e",1)) ActionOverride(Myself,DestroyItem("c0rune3e")) SetGlobalTimer("RuneCooldown","LOCALS",60) ReallyForceSpellRES("c0ascry1",Myself) AddFamiliar()~ EXIT
+ ~HasItem("c0rune4d",Lasttalkedtoby(Myself))~ + ~Perfect Scrying Rune: Increased visual range, can attack invisible creatures, dispels illusions on successful hit (save vs. spell to avoid)~ DO ~ActionOverride(Myself,TakePartyItemNum("c0rune4d",1)) ActionOverride(Myself,DestroyItem("c0rune4d")) SetGlobalTimer("RuneCooldown","LOCALS",60) ReallyForceSpellRES("c0ascry2",Myself) AddFamiliar()~ EXIT
++ ~Go back.~ + a0.1
++ ~Don't insert any runes.~ DO ~AddFamiliar()~ EXIT
END

IF ~!IsGabber("C0Aura")~ THEN BEGIN b0
SAY ~The automaton ignores you.~
IF ~~ EXIT
END