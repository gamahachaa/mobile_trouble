package sim;

import _AddMemoInMarilyn;
import ticket._ThreeFourOne;
import ticket._ThreeFourTwo;
import ticket._ThreeOneTwo;
import ticket._ThreeTwoOne;
import ticket._ThreeTwoTwo;
import tstool.layout.History.ValueReturn;
import tstool.process.Process;
import tstool.process.Triplet;

/**
 * ...
 * @author bb
 */
class CanSwapSimInOtherDevice extends Triplet
{
	var issue:ValueReturn;
	public function new()
	{
		super();
		issue = Main.HISTORY.findValueOfFirstClassInHistory(Intro, Intro.ISSUE);
	}
	override public function onYesClick():Void
	{
		this._nexts = [{step: nextYes(), params: []}];
		super.onYesClick();
	}

	override public function onNoClick():Void
	{
		this._nexts = [{step: nextMidNo(), params: []}];
		super.onNoClick();
	}
	
	

	override public function onMidClick():Void
	{
		this._nexts = [{step: nextMidNo(), params: []}];
		super.onMidClick();
	}
	inline function nextMidNo():Class<Process>
	{
		return
		if (issue.value == Intro.NO_CALLS || issue.value == Intro.NO_CALLS_VOLTE)
		{
			if (Main.HISTORY.isClassInteractionInHistory(coverage.HowIsCoverage, Yes))
			{
				/******** CH *********/
				_ThreeTwoTwo;
			}
			else
			{
				_ThreeOneTwo;
			}
		}
		//else if (issue.value == Intro.BAD_CALL_QUALITY || issue.value == Intro.DROP_CALLS)
		else if (issue.value == Intro.BAD_CALL_QUALITY)
		{
			_ThreeTwoOne;
		}
		else if (issue.value == Intro.SLOW_INTERNET)
		{
			_ThreeFourTwo;
		}
		else{
			_ThreeFourOne;
		}
	}
	
	inline function nextYes():Class<Process>
	{
		return _IssueIsWithTheDevice;
	}
}