package coverage.gis;

//import tstool.process.Action;
import tstool.process.ActionMultipleInput;

/**
 * ...
 * @author bb
 */
class _CheckNetWork extends ActionMultipleInput 
{

	public function new ()
	{
		super(
		[{
			ereg: new EReg("[\\s\\S]*","i"),
			input:{
				width:500,
				prefix:"GIS Address",
				position: [bottom, left],
				debug:"Rue du Caudray 4, 1020 Renens, Switzerland"
			}
		}]
		);
	}
	
	
	override public function onClick():Void
	{
		if (validate())
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