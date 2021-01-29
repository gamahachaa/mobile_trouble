<?php
/**
 * Generated by Haxe 4.0.5
 */

namespace php\_Boot;

use \php\Boot;

/**
 * `String` implementation
 */
class HxString {
	/**
	 * @param string $str
	 * @param int $index
	 * 
	 * @return string
	 */
	public static function charAt ($str, $index) {
		#C:\HaxeToolkit\haxe\std/php/Boot.hx:743: characters 10-58
		if ($index < 0) {
			#C:\HaxeToolkit\haxe\std/php/Boot.hx:743: characters 22-24
			return "";
		} else {
			#C:\HaxeToolkit\haxe\std/php/Boot.hx:743: characters 27-58
			return mb_substr($str, $index, 1);
		}
	}

	/**
	 * @param string $str
	 * @param int $index
	 * 
	 * @return int
	 */
	public static function charCodeAt ($str, $index) {
		#C:\HaxeToolkit\haxe\std/php/Boot.hx:747: lines 747-749
		if (($index < 0) || ($str === "")) {
			#C:\HaxeToolkit\haxe\std/php/Boot.hx:748: characters 4-15
			return null;
		}
		#C:\HaxeToolkit\haxe\std/php/Boot.hx:750: lines 750-752
		if ($index === 0) {
			#C:\HaxeToolkit\haxe\std/php/Boot.hx:751: characters 11-30
			$code = ord($str[0]);
			if ($code < 192) {
				return $code;
			} else if ($code < 224) {
				return (($code - 192) << 6) + ord($str[1]) - 128;
			} else if ($code < 240) {
				return (($code - 224) << 12) + ((ord($str[1]) - 128) << 6) + ord($str[2]) - 128;
			} else {
				return (($code - 240) << 18) + ((ord($str[1]) - 128) << 12) + ((ord($str[2]) - 128) << 6) + ord($str[3]) - 128;
			}
		}
		#C:\HaxeToolkit\haxe\std/php/Boot.hx:753: characters 3-46
		$char = mb_substr($str, $index, 1);
		#C:\HaxeToolkit\haxe\std/php/Boot.hx:754: characters 10-50
		if ($char === "") {
			#C:\HaxeToolkit\haxe\std/php/Boot.hx:754: characters 23-27
			return null;
		} else {
			#C:\HaxeToolkit\haxe\std/php/Boot.hx:754: characters 30-50
			$code1 = ord($char[0]);
			if ($code1 < 192) {
				return $code1;
			} else if ($code1 < 224) {
				return (($code1 - 192) << 6) + ord($char[1]) - 128;
			} else if ($code1 < 240) {
				return (($code1 - 224) << 12) + ((ord($char[1]) - 128) << 6) + ord($char[2]) - 128;
			} else {
				return (($code1 - 240) << 18) + ((ord($char[1]) - 128) << 12) + ((ord($char[2]) - 128) << 6) + ord($char[3]) - 128;
			}
		}
	}

	/**
	 * @param int $code
	 * 
	 * @return string
	 */
	public static function fromCharCode ($code) {
		#C:\HaxeToolkit\haxe\std/php/Boot.hx:849: characters 3-29
		return mb_chr($code);
	}

