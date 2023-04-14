package;

import capture.IsTicketOpened;
import capture.WhereAreU;
import capture.WhichB2B;
import js.Browser;
import tstool.layout.UI;
//import tstool.process.ActionRadios;
//import tstool.process.DescisionRadios;
import tstool.process.TripletRadios;
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
//class Intro extends ActionRadios
class Intro extends TripletRadios
{
	public static inline var SEGMENT:String = "SEGMENT";
	public static inline var PRICE_PLAN:String = "PP";
	public static inline var B2C:String = "B2C";
	public static inline var GOMO:String = "GoMo";
	public static inline var PORTFOLIO:String = "PORTFOLIO";
	public static inline var SOHO:String = "SOHO";
	public static inline var LARGE:String = "LARGE";
	public static inline var ISSUE:String = "Issue";
	public static inline var NO_CALLS:String = "NoCalls";
	public static inline var NO_CALLS_VOLTE:String = "NoCallsVolte";
	public static inline var BAD_CALL_QUALITY:String = "BadCalls";
	//public static inline var DROP_CALLS:String = "DropCalls";
	public static inline var NO_INTERNET:String = "NoInternet";
	public static inline var SLOW_INTERNET:String = "SlowInternet";
	public static inline var NO_INTL_CALLS:String = "NoIntlCalls";
	
	public static inline var SOHO_QUEUE:String = "B2B_SOHO_TECH_SO";
	public static inline var GOMO_QUEUE:String = "GOMO_TECH_SO";
	public static inline var LARGE_QUEUE:String = "B2B_LAS_DIRECT_SO";
	
	public static inline var REF_600:String = "NumberWronglyDisplayedAbroad";

	public function new() 
	{
		super(
		[
			{
				title: ISSUE,
				hasTranslation:true,
				values: [NO_CALLS, NO_CALLS_VOLTE, BAD_CALL_QUALITY, NO_INTERNET, SLOW_INTERNET, NO_INTL_CALLS, REF_600]
				//values: [NO_CALLS, BAD_CALL_QUALITY, DROP_CALLS, NO_INTERNET, SLOW_INTERNET, NO_INTL_CALLS, REF_600]
			}
		]
		);
		
	}
	//override public function onClick():Void
	//{
		//this._nexts = [{step:  getNext(), params: []}];
		//if(validate())
			//super.onClick();
	//}
	override public function onMidClick():Void
	{
		Main.customer.dataSet.set(PORTFOLIO, [SEGMENT => GOMO]);
		this._nexts = [{step:  getNext(), params: []}];
		if(validate())
			super.onMidClick();
	}
	override public function onYesClick():Void
	{
		Main.customer.dataSet.set(PORTFOLIO, [SEGMENT => B2C]);
		this._nexts = [{step:  getNext(), params: []}];
		if(validate())
			super.onYesClick();
	}
	override public function onNoClick():Void
	{
		//Main.customer.dataSet.set(PORTFOLIO, [SEGMENT => SOHO]);
		this._nexts = [{step:  getNextB2B(), params: []}];
		if(validate())
			super.onNoClick();
	}
	inline function getNext():Class<Process>{
		return IsTicketOpened;
	}
	inline function getNextB2B():Class<Process>{
		return capture.WhichB2B;
	}
	override public function create()
	{
		Main.customer.reset();
		Process.INIT();
		super.create();
		Main.trackH.reset(false);
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
			MainApp.VERSION_TIMER_value = MainApp.VERSION_TIMER_DURATION;
		}
	}
	static public inline function GET_SPECIAL_QUEUE():String
	{
		return switch(Main.customer.dataSet.get(PORTFOLIO).get(SEGMENT) )
		{
			case SOHO : SOHO_QUEUE;
			case LARGE: LARGE_QUEUE;
			case GOMO: GOMO_QUEUE;
			case _ : "";
		}
	}
}