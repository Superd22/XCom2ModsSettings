//---------------------------------------------------------------------------------------
//  *********   XCom2ModsSettings   ******************
//  FILE:    XMF_Class.uc
//  AUTHOR:  Super d
//  PURPOSE: The base class for a class mod item, handles all the logic.
//---------------------------------------------------------------------------------------
class XMF_Class extends Object;

	//@param string The name of the mod
var string ModName;
	//@param name the name of the class
var name ClassName;
	//@param array< XMF_Setting > the array of the settings for this class
var array< XMF_Setting > Settings;

// Inits the base value for the class
function InitClass(string Mod, name cName) {	
	ClassName = cName;
	ModName = Mod;
}