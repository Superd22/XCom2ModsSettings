//---------------------------------------------------------------------------------------
//  *********   XCom2ModsSettings   ******************
//  FILE:    XMF_Settings.uc
//  AUTHOR:  Super d
//  PURPOSE: The base class for a Setting item, handles all the logic.
//---------------------------------------------------------------------------------------
class XMF_Setting extends Object;

//-----------------------------------------
//	Main Members
//-----------------------------------------
	//@param name the name of the class this setting is in.
var name ClassName;
	//@param name the type of variable this setting is
var name Type;
	//@param name the name of the variable to change
var name Variable;
	//@param name the localised variable for a label name
var name Label;
	//@param name the localised variable for a tooltip
var name Tooltip

// Initialise the main members
function InitSetting(name CName, name Tpe, name varb, name lab, name toolt) {
	ClassName = CName;

	// TO DO : typecast all those.
	Type = Tpe;
	Variable = varb;
	Label = lab;
	ToolTip = toolt;

	`Log("XMF: CREATED SETTING FOR " @ ClassName @ ":" @ type @ Variable);	
}