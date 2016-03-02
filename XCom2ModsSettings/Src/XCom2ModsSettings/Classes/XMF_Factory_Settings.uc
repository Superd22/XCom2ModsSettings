//---------------------------------------------------------------------------------------
//  *********   XCom2ModsSettings   ******************
//  FILE:    XMF_Factory_Settings.uc
//  AUTHOR:  Super d
//  PURPOSE: Factory for XMF_Settings, expects an XMF_Class and populate its Settings
//---------------------------------------------------------------------------------------
class XMF_Factory_Settings extends Object config(XMF_Settings);

struct XMF_aSetting {				
	var config name ClassName;
	var config name type;
	var config name variable;
	var config name label;
	var config name tooltip;
};

	// @param array<XMF_aSetting> the global settings declared by all mods.
var config array<XMF_aSetting> Settings;
	// @param array<XMF_aSetting> an array of setting we found and want to delete.
var array<XMF_aSetting> SettingsToDelete;


// Look through all the XMF_aSettings to find the one relevant to the current class
// And adds XMF_Settings to the Settings member of the class.
// @param XMF_Class ZeClass Class we're looking for.
function findSettings(XMF_Class ZeClass) {	 
	 
	 local XMF_Setting Setting;	
	 local XMF_aSetting A;

	`Log("XMF: LOOKING FOR SETTINGS" @ ZeClass.ClassName);	

	foreach Settings(A) {    
	`Log("XMF: COMPARING" @ A.ClassName @ "WITH" @ ZeClass.ClassName);						
	 
		if(A.ClassName == ZeClass.ClassName) {
			Setting = new class'XMF_Setting';
			Setting.InitSetting(A.ClassName, A.type, A.variable, A.label, A.tooltip);

			ZeClass.Settings.AddItem(Setting);
		}
		else continue;
	}

	CleanSettings();
}

// Will clean-up the settings so we don't iterate over settings we found a mod for.
function CleanSettings() {
	local XMF_aSetting Setting;

	foreach SettingsToDelete(Setting) {
		// Removes via linear search because index would break everything for n=2
		Settings.RemoveItem(Setting);
	}

	// Cleanup the delete array.
	SettingsToDelete.Remove(0, SettingsToDelete.Length);
}
