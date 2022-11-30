package ticket;

import _AddMemoInMarilyn;
import tstool.layout.History.ValueReturn;

import tstool.process.ActionTicket;
import tstool.salt.SOTickets;

/**
 * ...
 * @author bb
 */
class _FiveThreeOne extends MobileTicket 
{

	public function new() 
	{
		var issue:ValueReturn = Main.HISTORY.findValueOfFirstClassInHistory(Intro, Intro.ISSUE);
		var ticket = issue.value == Intro.REF_600 ? SOTickets.MOBILE_531_ESCA: SOTickets.MOBILE_531;
		
		super(ticket);
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