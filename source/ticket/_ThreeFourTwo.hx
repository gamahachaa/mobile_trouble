package ticket;

import tstool.process.ActionTicket;
import tstool.salt.SOTickets;

/**
 * ...
 * @author bb
 */
class _ThreeFourTwo extends ActionTicket 
{

	public function new() 
	{
		var ticket:SOTickets =  SOTickets.MOBILE_342;
		if (Main.customer.dataSet.get(Intro.PORTFOLIO).get(Intro.SEGMENT) == Intro.SOHO)
			ticket.queue = Intro.SOHO_QUEUE;
		else if (Main.customer.dataSet.get(Intro.PORTFOLIO).get(Intro.SEGMENT) == Intro.GOMO)
			 ticket.queue = Intro.GOMO_QUEUE;
		super(ticket);
	}
	override public function onClick():Void
	{
		this._nexts = [{step: _AddMemoInMarilyn}];
		super.onClick();
		
	}
}