package sim;

import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class IsDeviceUnderWaranty extends Descision 
{

	override public function onYesClick():Void
	{
		this._nexts = [{step: _FollowRepairProcess, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _HowAboutASpecialOffer, params: []}];
		super.onNoClick();
	}
	
}