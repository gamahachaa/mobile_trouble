package ticket;

import coverage.gis.IsGisFailure;
import tstool.layout.History.ValueReturn;
import tstool.process.ActionTicket;
import tstool.salt.SOTickets;

/**
 * ...
 * @author bb
 */
class _ThreeTwoOne extends MobileTicket 
{

	public function new() 
	{
		var issue:ValueReturn = {exists:false, value:""};
		//var wasthroughGIS: Main.HISTORY.isClassInHistory(IsGisFailure);
		if (Main.HISTORY.isClassInHistory(IsGisFailure))
		{
			issue = Main.HISTORY.findValueOfFirstClassInHistory(IsGisFailure, IsGisFailure.BLACK_CELLS);
		}
		var ticket:SOTickets =  issue.exists ? SOTickets.MOBILE_321_BLACKCELLS: SOTickets.MOBILE_321;
		
		super(ticket);
	}
	override public function onClick():Void
	{
		this._nexts = [{step: _AddMemoInMarilyn}];
		super.onClick();
		
	}
	
}