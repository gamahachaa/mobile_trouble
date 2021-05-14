package;

import capture.IsTicketOpened;
import capture.WhereAreU;
import js.Browser;
import tstool.layout.UI;
import tstool.process.ActionRadios;
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
class Intro extends ActionRadios
{
	public static inline var ISSUE:String = "Issue";
	public static inline var NO_CALLS:String = "NoCalls";
	public static inline var BAD_CALL_QUALITY:String = "BadCalls";
	public static inline var DROP_CALLS:String = "DropCalls";
	public static inline var NO_INTERNET:String = "NoInternet";
	public static inline var SLOW_INTERNET:String = "SlowInternet";
	public static inline var NO_INTL_CALLS:String = "NoIntlCalls";
	public static inline var REF_600:String = "NumberWronglyDisplayedAbroad";

	public function new() 
	{
		super(
		[
			{
				title: ISSUE,
				hasTranslation:true,
				values: [NO_CALLS, BAD_CALL_QUALITY, DROP_CALLS, NO_INTERNET, SLOW_INTERNET, NO_INTL_CALLS, REF_600]
			}
		]
		);
		
	}
	override public function onClick():Void
	{
		this._nexts = [{step:  getNext(), params: []}];
		if(validate())
			super.onClick();
	}
	inline function getNext():Class<Process>{
		return IsTicketOpened;
	}
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
}