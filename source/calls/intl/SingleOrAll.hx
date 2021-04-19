package calls.intl;

import tstool.process.Descision;
//import tstool.process.Process;

/**
 * ...
 * @author bb
 */
class SingleOrAll extends Descision 
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: _InputExamples, params: [{step: CanBeReachedByOtherSalt}]}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _InputExamples, params: [{step:CanBeReachedByOtherSalt}]}];
		super.onNoClick();
	}
	
}