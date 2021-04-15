package barrings;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _RemoveBarring extends Action 
{

	override public function onClick():Void
	{
		this._nexts = [{step: WasUnbarrPossible, params: []}];
		super.onClick();
	}
	
}