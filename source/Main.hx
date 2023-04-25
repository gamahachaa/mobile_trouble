package;

import flixel.FlxG;
import flixel.FlxGame;
//import flixel.FlxState;
import flixel.input.keyboard.FlxKey;



import tstool.process.Process;


import flixel.util.FlxSave;
import tstool.MainApp;


import tstool.layout.History;
import tstool.layout.Login;

import tstool.salt.SaltAgent;
import tstool.salt.Customer;

import tstool.utils.VersionTracker;
import tstool.utils.XapiTracker;

/**
 * ...
 * @author bb
 */


class Main extends MainApp
{
	public static var HISTORY:History;
	public static var adminFile:tstool.utils.Csv;
	public static var user:SaltAgent;
	public static var customer:Customer;
	public static var trackH:XapiTracker;
	public static var VERSION:String;
	public static var VERSION_TRACKER:VersionTracker;
	public static var DEBUG:Bool;
	
	public static var DEBUG_LEVEL:Int;
	public static var COOKIE: FlxSave;
	public static inline var LAST_STEP:Class<Process> = End;
	public static inline var START_STEP:Class<Process> = Intro;

	static public inline var TMP_FILTER_ASSET_PATH:String = "assets/data/tmp/";
	static public var STORAGE_DISPLAY:Array<String> = [];
	
	public function new() 
	{
		super();
		HISTORY = MainApp.stack;
		
		trackH =  MainApp.xapiHelper;
	
		DEBUG = MainApp.debug;
	
		DEBUG_LEVEL = 1;
		VERSION_TRACKER = MainApp.versionTracker;
		customer = MainApp.cust;
		addChild(new FlxGame(1400, 880, Login, 1, 30, 30, true, true));
		

	}
	
	static public function setUpSystemDefault(?block:Bool = false )
	{
		FlxG.sound.soundTrayEnabled = false;
		FlxG.mouse.useSystemCursor = block;
		FlxG.keys.preventDefaultKeys = block ? [FlxKey.BACKSPACE, FlxKey.TAB] : [FlxKey.TAB];
	}
    static public function MOVE_ON(?old:Bool=false)
	{
		var next:Process = new Intro();
		var tuto:Process = new Tuto();
		setUpSystemDefault(true);

		#if debug
			/**
			 * USe this  to debug a slide
			 */
			next = new Intro();
			//next = new _CheckNetWork();
		#end
		MainApp.translator.initialize(MainApp.agent.mainLanguage, ()->(FlxG.switchState( old ? next : tuto)) );
	}
}