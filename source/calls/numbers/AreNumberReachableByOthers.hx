package calls.numbers;

import tstool.process.Triplet;

/**
 * ...
 * @author bb
 */
class AreNumberReachableByOthers extends Triplet 
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: CouldItBeYouWereBlocked, params: []}];
		super.onYesClick();
	}
	
	
	override public function onNoClick():Void
	{
		this._nexts = [{step: _IfOtherTooThan, params: []}];
		super.onNoClick();
	}
	
	override public function onMidClick():Void
	{
		this._nexts = [{step: CouldItBeYouWereBlocked, params: []}];
		super.onMidClick();
	}
	
}