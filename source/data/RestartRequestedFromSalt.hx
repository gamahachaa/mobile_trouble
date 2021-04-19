package data;

import coverage.HowIsCoverage;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class RestartRequestedFromSalt extends Descision 
{

	override public function onYesClick():Void
	{
		this._nexts = [{step: WasApnSetupDone, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: HowIsCoverage, params: []}];
		super.onNoClick();
	}
	
}