package coverage;

import barrings.IsInCollection;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class AreUCallingFromAnotherPhone extends Descision 
{

	override public function onYesClick():Void
	{
		this._nexts = [{step: IsInCollection, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _ChangeAPN, params: []}];
		super.onNoClick();
	}
	
}