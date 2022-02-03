package calls;

import coverage.AreOtherUsersAffected;
import tstool.process.Descision;
import tstool.process.Process.ProcessContructor;

/**
 * ...
 * @author bb
 */
class IsWifiCallingActiv extends Descision 
{

	override public function onYesClick():Void
	{
		this._nexts = [{step: AreOtherUsersAffected }];
		super.onYesClick();
	}
	
	
	override public function onNoClick():Void
	{
		this._nexts = [CHANGEME()];
		super.onNoClick();
	}
	inline function CHANGEME():ProcessContructor 
	{
		return {step: SuggestWifiCalling, params: [{step: AreOtherUsersAffected }]};
	}
}