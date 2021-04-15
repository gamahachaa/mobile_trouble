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
		super(SOTickets.MOBILE_342);
		
	}
	override public function onClick():Void
	{
		this._nexts = [{step: _AddMemoInMarilyn}];
		super.onClick();
		
	}
}