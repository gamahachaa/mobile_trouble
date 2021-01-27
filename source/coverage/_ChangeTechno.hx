package coverage;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _ChangeTechno extends Action 
{

	override public function onClick():Void
	{
		this._nexts = [{step: AreOtherUsersAffected, params: []}];
		super.onClick();
	}
	
}