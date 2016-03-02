//---------------------------------------------------------------------------------------
//  *********   XCom2ModsSettings   ******************
//  FILE:    UIOptionsPCMods.uc
//  AUTHOR:  Super d
//  PURPOSE: The UIScreen displaying the main settings menu for mods.
//	Generates a list of mods on the side and their settings on the right.
//---------------------------------------------------------------------------------------
class UIOptionsPCMods extends UIScreen;
 									 
//-----------------------------------------
//	Logic Items
//-----------------------------------------
 	//@param XMF_Factory_Classes The class Factory
var XMF_Factory_Classes Factory;

//-----------------------------------------
//	UI Items
//-----------------------------------------
	//@param UIImage MainBackground (contains all over UI element)
var UIImage Main;
	//@param Mask Masking the unsused background.
var UIMask Mask;
	//@param UIText The title of the page
var UIText Title;
	//@param UIText The title of the current tab (=mod)
var UIText SecondaryTitle;
	//@param UIList The list of detected/supported mods
var UIList ModList;		
	//@param UIList the current list of settings
var UIList SettingsList;
										  
//-----------------------------------------
//	Localization
//-----------------------------------------
	//@param string "XMF's Mods Settings"
var localized string m_xmfSettingsTitle;

//-----------------------------------------
//	DISPLAY OPTIONS
//-----------------------------------------
	//@const int Base X of the screen
const BASE_X = 125;	   
	//@const int Base Y of the screen
const BASE_Y = 125;
	//@const int Base width of the screen
const WIDTH = 846;
	//@const int Base height of the screen
const HEIGHT = 771;

// Initalise the screen, creates all the relevant UI.
simulated function InitScreen(XComPlayerController InitController, UIMovie InitMovie, optional name InitName) {
	super.InitScreen(InitController, InitMovie, InitName);

	//img:///XMFPackage.gfx.aSection
	Main = Spawn(class'UIImage', self);
	Main.InitImage('XMF_Background', "img:///XMFPackage.gfx.mainbg");
	Main.SetPosition(BASE_X, BASE_Y);

	Mask = Spawn(class'UIMask', Main);
	Mask.InitMask('XMF_MASK', Main,,, WIDTH, HEIGHT);

	Title = Spawn(class'UIText', Main);
	Title.InitText('XMF_Title',class'UIUtilities_Text'.static.StyleText("XMF's Mods Settings", eUITextStyle_Tooltip_Title));
	Title.SetPosition(11,21);

	PopulateData();
}


// Populates the data, generates mods list, creates factories.
simulated function PopulateData() {
	Factory = new class'XMF_Factory_Classes';
	Factory.InitFactory();

	Factory.findMods();
}

// Catch callback for exiting
//@param int cmd the button pressed
//@param int arg ??
//@return true 
simulated function bool OnUnrealCommand(int cmd, int arg)
{

	if ( !CheckInputIsReleaseOrDirectionRepeat(cmd, arg) )
		return true;

	switch( cmd )
	{
		case class'UIUtilities_Input'.const.FXS_BUTTON_B:
		case class'UIUtilities_Input'.const.FXS_KEY_ESCAPE:
		case class'UIUtilities_Input'.const.FXS_R_MOUSE_DOWN:
		case class'UIUtilities_Input'.const.FXS_BUTTON_A:
		case class'UIUtilities_Input'.const.FXS_KEY_ENTER:
		case class'UIUtilities_Input'.const.FXS_KEY_SPACEBAR:
			CloseScreen();
			break;
	}

	return true; // consume all input
}