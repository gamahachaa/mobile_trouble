package capture;

import barrings.ArethereAnyBarrings;
import barrings.IsInCollection;
import coverage.HowIsCoverage;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class DeviceRestart extends Descision 
{

	
	override public function onYesClick():Void
	{
		this._nexts = [{step: IsInCollection}];
		if (Main.customer.dataSet.get(Intro.PORTFOLIO).get(Intro.SEGMENT) == Intro.GOMO)
			this._nexts = [{step: ArethereAnyBarrings}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: IsInCollection}];
		if (Main.customer.dataSet.get(Intro.PORTFOLIO).get(Intro.SEGMENT) == Intro.GOMO)
			this._nexts = [{step: ArethereAnyBarrings}];
		super.onNoClick();
	}
}