# XCom2ModsSettings
A main framework for mods to declare settings and user to be able to edit them via the in-game GUI
This is currently in its *very* early stages.

Please see https://www.reddit.com/r/xcom2mods/comments/48a8fs/mod_options_framework/ for the original idea.

## Main Goals
- Mods using the framework should still be usable if the user hasn't downloaded the framework
- Mods maker should be able to very easily declare their mods/options
- Users should be able to declare their settings across many mods
- Users should be able to retain their settings through updates, but be notified of default changes, or new/deprecated settings

## Envisioned Workflow for Mods Developer
After much investigating I don't think the current SDK allows us to be fully automated on this, so  i took a semi-automatic approach.
Modders have two things to declare :
- Mod Classes -> will serve as "category" for a given mod.
  - All classes can be *very* easily declared in a XComXMF_Mods.ini file PER mod.
  - To declare simply add the following :
  - [XCom2ModsSettings.XMF_Factory_Classes]
  .Classes=(ModName="ModName", ClassName=NameOfTheClass)
  
The . means "add another line", so every mod can declare as many classes as they wish.
- Mod Settings -> linked to a Class, they are the actual settings the dev wanna expose
  - All settings can be *very* easily declared in a XComXMF_Settings.ini file PER mod.
  - To declare simply add the following :
  - [XCom2ModsSettings.XMF_Factory_Settings]
  .Settings=(ClassName=ClassNamePreviouslyDeclared, type=VariableType, variable=NameOfTheVariableToExpose)
  
  Again, you can add as many settings as you want per mod and per class
  
This is the bare-bone minimum and should be enough for most mod. Setting will support more options as "label" and "tooltip" which will contain the name of a localised variable to display as title and help tooltip when showing the given setting

More advanced options should be made available too once everything is in order (think slider for an int/float with custom min/max/step per pixel)

## Technical source details
For the devs, that's how i see it as of now :
  - UIOptionsPCScreen_listener listens to the Options menu and adds a button to acess our custom settings
  - UIOptionsPCMods generates the UI to make the setting screen
  - XMF_Factory_Classes is called by UIOptionsPCMods and iterates over all the classes declared in XComXMF_Mods.ini and generates a XMF_Class
  - XMF_Factory_Settings is a member of XMF_Factory_Classes, it searches for and populate the "Settings" member of a given XMF_Class
  - XMF_Class holds all the logic for the Mod's class handling
  - XMF_Setting holds all the logic for the Mod's class' settings handling
  - UIModClass generates a "category" panel with an UIList of UIModSettings
  - UIModSettings generates the actual input
