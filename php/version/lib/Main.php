<?php
/**
 * Generated by Haxe 4.0.5
 */

use \php\Boot;
use \php\_Boot\HxString;
use \sys\FileSystem;

/**
 * Simple script to retrun the lateste version of the no intenet js script
 * @author bb
 */
class Main {
	/**
	 * @var int
	 */
	public $_parentLevel;
	/**
	 * @var string
	 */
	public $dir;
	/**
	 * @var \EReg
	 */
	public $reg;

	/**
	 * @return void
	 */
	public static function main () {
		#src/Main.hx:20: characters 3-58
		$m = new Main(2, new \EReg("^bill_shock_js_(\\d{8}_\\d{6}).js\$", ""));
	}

	/**
	 * @param int $parentLevel
	 * @param \EReg $match
	 * 
	 * @return void
	 */
	public function __construct ($parentLevel, $match) {
		#src/Main.hx:24: characters 3-29
		$this->_parentLevel = $parentLevel;
		#src/Main.hx:25: characters 3-14
		$this->reg = $match;
		#src/Main.hx:26: characters 3-21
		$this->dir = (dirname($_SERVER["SCRIPT_FILENAME"])??'null') . "/";
		#src/Main.hx:27: characters 3-22
		$this->listMatchingFiles();
	}

	/**
	 * @return void
	 */
	public function listMatchingFiles () {
		#src/Main.hx:32: characters 3-35
		$dirPathTab = HxString::split($this->dir, "/");
		#src/Main.hx:34: characters 3-73
		$dirPathTab->splice($dirPathTab->length - 1 - $this->_parentLevel, $this->_parentLevel);
		#src/Main.hx:36: characters 3-37
		$appDir = $dirPathTab->join("/");
		#src/Main.hx:38: characters 3-48
		$files = FileSystem::readDirectory($appDir);
		#src/Main.hx:40: lines 40-46
		$_g = 0;
		while ($_g < $files->length) {
			#src/Main.hx:40: characters 8-9
			$i = ($files->arr[$_g] ?? null);
			#src/Main.hx:40: lines 40-46
			++$_g;
			#src/Main.hx:42: lines 42-45
			if ($this->reg->match($i)) {
				#src/Main.hx:43: characters 5-30
				echo(\Std::string($this->reg->matched(1)));
				#src/Main.hx:44: characters 5-11
				return;
			}
		}

		#src/Main.hx:47: characters 3-37
		echo("error files not found");
		#src/Main.hx:48: characters 3-9
		return;
	}
}

Boot::registerClass(Main::class, 'Main');
