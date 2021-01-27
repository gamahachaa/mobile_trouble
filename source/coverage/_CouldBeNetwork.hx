package coverage;

import barrings.IsInCollection;
import calls.TypeOfSubscription;
import calls.WhereExactlyDoesITHappen;
import calls._NoImpactOnPartnersNetworkQuality;
import capture.WhereAreU;
import tstool.process.Action;
import tstool.process.Process;

/**
 * ...
 * @author bb
 */
class _CouldBeNetwork extends Action 
{

	override public function onClick():Void
	{
		this._nexts = [{step: branchMe()}];
		super.onClick();
	}
	function branchMe():Class<Process>
	{
		return if (Main.HISTORY.isClassInteractionInHistory(Intro, Yes))
		{
			/*******************
			/* Cannot make calls
			/*******************/
			TypeOfSubscription;
		}
		else{
			if (Main.HISTORY.isClassInteractionInHistory(WhereAreU, Yes))
			{
				/*****************
				 * CH
				/*****************/
				WhereExactlyDoesITHappen;
			}
			else{
				_NoImpactOnPartnersNetworkQuality;
			}
			
		}
	}
}