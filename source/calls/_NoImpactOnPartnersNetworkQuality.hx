package calls;

import _AddMemoInMarilyn;
import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _NoImpactOnPartnersNetworkQuality extends Action 
{

	override public function onClick():Void
	{
		this._nexts = [{step: _AddMemoInMarilyn}];
		super.onClick();
	}
	
}