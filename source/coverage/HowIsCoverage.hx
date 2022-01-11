package coverage;

import barrings.IsInCollection;
import calls.TypeOfSubscription;
import calls.WhereExactlyDoesITHappen;
import calls._NoImpactOnPartnersNetworkQuality;
import capture.WhereAreU;
import coverage.gis._CheckNetWork;
import data.HadDataBefore;
import sim.IsOldSim;
import tstool.layout.History.ValueReturn;
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
		
		this._nexts = [{step: goNextNo(_SelectManuallyAnotherProvider), params: []}];
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
		var issue:ValueReturn = Main.HISTORY.findValueOfFirstClassInHistory(Intro, Intro.ISSUE);
		return if (issue.value == Intro.NO_CALLS)
		{
			/******** NO calls at all *********/
			TypeOfSubscription;
		}
		//else if (issue.value == Intro.BAD_CALL_QUALITY || issue.value == Intro.DROP_CALLS ){
		else if (issue.value == Intro.BAD_CALL_QUALITY ){
			if (Main.HISTORY.isClassInteractionInHistory(WhereAreU, Yes))
			{
				/******** CH *********/
				WhereExactlyDoesITHappen;
			}
			else {
				_NoImpactOnPartnersNetworkQuality;
			}
		}
		else if (issue.value == Intro.SLOW_INTERNET){
			IsOldSim;
		}
		else{
			/**
			 * NO INTERENET
			 */
			HadDataBefore;
		}
	}
}