package barrings;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _SpecialProcessForBarringRemoval extends Action 
{

	override public function onClick():Void
	{
		this._nexts = [{step: End, params: []}];
		super.onClick();
	}
	
}