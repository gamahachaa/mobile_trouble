package capture;

import calls.ref600.WasHideCallActivated;
import tstool.layout.History.ValueReturn;
import tstool.process.ActionMultipleInput;
import tstool.process.Process;
import tstool.utils.ExpReg;

/**
 * ...
 * @author bb
 */
class _WhichCountry extends ActionMultipleInput 
{
	static inline var COUNTRY:String = "Country";

	public function new ()
	{
		super(
		[{
			ereg: new EReg(ExpReg.COUNTRY_LOOSE,"i"),
			input:{
				width:250,
				prefix:COUNTRY,
				position: [bottom, left]
			}
		}]
		);
	}
	
	
	override public function onClick():Void
	{
		if (validate(Next))
		{
			this._nexts = [{step: getNext(), params: []}];
			super.onClick();
		}
	}
	inline function getNext():Class<Process>
	{
		var issue:ValueReturn = Main.HISTORY.findValueOfFirstClassInHistory(Intro, Intro.ISSUE);
		return issue.value == Intro.REF_600? WasHideCallActivated:_SinceWhen;
	}
	/****************************
	* Needed only for validation
	*****************************/
	/*
	override public function validate():Bool
	{
		return true;
	}
	*/
	
}