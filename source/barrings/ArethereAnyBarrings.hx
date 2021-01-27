package barrings;

import tstool.process.Triplet;

/**
 * ...
 * @author bb
 */
class ArethereAnyBarrings extends Triplet 
{

	override public function onYesClick():Void
	{
		this._nexts = [{step: _RemovePremimBarring, params: []}];
		super.onYesClick();
	}
	
	
	override public function onNoClick():Void
	{
		this._nexts = [{step: IsCollectionMailBoxMessage, params: []}];
		super.onNoClick();
	}
	
	override public function onMidClick():Void
	{
		this._nexts = [{step: _RemoveCallBarring, params: []}];
		super.onMidClick();
	}
	
}