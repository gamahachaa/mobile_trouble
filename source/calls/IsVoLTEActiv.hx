package calls;

import capture.WhereAreU;
import tstool.process.Descision;
import tstool.process.Process;

/**
 * ...
 * @author bb
 */
class IsVoLTEActiv extends Descision
{

	override public function onYesClick():Void
	{
		this._nexts = [{step: CHANGEME(), params: []}];
		super.onYesClick();
	}

	override public function onNoClick():Void
	{
		this._nexts = [{step: CHANGEME(), params: []}];
		super.onNoClick();
	}
	function CHANGEME():Class<Process>
	{
		return if (Main.HISTORY.isClassInteractionInHistory(WhereAreU, Yes))
		{
			// CH
			WhereExactlyDoesITHappen;
		}
		else
		{
			_NoImpactOnPartnersNetworkQuality;
		}
	}
}