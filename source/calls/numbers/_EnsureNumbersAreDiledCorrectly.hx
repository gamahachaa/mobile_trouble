package calls.numbers;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _EnsureNumbersAreDiledCorrectly extends Action 
{

	override public function onClick():Void
	{
		this._nexts = [{step: HowManyNumberAffected, params: []}];
		super.onClick();
	}
	
}