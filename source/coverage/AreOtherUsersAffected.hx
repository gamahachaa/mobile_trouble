package coverage;

import capture.WhereAreU;
import flixel.util.FlxColor.TriadicHarmony;
import tstool.process.Descision;
import tstool.process.Process;
import tstool.process.Triplet;

/**
 * ...
 * @author bb
 */
class AreOtherUsersAffected extends Triplet 
{

	override public function onYesClick():Void
	{
		this._nexts = [{step: ch()}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: ch()}];
		super.onNoClick();
	}
	
	override public function onMidClick():Void
	{
		this._nexts = [{step: ch()}];
		super.onMidClick();
	}
	function ch():Class<Process>
	{
		return Main.HISTORY.isClassInteractionInHistory(WhereAreU, Yes)?_CouldBeNetwork:HasItWorkedBefore;
	}
}