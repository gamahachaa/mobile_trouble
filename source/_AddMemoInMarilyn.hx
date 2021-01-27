package;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _AddMemoInMarilyn extends Action 
{

	override public function onClick():Void
	{
		this._nexts = [{step: End}];
		super.onClick();
	}
	
}