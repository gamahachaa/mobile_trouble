package;

import capture.IsTicketOpened;
import capture.WhereAreU;
import js.Browser;
import tstool.layout.UI;
//import js.Browser;
import tstool.MainApp;
//import tstool.layout.UI;
import tstool.process.Action;
import tstool.process.CheckUpdateSub;
import tstool.process.Process;
import tstool.process.Triplet;
//import tstool.process.Process;

/**
 * ...
 * @author bb
 */
class Intro extends Triplet
{

	
	override public function create()
	{
		Main.customer.reset();
		Process.INIT();
		super.create();
		//#if !debug
		Main.VERSION_TRACKER.scriptChangedSignal.add(onNewVersion);
		Main.VERSION_TRACKER.request();
		#if debug
		trace("Showing the new version if any");
		//trace(Main.user.mainLanguage);
		if(Main.DEBUG)
			openSubState(new CheckUpdateSub(UI.THEME.bg));
		
		#else
		
		openSubState(new CheckUpdateSub(UI.THEME.bg));
		#end
	}
	function onNewVersion(needsUpdate:Bool):Void 
	{
		if (needsUpdate)
		{
			Browser.location.reload(true);
		}
		else{
			closeSubState();
		}
	}
	
	override public function onYesClick():Void
	{
		this._nexts = [{step: IsTicketOpened}];
		super.onYesClick();
	}
	
	
	override public function onNoClick():Void
	{
		this._nexts = [{step: IsTicketOpened}];
		super.onNoClick();
	}
	
	override public function onMidClick():Void
	{
		this._nexts = [{step: IsTicketOpened}];
		super.onMidClick();
	}
}