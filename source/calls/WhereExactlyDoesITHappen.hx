package calls;

import sim.IsOldSim;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class WhereExactlyDoesITHappen extends Descision 
{

	override public function onYesClick():Void
	{
		this._nexts = [{step: IsOldSim, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _InformOnIssueFactors, params: []}];
		super.onNoClick();
	}
	
}