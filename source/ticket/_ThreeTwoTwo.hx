package ticket;

import _AddMemoInMarilyn;
import tstool.process.ActionTicket;
import tstool.salt.SOTickets;

/**
 * ...
 * @author bb
 */
class _ThreeTwoTwo extends ActionTicket 
{

	public function new() 
	{
		super(SOTickets.MOBILE_322);
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