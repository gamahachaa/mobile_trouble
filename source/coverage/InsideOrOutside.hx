package coverage;

import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class InsideOrOutside extends Descision 
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: SuggestWifiCalling, params: [{step: AreOtherUsersAffected }]}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _ChangeTechno, params: []}];
		super.onNoClick();
	}
}