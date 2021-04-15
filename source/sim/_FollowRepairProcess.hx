package sim;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _FollowRepairProcess extends Action 
{

	override public function onClick():Void
	{
		this._nexts = [{step: _AddMemoInMarilyn, params: []}];
		super.onClick();
	}
}