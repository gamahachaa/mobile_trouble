package calls.ref600;

import ticket._FiveThreeOne;
import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _ExplainWhyREF600 extends Action 
{

	override public function onClick():Void
	{
		this._nexts = [{step: _InputExamples, params: [{step:_FiveThreeOne}]}];
		super.onClick();
	}
	
}