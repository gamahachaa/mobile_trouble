package barrings;

import calls.intl.SingleOrAll;
import coverage.HowIsCoverage;
import data.IsDataUnlimited;
import ticket._FiveThreeOne;
import tstool.layout.History.ValueReturn;
import tstool.process.Descision;
import tstool.process.Process;

/**
 * ...
 * @author bb
 */
class IsCollectionMailBoxMessage extends Descision 
{

	override public function onYesClick():Void
	{
		this._nexts = [{step: _FiveThreeOne}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: nextNo()}];
		super.onNoClick();
	}
	inline function nextNo():Class<Process>
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