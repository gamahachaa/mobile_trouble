package coverage;

//import barrings.IsInCollection;
import calls.TypeOfSubscription;
//import calls.WhereExactlyDoesITHappen;
import calls._NoImpactOnPartnersNetworkQuality;
import tstool.process.Action;
import tstool.process.Process;

/**
 * ...
 * @author bb
 */
class _OurPartnerHasNoCoverageHere extends Action 
{

	override public function onClick():Void
	{
		this._nexts = [{step: branchMe()}];
		super.onClick();
	}
	function branchMe():Class<Process>
	{
		var issue = Main.HISTORY.findValueOfFirstClassInHistory(Intro, Intro.ISSUE);
		return if (issue.value == Intro.NO_CALLS || issue.value == Intro.NO_CALLS_VOLTE)
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