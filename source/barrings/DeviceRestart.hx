package barrings;


import coverage.HowIsCoverage;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class DeviceRestart extends Descision 
{

	
	override public function onYesClick():Void
	{
		this._nexts = [{step: HowIsCoverage}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: HowIsCoverage}];
		super.onNoClick();
	}
}