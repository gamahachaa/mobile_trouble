package capture;

import tstool.process.ActionRadios;
import tstool.process.Process;

/**
 * ...
 * @author bb
 */
class _SinceWhen extends ActionRadios 
{
	static inline var SinceWhen:String = "SinceWhen";
	static inline var HOURS:String = "CoupleofHours";
	static inline var DAYS:String = "CoupleofDays";
	static inline var WEEK:String = "MoreThanWeek";
	static inline var FOR_EVER:String = "Forever";

	public function new() 
	{
		super(
		[
			{
				title: SinceWhen,
				hasTranslation:true,
				values: [HOURS,DAYS, WEEK, FOR_EVER]
			}
		]
		);
		
	}
	override public function onClick():Void
	{
		this._nexts = [{step:  getNext(), params: []}];
		super.onClick();
	}
	inline function getNext():Class<Process>{
		return _CheckIfNotStillInFlightMode;
	}
	
}