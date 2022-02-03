package calls.numbers;

import capture.WhereAreU;
import sim.CanSwapSimInOtherDevice;
import sim.IsOldSim;
import ticket._ThreeTwoTwo;
import tstool.process.Descision;
import tstool.process.DescisionMultipleInput;

/**
 * ...
 * @author bb
 */
class HowManyNumberAffected extends DescisionMultipleInput 
{
	
	public function new ()
	{
		super(
		[{
			ereg: new EReg("^(0)[0-9]{2}\\s{0,1}[0-9]{3}\\s{0,1}[0-9]{4}$","i"),
			input:{
				width:250,
				prefix:"Single number",
				position: [bottom, left],
				debug: "078 787 1676"
			}
		}]
		);
	}

	override public function onYesClick():Void
	{
		// only one
		this._nexts = [{step: AreNumberReachableByOthers, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step:
			Main.HISTORY.isClassInteractionInHistory(WhereAreU, No)?
				HowLongDoYouStayAbroad: 
				Main.customer.dataSet.get(Intro.PORTFOLIO).get(Intro.SEGMENT) == Intro.GOMO ? CanSwapSimInOtherDevice: IsOldSim}];

		super.onNoClick();
	}
	override public function validateNo():Bool
	{
		return true;
	}
}