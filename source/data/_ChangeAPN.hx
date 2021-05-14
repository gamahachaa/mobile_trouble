package data;

//import tstool.process.Action;
//import tstool.process.ActionMemo;
import tstool.process.Descision;
import tstool.process.Process;
//import tstool.process.TripletTemplate;
import tstool.salt.SOTemplate;
//import tstool.salt.TemplateMail;

/**
 * ...
 * @author bb
 */
//class _ChangeAPN extends Action
class _ChangeAPN extends Descision
{
	/*inline function getNext():Class<Process>
	{
		return _AddMemoInMarilyn;
	}
	override public function onClick():Void
	{
		this._nexts = [{step: getNext(), params: []}];
		super.onClick();
	}*/
	//public function new()
	//{
		//super(SOTemplate.MOBILE_APN);
	//}
     //override inline function getNext():Class<Process>
	//{
		//return _AddMemoInMarilyn;
	//}
	override public function onYesClick():Void
	{
		this._nexts = [{step: _SendAPNInstructions, params: []}];
		super.onYesClick();
	}

	override public function onNoClick():Void
	{
		this._nexts = [{step: _AddMemoInMarilyn, params: []}];
		super.onNoClick();
	}

	//override public function onMidClick():Void
	//{
		//this._nexts = [{step: getNext(), params: []}];
		//super.onMidClick();
	//}
}