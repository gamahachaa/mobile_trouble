package;



import coverage.gis._CheckNetWork;
import flixel.FlxG;
import flixel.FlxGame;
import flixel.FlxState;
import flixel.input.keyboard.FlxKey;
import tstool.utils.XapiHelper;

import lime.utils.Assets;
import tstool.layout.UI;
import tstool.process.Process;
//import flixel.system.FlxAssets;
import flixel.text.FlxText.FlxTextFormat;
import flixel.text.FlxText.FlxTextFormatMarkerPair;
import flixel.util.FlxColor;
import flixel.util.FlxSave;
import tstool.MainApp;

import js.Browser;
import js.html.Location;
//import lime.utils.Assets;
//import openfl.display.Sprite;
import tstool.layout.History;
import tstool.layout.Login;
//import tstool.layout.SaltColor;
import tstool.salt.Agent;
import tstool.salt.Customer;
//import tstool.utils.Csv;
import tstool.utils.Translator;
import tstool.utils.VersionTracker;
import tstool.utils.XapiTracker;

/**
 * ...
 * @author bb
 */


class Main extends MainApp
{
	//public static var LIB_FOLDER:String;
	//public static var MAIL_WRAPPER_URL:String = LIB_FOLDER + "php/mail/index.php";
	
	public static var HISTORY:History;
	public static var adminFile:tstool.utils.Csv;
	public static var tongue:Translator;
	public static var user:Agent;
	public static var customer:Customer;
	//public static var track:XapiTracker;
	//#if debug
	public static var trackH:XapiHelper;
	//#else
	//public static var track:XapiTracker;
	//#end
	public static var VERSION:String;
	public static var VERSION_TRACKER:VersionTracker;
	public static var LOCATION:Location;
	public static var DEBUG:Bool;
	public static var DEBUG_LEVEL:Int;
	public static var COOKIE: FlxSave;
	
	public static var LANGS:Array<String> = ["fr-FR","de-DE","en-GB","it-IT"];
	public static inline var LAST_STEP:Class<Process> = End;
	public static inline var START_STEP:Class<Process> = Intro;
	public static inline var INTRO_PIC:String = "intro/favicon.png";
	public static inline var LIB_FOLDER_LOGIN:String= "/commonlibs/";
	/**
	 * FORMAT COLOR
	 * */
	
	public function new() 
	{
		super({
				cookie:"mobile_trouble_20210205.user",
				scriptName:"mobile_trouble",
				libFolder: LIB_FOLDER_LOGIN
				
		});
		//LIB_FOLDER = "../trouble/";
		tongue = MainApp.translator;
		//COOKIE = MainApp.save;
		HISTORY = MainApp.stack;
		LOCATION = MainApp.location;
		//track =  MainApp.xapiTracker;
		//#if debug
		trackH =  MainApp.xapiHelper;
		//#else
		//track =  MainApp.xapiTracker;
		//#end
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
		//#if !debug
		//Main.track.setActor();
		//#end
		#if debug
			/**
			 * USe this  to debug a slide
			 */
			next = new Intro();
			//next = new _CheckNetWork();
		#end
		tongue.initialize(MainApp.agent.mainLanguage, ()->(FlxG.switchState( old ? next : tuto)) );
	}
}