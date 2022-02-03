package data;

import sim.CanSwapSimInOtherDevice;
import sim.IsOldSim;
import tstool.process.Triplet;

/**
 * ...
 * @author bb
 */
class IsDataUnlimited extends Triplet
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
		this._nexts = [{step: _OfferUpsellDataPackage, params: []}];
		super.onNoClick();
	}

	override public function onMidClick():Void
	{
		this._nexts = [{step: IsOldSim, params: []}];
		if (Main.customer.dataSet.get(Intro.PORTFOLIO).get(Intro.SEGMENT) == Intro.GOMO)
			this._nexts = [{step: CanSwapSimInOtherDevice}];
		super.onMidClick();
	}

}