package data;

import data.IsApnCorrect;
import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _ActiveMobileData extends Action 
{

	override public function onClick():Void
	{
		this._nexts = [{step: IsApnCorrect, params: []}];
		super.onClick();
	}
	
}