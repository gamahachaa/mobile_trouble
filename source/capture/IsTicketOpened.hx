package capture;

import barrings.IsInCollection;
import calls.ref600.WasHideCallActivated;
import tstool.layout.History.Interactions;
import tstool.layout.History.ValueReturn;
import tstool.process.DescisionMultipleInput;
import tstool.process.Process;

/**
 * ...
 * @author bb
 */
class IsTicketOpened extends DescisionMultipleInput 
{
	static inline var MSISDN:String = "MSISDN";
	static inline var SO_TICKET:String = "SO ticket";
	public function new ()
	{
		super(
		[{
			ereg: new EReg("^(0)[0-9]{2}\\s{0,1}[0-9]{3}\\s{0,1}[0-9]{4}$","i"),
			input:{
				width:100,
				prefix:MSISDN,
				position: [bottom, left],
				debug: "078 787 1676"
			}
		},
		{
			ereg: new EReg("^(11)[0-9]{6}$","i"),
			input:{
				width:100,
				prefix:SO_TICKET,
				buddy:MSISDN,
				position: [top, right],
				debug: "11123456",
				mustValidate: [Yes]
			}
		}
		]
		);
		Process.STORAGE = [];
	}
	/****************************
	* Needed for validation
	*****************************/
	override public function onYesClick():Void
	{
		
		//this._nextYesProcesses = [new End()];
		this._nexts = [{step: End, params: []}];
		super.onYesClick();
		
	}
	/*override public function validateYes():Bool
	{
		return true;
	}*/
	
	override public function onNoClick():Void
	{
		//this._nextNoProcesses = [new HighUsageData()];
		this._nexts = [{step: next(), params: []}];
		super.onNoClick();
		
	}
	
	override public function validate(interaction:Interactions):Bool
	{
		//trace("capture.IsCompTicketOpened::validate");
		Main.customer.voIP = StringTools.replace(this.multipleInputs.inputs.get(MSISDN).getInputedText(), " ", "");
		Main.customer.iri = Main.customer.voIP;

		Process.STORE(MSISDN, '${Main.customer.voIP}' );
		return super.validate(interaction);
	}
	/*override public function validateNo():Bool
	{
		return true;
	}*/
	inline function next():Class<Process>
	{
		var issue:ValueReturn = Main.HISTORY.findValueOfFirstClassInHistory(Intro, Intro.ISSUE);
		return switch (issue.value)
		{
			case Intro.NO_INTL_CALLS: IsInCollection;
			case _ : WhereAreU;
		}
	}
	
}