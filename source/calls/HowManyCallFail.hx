package calls;

import sim.IsOldSim;
import ticket._ThreeTwoTwo;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class HowManyCallFail extends Descision 
{

	override public function onYesClick():Void
	{
		this._nexts = [{step: IsOldSim}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _ThreeTwoTwo, params: []}];
		super.onNoClick();
	}
	
}