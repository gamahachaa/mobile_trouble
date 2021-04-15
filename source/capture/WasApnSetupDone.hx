package capture;

import barrings.IsInCollection;
import ticket._ThreeFourOne;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class WasApnSetupDone extends Descision 
{

	override public function onYesClick():Void
	{
		this._nexts = [{step: IsInCollection, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _ThreeFourOne , params: []}];
		super.onNoClick();
	}
	
}