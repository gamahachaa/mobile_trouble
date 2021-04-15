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
		this._nexts = [{step: _SinceWhen, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _WhichCountry, params: []}];
		super.onNoClick();
	}
}