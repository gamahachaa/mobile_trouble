package coverage;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class ActiveMobileData extends Action 
{

	override public function onClick():Void
	{
		this._nexts = [{step: IsApnCorrect, params: []}];
		super.onClick();
	}
	
}