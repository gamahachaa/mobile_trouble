package calls.numbers;

import sim.CanSwapSimInOtherDevice;
import sim.IsOldSim;
import ticket._ThreeTwoTwo;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class CouldItBeYouWereBlocked extends Descision 
{

	override public function onYesClick():Void
	{
		this._nexts = [{step: _AddMemoInMarilyn, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: IsOldSim, params: []}];
		if (Main.customer.dataSet.get(Intro.PORTFOLIO).get(Intro.SEGMENT) == Intro.GOMO)
			this._nexts = [{step: CanSwapSimInOtherDevice}];
		super.onNoClick();
	}
	
}