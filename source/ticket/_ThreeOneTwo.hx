package ticket;

import tstool.process.ActionTicket;
import tstool.salt.SOTickets;

/**
 * ...
 * @author bb
 */
class _ThreeOneTwo extends ActionTicket 
{

	public function new() 
	{
		super(SOTickets.MOBILE_312);
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