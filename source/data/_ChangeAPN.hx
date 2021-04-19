package data;

import tstool.process.ActionMemo;
import tstool.process.Process;
import tstool.process.TripletTemplate;
import tstool.salt.SOTemplate;
import tstool.salt.TemplateMail;

/**
 * ...
 * @author bb
 */
class _ChangeAPN extends TripletTemplate 
{

	public function new() 
	{
		super(SOTemplate.MOBILE_APN);	
	}
	
	override inline function getNext():Class<Process>{
		return _AddMemoInMarilyn;
	}
	
	override public function onYesClick():Void
	{
		this._nexts = [{step: getNext(), params: []}];
		super.onYesClick();
	}
	
	
	override public function onNoClick():Void
	{
		this._nexts = [{step: getNext(), params: []}];
		super.onNoClick();
	}
	
	override public function onMidClick():Void
	{
		this._nexts = [{step: getNext(), params: []}];
		super.onMidClick();
	}
}