package ticket;

import tstool.process.ActionTicket;
import tstool.salt.SOTickets;

/**
 * ...
 * @author bb
 */
class MobileTicket extends ActionTicket 
{

	public function new(ticket:SOTickets, ?resolved:Bool=false) 
	{
		if (Main.customer.dataSet.get(Intro.PORTFOLIO).get(Intro.SEGMENT) != Intro.B2C)
		{
			ticket.queue = Intro.GET_SPECIAL_QUEUE();
		}
		super(ticket, resolved);
		
	}
	
}