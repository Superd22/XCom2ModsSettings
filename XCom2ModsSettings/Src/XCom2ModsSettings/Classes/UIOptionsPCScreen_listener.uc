//---------------------------------------------------------------------------------------
//  *********   XCom2ModsSettings   ******************
//  FILE:    UIOptionsPCScreen_listener.uc
//  AUTHOR:  Super d
//  PURPOSE: UIScreenListener to add a button triggering our new mods options.
//	Listens for UIOptionsPCScreen
//---------------------------------------------------------------------------------------
class UIOptionsPCScreen_listener extends UIScreenListener;

	//@param UIOptionsPCScreen The current screen 
var UIOptionsPCScreen Options;
	//@param UIButton the button to go to mods settings.
var UIButton ModOptions;

// Sets main member and add the buttons
// @param UIScreen Screen the current screen, then typecast to UIOptionsPCScreen
event OnInit(UIScreen Screen)
{
	Options = UIOptionsPCScreen(Screen);

	AddModButton();
}

// Adds the main button going to Mods Settings
function AddModButton() {
	`Log("XMF: BUTTONfd");

	ModOptions = Options.Spawn(class'UIButton', Options);
	ModOptions.InitButton(, "OPTIONS MODS", ToggleModOptionScreen);
	ModOptions.SetPosition(100, 800);
}

//Callback function when the button is clicked,
//Hides the option and shows Mods Settings
//@param UIbutton Button the button just pressed
function ToggleModOptionScreen(UIButton Button) {	 
	local UIScreenStack ScreenStack;
	local UIAvengerHUD AvengerHUDScreen;
	local UIOptionsPCMods OptionModScreen;

	ScreenStack = `SCREENSTACK;
	OptionModScreen = UIOptionsPCMods(ScreenStack.GetScreen(class'UITechTreeScreen'));

	Options.Movie.Stack.Push(Options.Movie.Pres.Spawn(class'UIOptionsPCMods', Options.Movie.Pres));
}


defaultproperties
{
	ScreenClass=class'UIOptionsPCScreen'
}