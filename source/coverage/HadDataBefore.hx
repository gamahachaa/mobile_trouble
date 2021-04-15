package coverage;

import capture.WhereAreU;
import tstool.process.Descision;
import tstool.process.Process;

/**
 * ...
 * @author bb
 */
class HadDataBefore extends Descision 
{

	override public function onYesClick():Void
	{
		this._nexts = [{step: next(), params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: next(), params: []}];
		super.onNoClick();
	}
	inline function next():Class<Process>
	{
		return ActiveMobileData;
	}
}