package ticket;

import tstool.process.ActionTicket;
import tstool.salt.SOTickets;

/**
 * ...
 * @author bb
 */
class _ThreeFourOne extends MobileTicket 
{

	public function new() 
	{
		var ticket:SOTickets =  SOTickets.MOBILE_341;
		super(ticket);
	}
	override public function onClick():Void
	{
		this._nexts = [{step: _AddMemoInMarilyn}];
		super.onClick();
	}
}