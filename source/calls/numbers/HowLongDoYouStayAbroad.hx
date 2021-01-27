package calls.numbers;

import ticket._ThreeTwoTwo;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class HowLongDoYouStayAbroad extends Descision 
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: _ThreeTwoTwo, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _AddMemoInMarilyn, params: []}];
		super.onNoClick();
	}
	
}