package calls.numbers;

import tstool.process.Triplet;

/**
 * ...
 * @author bb
 */
class WhatBound extends Triplet 
{

	override public function onYesClick():Void
	{
		this._nexts = [{step: _EnsureNumbersAreDiledCorrectly, params: []}];
		super.onYesClick();
	}
	
	
	override public function onNoClick():Void
	{
		this._nexts = [{step: HowManyNumberAffected, params: []}];
		super.onNoClick();
	}
	
	override public function onMidClick():Void
	{
		this._nexts = [{step: _EnsureNumbersAreDiledCorrectly, params: []}];
		super.onMidClick();
	}
}