package calls.ref600;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class WasHideCallActivated extends Descision 
{

	override public function onYesClick():Void
	{
		this._nexts = [{step: _AddMemoInMarilyn}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _ExplainWhyREF600}];
		super.onNoClick();
	}
	
}