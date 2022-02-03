package calls;

import sim.CanSwapSimInOtherDevice;
import sim.IsOldSim;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class WhereExactlyDoesITHappen extends Descision
{

	override public function onYesClick():Void
	{
		this._nexts = [{step: IsOldSim, params: []}];
		if (Main.customer.dataSet.get(Intro.PORTFOLIO).get(Intro.SEGMENT) == Intro.GOMO)
			this._nexts = [{step: CanSwapSimInOtherDevice}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _InformOnIssueFactors, params: []}];

		super.onNoClick();
	}

}