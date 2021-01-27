package barrings;

import coverage.HowIsCoverage;
import ticket._FiveOneOne;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class IsCollectionMailBoxMessage extends Descision 
{

	override public function onYesClick():Void
	{
		this._nexts = [{step: _FiveOneOne}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: HowIsCoverage}];
		super.onNoClick();
	}
	
}