package ticket;

import _AddMemoInMarilyn;
import coverage.gis.IsGisFailure;
import haxe.Exception;
import tstool.layout.History.ValueReturn;
import tstool.process.ActionTicket;
import tstool.salt.SOTickets;

/**
 * ...
 * @author bb
 */
class _ThreeTwoTwo extends MobileTicket
{

	public function new()
	{
		try
		{
			
			var issue:ValueReturn = {exists:false, value:""};
			//var wasthroughGIS: Main.HISTORY.isClassInHistory(IsGisFailure);
			if (Main.HISTORY.isClassInHistory(IsGisFailure))
			{
				issue = Main.HISTORY.findValueOfFirstClassInHistory(IsGisFailure, IsGisFailure.BLACK_CELLS);
			}
			var ticket:SOTickets =  issue.exists ? SOTickets.MOBILE_322_BLACKCELLS: SOTickets.MOBILE_322 ;

			//if (Main.customer.dataSet.exists(Intro.PORTFOLIO) && Main.customer.dataSet.get(Intro.PORTFOLIO).exists(Intro.SEGMENT))
			//{
				//if (Main.customer.dataSet.get(Intro.PORTFOLIO).get(Intro.SEGMENT) == Intro.SOHO)
					//ticket.queue = Intro.SOHO_QUEUE;
				//else if (Main.customer.dataSet.get(Intro.PORTFOLIO).get(Intro.SEGMENT) == Intro.GOMO)
					//ticket.queue = Intro.GOMO_QUEUE;
			//}
			var issueMain = Main.HISTORY.findValueOfFirstClassInHistory(Intro, Intro.ISSUE);
			if (issueMain.value == Intro.NO_CALLS_VOLTE) ticket.desc = ticket.desc + " VOLTE";
			
			super(ticket);
			
		}
		catch (e:Exception)
		{
			trace(e);
		}
	}
	override public function onClick():Void
	{
		this._nexts = [{step: _AddMemoInMarilyn}];
		super.onClick();

	}

	/****************************
	* Needed only for validation
	*****************************/
	/*
	override public function validate():Bool
	{
		return true;
	}
	*/

}