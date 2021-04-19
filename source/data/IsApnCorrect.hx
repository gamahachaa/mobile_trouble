package data;

import barrings.IsInCollection;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class IsApnCorrect extends Descision 
{

	override public function onYesClick():Void
	{
		this._nexts = [{step: IsInCollection, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: AreUCallingFromAnotherPhone, params: []}];
		super.onNoClick();
	}
}