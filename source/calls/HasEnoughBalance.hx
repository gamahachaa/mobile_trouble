package calls;

import calls.numbers.WhatBound;
import capture.WhereAreU;
import firetongue.Replace;
import _AddMemoInMarilyn;
import tstool.process.Descision;
import tstool.process.Process.ProcessContructor;

/**
 * ...
 * @author bb
 */
class HasEnoughBalance extends Descision 
{
	var ch:Bool;
	
	override public function create()
	{
		ch = Main.HISTORY.isClassInteractionInHistory(WhereAreU, Yes);
		var ppmin: String = ch ? "5" : "10";
		this._titleTxt = Replace.flags(_titleTxt, ["<AMOUNT>"], [ppmin]);
		super.create();
	}
	override public function onYesClick():Void
	{
		this._nexts = [branchME()];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [branchME()];
		super.onNoClick();
	}
	function branchME():ProcessContructor
	{
		return if (ch)
		{
			{step: WhatBound};
		}
		else{
			{step: SuggestWifiCalling, params: [{step: _AddMemoInMarilyn}]}
		}		
	}
}