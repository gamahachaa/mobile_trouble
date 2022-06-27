package capture;

import barrings.ArethereAnyBarrings;
import barrings.IsInCollection;
import calls.ref600.WasHideCallActivated;
import js.Browser;
import tstool.MainApp;
import tstool.layout.History.Interactions;
import tstool.layout.History.ValueReturn;
import tstool.process.DescisionMultipleInput;
import tstool.process.Process;
import xapi.Agent;
import xapi.Verb;
using string.StringUtils;

/**
 * ...
 * @author bb
 */
class IsTicketOpened extends DescisionMultipleInput
{
	static inline var MSISDN:String = "MSISDN";
	static inline var SO_TICKET:String = "SO ticket";
	var issue:ValueReturn;
	public function new ()
	{
		super(
			[
		{
			ereg: new EReg("^(0)[0-9]{2}\\s{0,1}[0-9]{3}\\s{0,1}[0-9]{4}$","i"),
			input:{
				width:100,
				prefix:MSISDN,
				position: [bottom, left],
				debug: "078 787 1676"
			}
		},
		{
			ereg: new EReg("^(1)[0-9]{7}$","i"),
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
	override public function create()
	{
		#if debug
		trace('Main.customer.dataSet.get(Intro.PORTFOLIO).get(Intro.SEGMENT)', Main.customer.dataSet.get(Intro.PORTFOLIO).get(Intro.SEGMENT));
		#end
		issue = Main.HISTORY.findValueOfFirstClassInHistory(Intro, Intro.ISSUE);
		super.create();
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
	override function pushToHistory( buttonTxt:String, interactionType:Interactions,?values:Map<String,Dynamic>= null)
	{
		var ticket = StringTools.trim(multipleInputs.inputs.get(SO_TICKET).getInputedText())  ;
		ticket = ticket == ""?"": ticket.buildSOLink();

		super.pushToHistory( buttonTxt, interactionType, [
								 SO_TICKET => ticket,
								 MSISDN => multipleInputs.inputs.get(MSISDN).getInputedText()
							 ]);
	}
	override public function validate(interaction:Interactions):Bool
	{
		//trace("capture.IsCompTicketOpened::validate");

		Main.customer.voIP = StringTools.replace(this.multipleInputs.inputs.get(MSISDN).getInputedText(), " ", "");
		Main.customer.iri = Main.customer.voIP;
		//#if debug
		//Main.trackH.reset(false);
		Main.trackH.setDefaultContext(MainApp.translator.locale, "mobile.qtool@salt.ch");
		Main.trackH.setActor(new Agent( MainApp.agent.iri, MainApp.agent.sAMAccountName));
		Main.trackH.setVerb(Verb.initialized);
		//Main.trackH.setStatementRefs(null);
		var extensions:Map<String,Dynamic> = [];
		extensions.set("https://customercare.salt.ch/admin/contracts/customer/", Main.customer.voIP);
		extensions.set(Browser.location.origin +"/troubleshooting/script_version/", Main.VERSION);

		Main.trackH.setActivityObject(issue.value,null,null,"http://activitystrea.ms/schema/1.0/process",extensions);
		//Main.trackH.setCustomer();
		Main.trackH.send();
		Main.trackH.setVerb(Verb.resolved);

		Process.STORE(MSISDN, '${Main.customer.voIP}' );
		return super.validate(interaction);
	}
	/*override public function validateNo():Bool
	{
		return true;
	}*/
	inline function next():Class<Process>
	{

		return switch (issue.value)
		{
			case Intro.NO_INTL_CALLS: if (Main.customer.dataSet.get(Intro.PORTFOLIO).get(Intro.SEGMENT) == Intro.GOMO) ArethereAnyBarrings else IsInCollection;
			case Intro.REF_600:  WasHideCallActivated;
			case _ : WhereAreU;
		}
	}

}