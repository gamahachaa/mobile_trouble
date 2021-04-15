package calls;

import calls.intl.SingleOrAll;
import tstool.process.MultipleInput.ValidatedInputs;
//import ticket._FiveThreeOne;
import tstool.process.ActionMultipleInput;
import tstool.process.Process;
import tstool.utils.ExpReg;
import tstool.layout.IPositionable.Direction;
import tstool.layout.History.Interactions;
/**
 * ...
 * @author bb
 */
class _InputExamples extends ActionMultipleInput
{
	static inline var Expl_I_CountryCode:String = "Expl_I_CountryCode";
	static inline var Expl_II_CountryCode:String = "Expl_II_CountryCode";
	static inline var Expl_III_CountryCode:String = "Expl_III_CountryCode";
	static inline var Expl_I_PhoneNber:String = "Expl_I_PhoneNber";
	static inline var Expl_II_PhoneNber:String = "Expl_II_PhoneNber";
	static inline var Expl_III_PhoneNber:String = "Expl_III_PhoneNber";
	static inline var Expl_I_DateTime:String = "Expl_I_DateTime";
	static inline var Expl_II_DateTime:String = "Expl_II_DateTime";
	static inline var Expl_III_DateTime:String = "Expl_III_DateTime";
	var next:ProcessContructor;

	public function new (next:ProcessContructor)
	{
		var multiple = !Main.HISTORY.isClassInteractionInHistory(SingleOrAll, Yes);
		var feilds:Array<ValidatedInputs> = [
		{
			ereg: new EReg(ExpReg.INTL_CODE,"i"),
			input:{
				width:140,
				prefix:Expl_I_CountryCode,
				position: [bottom, left],
				debug: "0033",
				mustValidate: [Next]
			}
		},
		{
			ereg: new EReg(ExpReg.INTL_NUMBER,"i"),
			input:{
				width:250,
				buddy: Expl_I_CountryCode,
				prefix:Expl_I_PhoneNber,
				position: [top, right],
				debug: "476879865",
				mustValidate: [Next]
			}
		},
		{
			ereg: new EReg(ExpReg.DATE_TIME,"i"),
			input:{
				width:250,
				buddy: Expl_I_PhoneNber,
				prefix : Expl_I_DateTime,
				position: [top, right],
				debug: "01.01.2021",
				mustValidate: [Next]
			}
		}
		];
		if (multiple)
		{
			feilds = feilds.concat([
			{
				ereg: new EReg(ExpReg.INTL_CODE,"i"),
				input:{
					width:140,
					prefix:Expl_II_CountryCode,
					buddy: Expl_I_CountryCode,
					position: [bottom, left],
					mustValidate: [Exit]
				}
			},
			{
				ereg: new EReg(ExpReg.INTL_NUMBER,"i"),
				input:{
					width:250,
					buddy: Expl_I_PhoneNber,
					prefix:Expl_II_PhoneNber,
					position: [bottom, left],
					mustValidate: [Exit]
				}
			},
			{
				ereg: new EReg(ExpReg.DATE_TIME,"i"),
				input:{
					width:250,
					buddy: Expl_I_DateTime,
					prefix : Expl_II_DateTime,
					position: [bottom, left],
					mustValidate: [Exit]
				}
			},
			{
				ereg: new EReg(ExpReg.INTL_CODE,"i"),
				input:{
					width:140,
					prefix:Expl_III_CountryCode,
					buddy: Expl_II_CountryCode,
					position: [bottom, left],
					mustValidate: [Exit]
				}
			},
			{
				ereg: new EReg(ExpReg.INTL_NUMBER,"i"),
				input:{
					width:250,
					buddy: Expl_II_PhoneNber,
					prefix:Expl_III_PhoneNber,
					position: [bottom, left],
					mustValidate: [Exit]
				}
			},
			{
				ereg: new EReg(ExpReg.DATE_TIME,"i"),
				input:{
					width:250,
					buddy: Expl_II_DateTime,
					prefix : Expl_III_DateTime,
					position: [bottom, left],
					mustValidate: [Exit]
				}
			}]);
		}
		super(feilds);
		this.next = next;

	}

	override public function onClick():Void
	{
		if (validate(Next))
		{
			this._nexts = [ {step: next.step, params: next.params}];
			super.onClick();
		}
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