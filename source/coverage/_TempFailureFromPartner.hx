package coverage;

import barrings.IsInCollection;
import calls.TypeOfSubscription;
import calls._NoImpactOnPartnersNetworkQuality;
import tstool.layout.History.ValueReturn;
import tstool.process.Action;
import tstool.process.Process;

/**
 * ...
 * @author bb
 */
class _TempFailureFromPartner extends Action 
{

	override public function onClick():Void
	{
		this._nexts = [{step: branchMe()}];
		super.onClick();
	}
	function branchMe():Class<Process>
	{
		var issue:ValueReturn = Main.HISTORY.findValueOfFirstClassInHistory(Intro, Intro.ISSUE);
		return if (issue.value == Intro.NO_CALLS)
		{
			/*******************
			/* Cannot make calls
			/*******************/
			TypeOfSubscription;
		}
		else{
			_NoImpactOnPartnersNetworkQuality;
			
		}
	}
	
}