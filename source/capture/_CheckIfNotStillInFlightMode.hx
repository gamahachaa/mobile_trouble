package capture;

//import data.RestartRequestedFromSalt;
//import tstool.layout.History.ValueReturn;
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
		this._nexts = [{step: getNext(), params: []}];
		super.onClick();
	}
	inline function getNext():Class<Process>{
		//var issue:ValueReturn = Main.HISTORY.findValueOfFirstClassInHistory(Intro, Intro.ISSUE);
		////#if debug
		////trace("capture._CheckIfNotStillInFlightMode::getNext::issue", issue );
		////#end
		//return switch (issue.value)
		//{
			//case Intro.SLOW_INTERNET: RestartRequestedFromSalt;
			//case Intro.NO_INTERNET: RestartRequestedFromSalt;
			//case _ :DeviceRestart;
		//}
		return _CheckDoNotDisturb;
	}
}