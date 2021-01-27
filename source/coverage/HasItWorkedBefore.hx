package coverage;

import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class HasItWorkedBefore extends Descision 
{

	override public function onYesClick():Void
	{
		this._nexts = [{step: _TempFailureFromPartner, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _OurPartnerHasNoCoverageHere, params: []}];
		super.onNoClick();
	}
	
}