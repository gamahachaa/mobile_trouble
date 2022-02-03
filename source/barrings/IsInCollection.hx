package barrings;

import flixel.FlxG;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class IsInCollection extends Descision 
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: _Pay, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: ArethereAnyBarrings, params: []}];
		super.onNoClick();
	}
	
}