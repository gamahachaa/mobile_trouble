package data;

import barrings.IsInCollection;
import data._ChangeAPN;
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