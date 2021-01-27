package calls;

import calls.numbers.WhatBound;
import capture.WhereAreU;
import _AddMemoInMarilyn;
import tstool.process.Descision;
import tstool.process.Process.ProcessContructor;

/**
 * ...
 * @author bb
 */
class TypeOfSubscription extends Descision 
{
	override public function onYesClick():Void
	{
		this._nexts = [branchME(true)];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [branchME(false)];
		super.onNoClick();
	}
	function branchME(postpay:Bool):ProcessContructor
	{
		return if (postpay)
		{
			
			{step: WhatBound};
		}
		else{
			{step: HasEnoughBalance};
		}
		
	}
}