	/**
	 * @param string $str
	 * @param string $search
	 * @param int $startIndex
	 * 
	 * @return int
	 */
	public static function indexOf ($str, $search, $startIndex = null) {
		#C:\HaxeToolkit\haxe\std/php/Boot.hx:758: lines 758-771
		if ($startIndex === null) {
			#C:\HaxeToolkit\haxe\std/php/Boot.hx:759: characters 4-18
			$startIndex = 0;
		} else {
			#C:\HaxeToolkit\haxe\std/php/Boot.hx:761: characters 4-28
			$length = mb_strlen($str);
			#C:\HaxeToolkit\haxe\std/php/Boot.hx:762: lines 762-767
			if ($startIndex < 0) {
				#C:\HaxeToolkit\haxe\std/php/Boot.hx:763: characters 5-25
				$startIndex += $length;
				#C:\HaxeToolkit\haxe\std/php/Boot.hx:764: lines 764-766
				if ($startIndex < 0) {
					#C:\HaxeToolkit\haxe\std/php/Boot.hx:765: characters 6-20
					$startIndex = 0;
				}
			}
			#C:\HaxeToolkit\haxe\std/php/Boot.hx:768: lines 768-770
			if (($startIndex >= $length) && ($search !== "")) {
				#C:\HaxeToolkit\haxe\std/php/Boot.hx:769: characters 5-14
				return -1;
			}
		}
		#C:\HaxeToolkit\haxe\std/php/Boot.hx:772: lines 772-777
		$index = null;
		if ($search === "") {
			#C:\HaxeToolkit\haxe\std/php/Boot.hx:773: characters 4-28
			$length1 = mb_strlen($str);
			#C:\HaxeToolkit\haxe\std/php/Boot.hx:772: lines 772-777
			$index = ($startIndex > $length1 ? $length1 : $startIndex);
		} else {
			$index = mb_strpos($str, $search, $startIndex);
		}
		#C:\HaxeToolkit\haxe\std/php/Boot.hx:778: characters 10-39
		if ($index === false) {
			#C:\HaxeToolkit\haxe\std/php/Boot.hx:778: characters 28-30
			return -1;
		} else {
			#C:\HaxeToolkit\haxe\std/php/Boot.hx:778: characters 33-38
			return $index;
		}
	}

	/**
	 * @param string $str
	 * @param string $search
	 * @param int $startIndex
	 * 
	 * @return int
	 */
	public static function lastIndexOf ($str, $search, $startIndex = null) {
		#C:\HaxeToolkit\haxe\std/php/Boot.hx:782: characters 3-26
		$start = $startIndex;
		#C:\HaxeToolkit\haxe\std/php/Boot.hx:783: lines 783-795
		if ($start === null) {
			#C:\HaxeToolkit\haxe\std/php/Boot.hx:784: characters 4-13
			$start = 0;
		} else {
			#C:\HaxeToolkit\haxe\std/php/Boot.hx:786: characters 4-28
			$length = mb_strlen($str);
			#C:\HaxeToolkit\haxe\std/php/Boot.hx:787: lines 787-794
			if ($start >= 0) {
				#C:\HaxeToolkit\haxe\std/php/Boot.hx:788: characters 5-27
				$start -= $length;
				#C:\HaxeToolkit\haxe\std/php/Boot.hx:789: lines 789-791
				if ($start > 0) {
					#C:\HaxeToolkit\haxe\std/php/Boot.hx:790: characters 6-15
					$start = 0;
				}
			} else if ($start < -$length) {
				#C:\HaxeToolkit\haxe\std/php/Boot.hx:793: characters 5-20
				$start = -$length;
			}
		}
		#C:\HaxeToolkit\haxe\std/php/Boot.hx:796: lines 796-801
		$index = null;
		if ($search === "") {
			#C:\HaxeToolkit\haxe\std/php/Boot.hx:797: characters 4-28
			$length1 = mb_strlen($str);
			#C:\HaxeToolkit\haxe\std/php/Boot.hx:796: lines 796-801
			$index = (($startIndex === null) || ($startIndex > $length1) ? $length1 : $startIndex);
		} else {
			$index = mb_strrpos($str, $search, $start);
		}
		#C:\HaxeToolkit\haxe\std/php/Boot.hx:802: lines 802-806
		if ($index === false) {
			#C:\HaxeToolkit\haxe\std/php/Boot.hx:803: characters 4-13
			return -1;
		} else {
			#C:\HaxeToolkit\haxe\std/php/Boot.hx:805: characters 4-16
			return $index;
		}
	}

