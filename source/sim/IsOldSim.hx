package sim;

import sim._OrderNeewOneForFree;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class IsOldSim extends Descision 
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: _OrderNeewOneForFree}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: CanSwapSimInOtherDevice}];
		super.onNoClick();
	}
	
}