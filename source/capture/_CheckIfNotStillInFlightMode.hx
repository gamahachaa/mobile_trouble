package capture;

import tstool.layout.History.ValueReturn;
import tstool.process.Action;
import tstool.process.Process;

/**
 * ...
 * @author bb
 */
class _CheckIfNotStillInFlightMode extends Action 
{

	
	override public function onClick():Void
	{
		this._nexts = [{step: DeviceRestart, params: []}];
		super.onClick();
	}
	inline function getNext():Class<Process>{
		var issue:ValueReturn = Main.HISTORY.findValueOfFirstClassInHistory(Intro, Intro.ISSUE);
		return switch (issue.value)
		{
			case Intro.SLOW_INTERNET: RestartRequestedFromSalt;
			case Intro.NO_INTERNET: RestartRequestedFromSalt;
			case _ :DeviceRestart;
		}
	}
}