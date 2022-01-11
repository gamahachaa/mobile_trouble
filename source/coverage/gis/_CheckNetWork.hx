package coverage.gis;

//import tstool.process.Action;
import tstool.process.ActionMultipleInput;
import tstool.process.Process;
import tstool.utils.ExpReg;

/**
 * ...
 * @author bb
 */
class _CheckNetWork extends ActionMultipleInput 
{
	public static inline var STREET:String = "Street";
	public static inline var NUMBER:String = "Nber";
	public static inline var ZIP:String = "Zip";
	public static inline var CITY:String = "City";

	public function new ()
	{
		super(
		[{
			ereg: new EReg(ExpReg.STREET, "gi"),
			
			input:{
				width:240,
				prefix:STREET,
				position: [bottom, left],
				debug:"Rue du Caudray"
			}
		},
		{
			ereg: new EReg(ExpReg.ADRESS_NUMBER,"gi"),
			input:{
				width:50,
				prefix:NUMBER,
				buddy:STREET,
				position: [top, right],
				debug:"4"
			}
		},
		{
			ereg: new EReg(ExpReg.ZIP,"i"),
			input:{
				width:50,
				prefix:ZIP,
				buddy:STREET,
				position: [bottom, left],
				debug:"1020"
			}
		},
		{
			ereg: new EReg(ExpReg.CITY,"i"),
			input:{
				width:120,
				prefix:CITY,
				buddy:ZIP,
				position: [top, right],
				debug:"Renens"
			}
		}
		]
		);
	}
	
	
	override public function onClick():Void
	{
		if (validate(Next))
		{
			this._nexts = [{step: _RegionCoverage, params: []}];
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