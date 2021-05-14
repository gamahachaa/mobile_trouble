package data;

import tstool.process.Process;
import tstool.process.TripletTemplate;
import tstool.salt.SOTemplate;

/**
 * ...
 * @author bb
 */
class _SendAPNInstructions extends TripletTemplate 
{

	public function new() 
	{
		super(SOTemplate.MOBILE_APN);
		
	}
	override inline function getNext():Class<Process>{
		return _AddMemoInMarilyn;
	}
}