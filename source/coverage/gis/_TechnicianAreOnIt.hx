package coverage.gis;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _TechnicianAreOnIt extends Action 
{

	override public function onClick():Void
	{
		this._nexts = [{step: SuggestWifiCalling, params: [{step: End}]}];
		super.onClick();
	}
	
}