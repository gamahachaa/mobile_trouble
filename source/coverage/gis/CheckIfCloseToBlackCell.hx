package coverage.gis;

import firetongue.Replace;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class CheckIfCloseToBlackCell extends Descision 
{
    override public function create()
	{
		var blackCells = Main.HISTORY.findValueOfFirstClassInHistory(IsGisFailure, IsGisFailure.BLACK_CELLS).value.split(";"); 
		super.create();
		var site = getSites(blackCells);
		title = Replace.flags(_detailTxt, ["SITES"], []);
		//this.details.
	}
	override public function onYesClick():Void
	{
		this._nexts = [{step: IsQoomMajorIncident, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: IsQoomMajorIncident, params: []}];
		super.onNoClick();
	}
	function getSites(t:Array<String>)
	{
		
	}
}