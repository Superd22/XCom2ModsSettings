//---------------------------------------------------------------------------------------
//  *********   XCom2ModsSettings   ******************
//  FILE:    XMF_Factory_Classes.uc
//  AUTHOR:  Super d
//  PURPOSE: Factory for XMF_Class, reads the ini and generates classes and calls for 
//	settings 
//---------------------------------------------------------------------------------------
class XMF_Factory_Classes extends Object config(XMF_Mods);

struct XMF_aClass {				   
	var config string ModName;
	var config name ClassName;
	var config bool ParseUnDeclared;
	var config name ClassDescription;
};

	//@param array<XMF_aClass> global array containing all the classes declared by mods in the ini.
var config array<XMF_aClass> Classes;
	//@param XMF_Factory_Settings The settings factory -held here for performance-
var XMF_Factory_Settings SettingFactory; 


// Inits the factory
function InitFactory() {
	SettingFactory = new class'XMF_Factory_Settings';
}


// Loops through the config classes and creates the relevant
// XMF_Classes
function findMods() {	 
	local XMF_aClass A;
	local XMF_Class ModClass;			
	 	 
		`Log("XMF: LOOKING");	

	foreach Classes(A) {    					 
		`Log("XMF: CREATING" @ A.ModName);		 

		ModClass = new class'XMF_Class';
		ModClass.InitClass(A.ModName, A.ClassName);

		SettingFactory.findSettings(ModClass);
	}

}