package barrings;


import calls.intl.SingleOrAll;
import coverage.HowIsCoverage;
import data.IsDataUnlimited;
import tstool.layout.History.ValueReturn;
import tstool.process.Descision;
import tstool.process.Process;

/**
 * ...
 * @author bb
 */
class DeviceRestart extends Descision 
{

	
	override public function onYesClick():Void
	{
		this._nexts = [{step:  next()}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step:  next()}];
		super.onNoClick();
	}
	inline function next():Class<Process>
	{
		var issue:ValueReturn = Main.HISTORY.findValueOfFirstClassInHistory(Intro, Intro.ISSUE);
		return if (issue.value == Intro.NO_INTERNET)
		{
			IsDataUnlimited;
		}
		else if (issue.value == Intro.NO_INTL_CALLS)
		{
			SingleOrAll;
		}
		else{
			HowIsCoverage;
		}
	}
}