	/**
	 * @param string $str
	 * @param string $delimiter
	 * 
	 * @return \Array_hx
	 */
	public static function split ($str, $delimiter) {
		#C:\HaxeToolkit\haxe\std/php/Boot.hx:810: lines 810-815
		$arr = null;
		if ($delimiter === "") {
			$arr = preg_split("//u", $str, -1, PREG_SPLIT_NO_EMPTY);
		} else {
			#C:\HaxeToolkit\haxe\std/php/Boot.hx:813: characters 4-49
			$delimiter = preg_quote($delimiter, "/");
			#C:\HaxeToolkit\haxe\std/php/Boot.hx:810: lines 810-815
			$arr = preg_split("/" . ($delimiter??'null') . "/", $str);
		}
		#C:\HaxeToolkit\haxe\std/php/Boot.hx:816: characters 3-41
		return \Array_hx::wrap($arr);
	}

	/**
	 * @param string $str
	 * @param int $pos
	 * @param int $len
	 * 
	 * @return string
	 */
	public static function substr ($str, $pos, $len = null) {
		#C:\HaxeToolkit\haxe\std/php/Boot.hx:820: characters 3-41
		return mb_substr($str, $pos, $len);
	}

	/**
	 * @param string $str
	 * @param int $startIndex
	 * @param int $endIndex
	 * 
	 * @return string
	 */
	public static function substring ($str, $startIndex, $endIndex = null) {
		#C:\HaxeToolkit\haxe\std/php/Boot.hx:824: lines 824-829
		if ($endIndex === null) {
			#C:\HaxeToolkit\haxe\std/php/Boot.hx:825: lines 825-827
			if ($startIndex < 0) {
				#C:\HaxeToolkit\haxe\std/php/Boot.hx:826: characters 5-19
				$startIndex = 0;
			}
			#C:\HaxeToolkit\haxe\std/php/Boot.hx:828: characters 4-44
			return mb_substr($str, $startIndex);
		}
		#C:\HaxeToolkit\haxe\std/php/Boot.hx:830: lines 830-832
		if ($endIndex < 0) {
			#C:\HaxeToolkit\haxe\std/php/Boot.hx:831: characters 4-16
			$endIndex = 0;
		}
		#C:\HaxeToolkit\haxe\std/php/Boot.hx:833: lines 833-835
		if ($startIndex < 0) {
			#C:\HaxeToolkit\haxe\std/php/Boot.hx:834: characters 4-18
			$startIndex = 0;
		}
		#C:\HaxeToolkit\haxe\std/php/Boot.hx:836: lines 836-840
		if ($startIndex > $endIndex) {
			#C:\HaxeToolkit\haxe\std/php/Boot.hx:837: characters 4-23
			$tmp = $endIndex;
			#C:\HaxeToolkit\haxe\std/php/Boot.hx:838: characters 4-25
			$endIndex = $startIndex;
			#C:\HaxeToolkit\haxe\std/php/Boot.hx:839: characters 4-20
			$startIndex = $tmp;
		}
		#C:\HaxeToolkit\haxe\std/php/Boot.hx:841: characters 3-66
		return mb_substr($str, $startIndex, $endIndex - $startIndex);
	}

	/**
	 * @param string $str
	 * 
	 * @return string
	 */
	public static function toLowerCase ($str) {
		#C:\HaxeToolkit\haxe\std/php/Boot.hx:739: characters 3-35
		return mb_strtolower($str);
	}

	/**
	 * @param string $str
	 * 
	 * @return string
	 */
	public static function toString ($str) {
		#C:\HaxeToolkit\haxe\std/php/Boot.hx:845: characters 3-13
		return $str;
	}

	/**
	 * @param string $str
	 * 
	 * @return string
	 */
	public static function toUpperCase ($str) {
		#C:\HaxeToolkit\haxe\std/php/Boot.hx:735: characters 3-35
		return mb_strtoupper($str);
	}
}

Boot::registerClass(HxString::class, 'php._Boot.HxString');