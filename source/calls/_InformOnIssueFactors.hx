package calls;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _InformOnIssueFactors extends Action 
{

	override public function onClick():Void
	{
		this._nexts = [{step: HowManyCallFail}];
		super.onClick();
	}
	
}