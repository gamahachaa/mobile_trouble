package coverage.gis;

import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class IsGisFailure extends Descision 
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: _TechnicianAreOnIt}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: IsQoomMajorIncident}];
		super.onNoClick();
	}
}