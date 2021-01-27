package capture;

import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class WhereAreU extends Descision 
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: DeviceRestart, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: DeviceRestart, params: []}];
		super.onNoClick();
	}
}