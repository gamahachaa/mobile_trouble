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
	static inline var G3:String = "3G";
	static inline var G4:String = "4G";
	static inline var OK:String = "ok";
	static inline var NOK:String = "nok";

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
			this._nexts = [{step: status.get(G4) == NOK && status.get(G3) == NOK ?_ThreeOneTwo:IsGisFailure}];
			super.onClick();
		}
	}
	
}