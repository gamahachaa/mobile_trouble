package barrings;

import tstool.layout.History.ValueReturn;
import tstool.process.Triplet;

/**
 * ...
 * @author bb
 */
class ArethereAnyBarrings extends Triplet 
{
	override public function create():Void
	{
		if (Main.customer.dataSet.get(Intro.PORTFOLIO).get(Intro.SEGMENT) == Intro.GOMO)
			this._illustration = "barring/barrings_gomo";
		super.create();
		var issue:ValueReturn = Main.HISTORY.findValueOfFirstClassInHistory(Intro, Intro.ISSUE);
		if (issue.value == Intro.NO_INTERNET || issue.value == Intro.NO_INTL_CALLS)
		{
			this.btnMid.visible = false;
		}
		
		
	}
	override public function onYesClick():Void
	{
		this._nexts = [{step: _RemoveBarring, params: []}];
		super.onYesClick();
	}
	
	
	override public function onNoClick():Void
	{
		this._nexts = [{step: IsCollectionMailBoxMessage, params: []}];
		super.onNoClick();
	}
	
	override public function onMidClick():Void
	{
		this._nexts = [{step: _RemovePremimBarring, params: []}];
		super.onMidClick();
	}
	
}