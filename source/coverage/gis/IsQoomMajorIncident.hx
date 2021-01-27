package coverage.gis;

import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class IsQoomMajorIncident extends Descision 
{

	override public function onYesClick():Void
	{
		this._nexts = [{step: _TechnicianAreOnIt}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: InsideOrOutside}];
		super.onNoClick();
	}
	
}