package coverage;


import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class _SelectManuallyAnotherProvider extends Descision 
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: InsideOrOutside}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: InsideOrOutside}];
		super.onNoClick();
	}
	
}