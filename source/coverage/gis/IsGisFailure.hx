package coverage.gis;

using format.csv.Utf8Reader;
using StringTools;

import lime.utils.Assets;
import tstool.layout.History.Interactions;
import tstool.layout.History.Snapshot;
import tstool.process.Descision;
import tstool.process.Process;

/**
 * ...
 * @author bb
 */
class IsGisFailure extends Descision 
{
	static inline var CITY:String = "CITY";
	static inline var ZIP:String = "Cell Postal Code";
	static inline var CELL:String = "Site";
	//static inline var SITE:String = "Site";
	var blackcells:Array<String>;
	var hasBlackCells:Bool;
	public static inline var BLACK_CELLS:String = "BlackCells";
	override public function onYesClick():Void
	{
		this._nexts = [{step: _TechnicianAreOnIt}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: getNext()}];
		super.onNoClick();
	}
	function getNext():Class<Process>
	{
		/*if (checkBlackCell())
		{
			CheckIfCloseToBlackCell;
		}
		else IsQoomMajorIncident;
		*/
		hasBlackCells = checkBlackCell();
		return IsQoomMajorIncident;
	}
	function checkBlackCell()
	{
		var cvsString:String =  Assets.getText("assets/data/black_cell_new.csv");
		var csv:Array<Array<String>> = cvsString.parseCsv(";");
		var index:Array<String> = csv[0];
		//var cityIndex = index.indexOf(CITY);
		var zipIndex = index.indexOf(ZIP);
		var cellIndex = index.indexOf(CELL);
		//var siteIndex = index.indexOf(SITE);
		var zip:String = Main.HISTORY.findValueOfFirstClassInHistory(_CheckNetWork, _CheckNetWork.ZIP).value.trim();
		//var city:String = Main.HISTORY.findValueOfFirstClassInHistory(_CheckNetWork, _CheckNetWork.CITY).value;
		blackcells = [];
		for (cell in csv)
		{
			#if debug
			//trace("coverage.gis.IsGisFailure::checkBlackCell::cell[zipIndex]", cell[zipIndex] );
			//trace("coverage.gis.IsGisFailure::checkBlackCell:: zip", zip );
			trace("coverage.gis.IsGisFailure::checkBlackCell::cell[zipIndex] == zip", cell[zipIndex].trim() == zip,cell[zipIndex],zip  );
			#end
			if ( cell[zipIndex].trim() == zip)
			{
				blackcells.push(cell[cellIndex] + "- zip: " + cell[zipIndex]);
			}
		}
		if (blackcells.length > 0){
			return true;
		}
		else{
			//blackcells.push("0");
			return false;
		}
		//trace(cvsString.parseCsv(";"));
		//trace(cvsString.parseCsv(";")[0]);
	}
	override function pushToHistory(buttonTxt:String, interactionType:Interactions, ?values:Map<String,Dynamic> = null):Void
	{
		if(hasBlackCells)
			super.pushToHistory(buttonTxt, interactionType, [BLACK_CELLS => blackcells.join(" ; ")]);
		else super.pushToHistory(buttonTxt, interactionType); 
	}
}