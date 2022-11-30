package capture;

import capture.IsTicketOpened;
import tstool.layout.History.Interactions;
import tstool.process.Descision;
import tstool.process.Process;

/**
 * ...
 * @author bb
 */
class WhichB2B extends Descision 
{

	override public function onYesClick():Void
	{
		this._nexts = [{step: getNext(Yes), params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: getNext(No), params: []}];
		super.onNoClick();
	}
	inline function getNext(interaction:Interactions):Class<Process>
	{
		
		Main.customer.dataSet.set(Intro.PORTFOLIO, [Intro.SEGMENT => switch (interaction)
		{
			case No : Intro.SOHO;
			case _ : Intro.LARGE;
		}]);
		return IsTicketOpened;
	}
	
}