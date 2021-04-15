package sim;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _IssueIsWithTheDevice extends Action 
{

	override public function onClick():Void
	{
		this._nexts = [{step: IsDeviceUnderWaranty, params: []}];
		super.onClick();
	}
	
}