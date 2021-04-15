package data;

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
		super.onMidClick();
	}
	
}