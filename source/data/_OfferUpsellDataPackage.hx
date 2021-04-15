package data;

import tstool.process.Process;
import tstool.process.TripletTemplate;
import tstool.salt.SOTemplate;

/**
 * ...
 * @author bb
 */
class _OfferUpsellDataPackage extends TripletTemplate 
{
	public function new ()
	{
		super(SOTemplate.MOBILE_DATA_UPSELL);
	}
	override public function onYesClick():Void
	{
		this._nexts = [{step: getNext(), params: []}];
		super.onYesClick();
	}
	
	
	override public function onNoClick():Void
	{
		this._nexts = [{step: getNext(), params: []}];
		super.onNoClick();
	}
	
	override public function onMidClick():Void
	{
		this._nexts = [{step: getNext(), params: []}];
		super.onMidClick();
	}
	override inline function getNext():Class<Process>{
		return _AddMemoInMarilyn;
	}
}