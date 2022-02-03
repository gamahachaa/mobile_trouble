package data;

import barrings.ArethereAnyBarrings;
import barrings.IsInCollection;
import ticket._ThreeFourOne;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class WasApnSetupDone extends Descision 
{

	override public function onYesClick():Void
	{
		this._nexts = [{step: IsInCollection, params: []}];
		if (Main.customer.dataSet.get(Intro.PORTFOLIO).get(Intro.SEGMENT) == Intro.GOMO)
			this._nexts = [{step: ArethereAnyBarrings}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _ThreeFourOne , params: []}];
		super.onNoClick();
	}
	
}