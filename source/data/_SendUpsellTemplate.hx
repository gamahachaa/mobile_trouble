package data;

import tstool.process.Process;
import tstool.process.TripletTemplate;
import tstool.salt.SOTemplate;

/**
 * ...
 * @author bb
 */
class _SendUpsellTemplate extends TripletTemplate 
{

	public function new() 
	{
		super(SOTemplate.MOBILE_DATA_UPSELL);
		
	}
	override function getNext():Class<Process>{
		return _AddMemoInMarilyn;
	}
}