package calls.numbers;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _IfOtherTooThan extends Action 
{

	override public function onClick():Void
	{
		this._nexts = [{step: _AddMemoInMarilyn, params: []}];
		super.onClick();
	}
	
}