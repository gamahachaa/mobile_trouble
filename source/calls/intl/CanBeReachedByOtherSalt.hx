package calls.intl;

import haxe.Exception;
import ticket._ThreeTwoTwo;
import tstool.process.Triplet;

/**
 * ...
 * @author bb
 */
class CanBeReachedByOtherSalt extends Triplet 
{

	override public function onYesClick():Void
	{
		try{
		this._nexts = [{step: _ThreeTwoTwo, params: []}];
		
		super.onYesClick();
		}
		catch (e:Exception)
		{
			trace(e);
		}
	}
	
	
	override public function onNoClick():Void
	{
		this._nexts = [{step: _ThreeTwoTwo, params: []}];
		super.onNoClick();
	}
	
	override public function onMidClick():Void
	{
		this._nexts = [{step: _ThreeTwoTwo, params: []}];
		super.onMidClick();
	}
}