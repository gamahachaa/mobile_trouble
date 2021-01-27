package barrings;

import coverage.HowIsCoverage;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class WasUnbarrPossible extends Descision 
{

	override public function onYesClick():Void
	{
		this._nexts = [{step: DeviceRestart}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _SpecialProcessForBarringRemoval, params: []}];
		super.onNoClick();
	}
	
}