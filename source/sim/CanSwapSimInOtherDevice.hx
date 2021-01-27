package sim;

import _AddMemoInMarilyn;
import ticket._ThreeOneTwo;
import ticket._ThreeTwoTwo;
import tstool.process.Process;
import tstool.process.Triplet;

/**
 * ...
 * @author bb
 */
class CanSwapSimInOtherDevice extends Triplet 
{

	override public function onYesClick():Void
	{
		this._nexts = [{step: _AddMemoInMarilyn, params: []}];
		super.onYesClick();
	}
	
	
	override public function onNoClick():Void
	{
		this._nexts = [{step: changeMe(), params: []}];
		super.onNoClick();
	}
	
	override public function onMidClick():Void
	{
		this._nexts = [{step: changeMe(), params: []}];
		super.onMidClick();
	}
	function changeMe():Class<Process>
	{
		return if (Main.HISTORY.isClassInteractionInHistory(coverage.HowIsCoverage, Yes))
		{
			/******** CH *********/
			_ThreeTwoTwo;
		}
		else {
			_ThreeOneTwo;
		}
	}
}