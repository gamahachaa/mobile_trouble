package sim;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _HowAboutASpecialOffer extends Action 
{

	override public function onClick():Void
	{
		this._nexts = [{step: _AddMemoInMarilyn, params: []}];
		super.onClick();
	}
	
}