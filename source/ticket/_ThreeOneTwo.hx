package ticket;

import tstool.process.ActionTicket;
import tstool.salt.SOTickets;

/**
 * ...
 * @author bb
 */
class _ThreeOneTwo extends MobileTicket 
{

	public function new() 
	{
		
		var ticket:SOTickets =  SOTickets.MOBILE_312;
		
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