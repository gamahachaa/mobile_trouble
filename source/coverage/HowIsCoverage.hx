package coverage;

import barrings.IsInCollection;
import calls.TypeOfSubscription;
import calls.WhereExactlyDoesITHappen;
import calls._NoImpactOnPartnersNetworkQuality;
import capture.WhereAreU;
import coverage.gis._CheckNetWork;
import tstool.process.Process;
import tstool.process.Triplet;

/**
 * ...
 * @author bb
 */
class HowIsCoverage extends Triplet 
{

	override public function onYesClick():Void
	{
		this._nexts = [{step: goNextYes(), params: []}];
		super.onYesClick();
	}
	
	
	override public function onNoClick():Void
	{
		
		this._nexts = [{step: goNextNo(InsideOrOutside), params: []}];
		super.onNoClick();
	}
	
	override public function onMidClick():Void
	{
		this._nexts = [{step: goNextNo(_SelectManuallyAnotherProvider), params: []}];
		super.onMidClick();
	}
	inline function goNextNo(CHANGEME:Class<Process>):Class<Process>
	{
		return if (Main.HISTORY.isClassInteractionInHistory(WhereAreU, Yes))
		{
			/******** CH *********/
			_CheckNetWork;
		}
		else {
			CHANGEME;
		}
		
	}
	inline function goNextYes():Class<Process>
	{
		return if (Main.HISTORY.isClassInteractionInHistory(Intro, Yes))
		{
			/******** NO calls at all *********/
			TypeOfSubscription;
		}
		else {
			if (Main.HISTORY.isClassInteractionInHistory(WhereAreU, Yes))
			{
				/******** CH *********/
				WhereExactlyDoesITHappen;
			}
			else {
				_NoImpactOnPartnersNetworkQuality;
			}
		}
	}
}