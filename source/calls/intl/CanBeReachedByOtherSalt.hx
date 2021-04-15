package calls.intl;

import ticket._ThreeTwoTwo;
import tstool.process.Triplet;

/**
 * ...
 * @author bb
 */
class CanBeReachedByOtherSalt extends Triplet 
{

	override public function onYesClick():Void
	{
		this._nexts = [{step: _ThreeTwoTwo, params: []}];
		super.onYesClick();
	}
	
	
	override public function onNoClick():Void
	{
		this._nexts = [{step: _ThreeTwoTwo, params: []}];
		super.onNoClick();
	}
	
	override public function onMidClick():Void
	{
		this._nexts = [{step: _ThreeTwoTwo, params: []}];
		super.onMidClick();
	}
}