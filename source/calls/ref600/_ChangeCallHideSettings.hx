package calls.ref600;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _ChangeCallHideSettings extends Action 
{

	override public function onClick():Void
	{
		this._nexts = [{step: _AddMemoInMarilyn, params: []}];
		super.onClick();
	}
	
}