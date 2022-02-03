package coverage.gis;

import ticket._ThreeOneTwo;
import tstool.process.ActionRadios;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class _RegionCoverage extends ActionRadios 
{
	public static inline var G3:String = "3G";
	public static inline var G4:String = "4G";
	public static inline var OK:String = "ok";
	public static inline var NOK:String = "nok";

	public function new() 
	{
		super(
		[
			{
				title: G3,
				values: [OK, NOK]
			},
			{
				title: G4,
				values: [OK, NOK]
			}
		]
		);
		
	}
	override public function onClick():Void
	{
		if (validate())
		{
			//this._nexts = [{step: status.get(G4) == NOK && status.get(G3) == NOK ?_ThreeOneTwo:IsGisFailure}];
			this._nexts = [{step: status.get(G4) == NOK && status.get(G3) == NOK ?_ThreeOneTwo:IsGisFailure}];
			super.onClick();
		}
	}
	
}