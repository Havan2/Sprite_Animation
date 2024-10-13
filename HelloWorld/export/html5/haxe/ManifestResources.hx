package;

import haxe.io.Bytes;
import haxe.io.Path;
import lime.utils.AssetBundle;
import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import lime.utils.Assets;

#if sys
import sys.FileSystem;
#end

#if disable_preloader_assets
@:dox(hide) class ManifestResources {
	public static var preloadLibraries:Array<Dynamic>;
	public static var preloadLibraryNames:Array<String>;
	public static var rootPath:String;

	public static function init (config:Dynamic):Void {
		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();
	}
}
#else
@:access(lime.utils.Assets)


@:keep @:dox(hide) class ManifestResources {


	public static var preloadLibraries:Array<AssetLibrary>;
	public static var preloadLibraryNames:Array<String>;
	public static var rootPath:String;


	public static function init (config:Dynamic):Void {

		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();

		rootPath = null;

		if (config != null && Reflect.hasField (config, "rootPath")) {

			rootPath = Reflect.field (config, "rootPath");

			if(!StringTools.endsWith (rootPath, "/")) {

				rootPath += "/";

			}

		}

		if (rootPath == null) {

			#if (ios || tvos || webassembly)
			rootPath = "assets/";
			#elseif android
			rootPath = "";
			#elseif (console || sys)
			rootPath = lime.system.System.applicationDirectory;
			#else
			rootPath = "./";
			#end

		}

		#if (openfl && !flash && !display)
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_monsterrat_ttf);
		
		#end

		var data, manifest, library, bundle;

		data = '{"name":null,"assets":"aoy4:pathy36:assets%2Fmusic%2Fmusic-goes-here.txty4:sizezy4:typey4:TEXTy2:idR1y7:preloadtgoR0y29:assets%2Fimages%2FDeath-3.pngR2i1375R3y5:IMAGER5R7R6tgoR0y29:assets%2Fimages%2FDeath-2.pngR2i1572R3R8R5R9R6tgoR0y30:assets%2Fimages%2FRunData.jsonR2i1861R3R4R5R10R6tgoR0y32:assets%2Fimages%2FDeathSheet.pngR2i1464R3R8R5R11R6tgoR0y29:assets%2Fimages%2FDeath-0.pngR2i1670R3R8R5R12R6tgoR0y29:assets%2Fimages%2FDeath-1.pngR2i1622R3R8R5R13R6tgoR0y29:assets%2Fimages%2FDeath-5.pngR2i1387R3R8R5R14R6tgoR0y29:assets%2Fimages%2FDeath-4.pngR2i1357R3R8R5R15R6tgoR0y33:assets%2Fimages%2FAttackSheet.pngR2i2746R3R8R5R16R6tgoR0y27:assets%2Fimages%2FRun-0.pngR2i1684R3R8R5R17R6tgoR0y27:assets%2Fimages%2FRun-1.pngR2i1691R3R8R5R18R6tgoR0y30:assets%2Fimages%2FAttack-8.pngR2i1699R3R8R5R19R6tgoR0y27:assets%2Fimages%2FRun-3.pngR2i1614R3R8R5R20R6tgoR0y27:assets%2Fimages%2FRun-2.pngR2i1692R3R8R5R21R6tgoR0y27:assets%2Fimages%2FRun-6.pngR2i1646R3R8R5R22R6tgoR0y27:assets%2Fimages%2FRun-7.pngR2i1649R3R8R5R23R6tgoR0y27:assets%2Fimages%2FRun-5.pngR2i1665R3R8R5R24R6tgoR0y27:assets%2Fimages%2FRun-4.pngR2i1643R3R8R5R25R6tgoR0y30:assets%2Fimages%2FAttack-0.pngR2i1737R3R8R5R26R6tgoR0y30:assets%2Fimages%2FAttack-1.pngR2i1856R3R8R5R27R6tgoR0y30:assets%2Fimages%2FAttack-3.pngR2i1808R3R8R5R28R6tgoR0y30:assets%2Fimages%2FAttack-2.pngR2i1876R3R8R5R29R6tgoR0y30:assets%2Fimages%2FAttack-6.pngR2i1692R3R8R5R30R6tgoR0y30:assets%2Fimages%2FAttack-7.pngR2i1580R3R8R5R31R6tgoR0y30:assets%2Fimages%2FAttack-5.pngR2i1739R3R8R5R32R6tgoR0y30:assets%2Fimages%2FAttack-4.pngR2i1788R3R8R5R33R6tgoR0y33:assets%2Fimages%2FAttackData.jsonR2i2082R3R4R5R34R6tgoR0y32:assets%2Fimages%2FDeathData.jsonR2i1493R3R4R5R35R6tgoR0y30:assets%2Fimages%2FRunSheet.pngR2i1948R3R8R5R36R6tgoR0y36:assets%2Fimages%2Fimages-go-here.txtR2zR3R4R5R37R6tgoR0y36:assets%2Fsounds%2Fsounds-go-here.txtR2zR3R4R5R38R6tgoR0y34:assets%2Fdata%2Fdata-goes-here.txtR2zR3R4R5R39R6tgoR2i39706R3y5:MUSICR5y28:flixel%2Fsounds%2Fflixel.mp3y9:pathGroupaR41y28:flixel%2Fsounds%2Fflixel.ogghR6tgoR2i8220R3R40R5y26:flixel%2Fsounds%2Fbeep.mp3R42aR44y26:flixel%2Fsounds%2Fbeep.ogghR6tgoR2i6840R3y5:SOUNDR5R45R42aR44R45hgoR2i33629R3R46R5R43R42aR41R43hgoR2i15744R3y4:FONTy9:classNamey35:__ASSET__flixel_fonts_nokiafc22_ttfR5y30:flixel%2Ffonts%2Fnokiafc22.ttfR6tgoR2i29724R3R47R48y36:__ASSET__flixel_fonts_monsterrat_ttfR5y31:flixel%2Ffonts%2Fmonsterrat.ttfR6tgoR0y33:flixel%2Fimages%2Fui%2Fbutton.pngR2i277R3R8R5R53R6tgoR0y36:flixel%2Fimages%2Flogo%2Fdefault.pngR2i505R3R8R5R54R6tgoR0y42:flixel%2Fimages%2Ftransitions%2Fcircle.pngR2i824R3R8R5R55R6tgoR0y53:flixel%2Fimages%2Ftransitions%2Fdiagonal_gradient.pngR2i3812R3R8R5R56R6tgoR0y43:flixel%2Fimages%2Ftransitions%2Fdiamond.pngR2i788R3R8R5R57R6tgoR0y42:flixel%2Fimages%2Ftransitions%2Fsquare.pngR2i383R3R8R5R58R6tgh","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
		manifest = AssetManifest.parse (data, rootPath);
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("default", library);
		

		library = Assets.getLibrary ("default");
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("default");
		

	}


}

#if !display
#if flash

@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_music_goes_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_death_3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_death_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_rundata_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_deathsheet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_death_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_death_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_death_5_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_death_4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_attacksheet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_run_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_run_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_attack_8_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_run_3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_run_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_run_6_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_run_7_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_run_5_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_run_4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_attack_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_attack_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_attack_3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_attack_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_attack_6_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_attack_7_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_attack_5_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_attack_4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_attackdata_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_deathdata_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_runsheet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_images_go_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_data_goes_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_transitions_circle_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_transitions_diagonal_gradient_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_transitions_diamond_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_transitions_square_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_default_json extends null { }


#elseif (desktop || cpp)

@:keep @:file("assets/music/music-goes-here.txt") @:noCompletion #if display private #end class __ASSET__assets_music_music_goes_here_txt extends haxe.io.Bytes {}
@:keep @:image("assets/images/Death-3.png") @:noCompletion #if display private #end class __ASSET__assets_images_death_3_png extends lime.graphics.Image {}
@:keep @:image("assets/images/Death-2.png") @:noCompletion #if display private #end class __ASSET__assets_images_death_2_png extends lime.graphics.Image {}
@:keep @:file("assets/images/RunData.json") @:noCompletion #if display private #end class __ASSET__assets_images_rundata_json extends haxe.io.Bytes {}
@:keep @:image("assets/images/DeathSheet.png") @:noCompletion #if display private #end class __ASSET__assets_images_deathsheet_png extends lime.graphics.Image {}
@:keep @:image("assets/images/Death-0.png") @:noCompletion #if display private #end class __ASSET__assets_images_death_0_png extends lime.graphics.Image {}
@:keep @:image("assets/images/Death-1.png") @:noCompletion #if display private #end class __ASSET__assets_images_death_1_png extends lime.graphics.Image {}
@:keep @:image("assets/images/Death-5.png") @:noCompletion #if display private #end class __ASSET__assets_images_death_5_png extends lime.graphics.Image {}
@:keep @:image("assets/images/Death-4.png") @:noCompletion #if display private #end class __ASSET__assets_images_death_4_png extends lime.graphics.Image {}
@:keep @:image("assets/images/AttackSheet.png") @:noCompletion #if display private #end class __ASSET__assets_images_attacksheet_png extends lime.graphics.Image {}
@:keep @:image("assets/images/Run-0.png") @:noCompletion #if display private #end class __ASSET__assets_images_run_0_png extends lime.graphics.Image {}
@:keep @:image("assets/images/Run-1.png") @:noCompletion #if display private #end class __ASSET__assets_images_run_1_png extends lime.graphics.Image {}
@:keep @:image("assets/images/Attack-8.png") @:noCompletion #if display private #end class __ASSET__assets_images_attack_8_png extends lime.graphics.Image {}
@:keep @:image("assets/images/Run-3.png") @:noCompletion #if display private #end class __ASSET__assets_images_run_3_png extends lime.graphics.Image {}
@:keep @:image("assets/images/Run-2.png") @:noCompletion #if display private #end class __ASSET__assets_images_run_2_png extends lime.graphics.Image {}
@:keep @:image("assets/images/Run-6.png") @:noCompletion #if display private #end class __ASSET__assets_images_run_6_png extends lime.graphics.Image {}
@:keep @:image("assets/images/Run-7.png") @:noCompletion #if display private #end class __ASSET__assets_images_run_7_png extends lime.graphics.Image {}
@:keep @:image("assets/images/Run-5.png") @:noCompletion #if display private #end class __ASSET__assets_images_run_5_png extends lime.graphics.Image {}
@:keep @:image("assets/images/Run-4.png") @:noCompletion #if display private #end class __ASSET__assets_images_run_4_png extends lime.graphics.Image {}
@:keep @:image("assets/images/Attack-0.png") @:noCompletion #if display private #end class __ASSET__assets_images_attack_0_png extends lime.graphics.Image {}
@:keep @:image("assets/images/Attack-1.png") @:noCompletion #if display private #end class __ASSET__assets_images_attack_1_png extends lime.graphics.Image {}
@:keep @:image("assets/images/Attack-3.png") @:noCompletion #if display private #end class __ASSET__assets_images_attack_3_png extends lime.graphics.Image {}
@:keep @:image("assets/images/Attack-2.png") @:noCompletion #if display private #end class __ASSET__assets_images_attack_2_png extends lime.graphics.Image {}
@:keep @:image("assets/images/Attack-6.png") @:noCompletion #if display private #end class __ASSET__assets_images_attack_6_png extends lime.graphics.Image {}
@:keep @:image("assets/images/Attack-7.png") @:noCompletion #if display private #end class __ASSET__assets_images_attack_7_png extends lime.graphics.Image {}
@:keep @:image("assets/images/Attack-5.png") @:noCompletion #if display private #end class __ASSET__assets_images_attack_5_png extends lime.graphics.Image {}
@:keep @:image("assets/images/Attack-4.png") @:noCompletion #if display private #end class __ASSET__assets_images_attack_4_png extends lime.graphics.Image {}
@:keep @:file("assets/images/AttackData.json") @:noCompletion #if display private #end class __ASSET__assets_images_attackdata_json extends haxe.io.Bytes {}
@:keep @:file("assets/images/DeathData.json") @:noCompletion #if display private #end class __ASSET__assets_images_deathdata_json extends haxe.io.Bytes {}
@:keep @:image("assets/images/RunSheet.png") @:noCompletion #if display private #end class __ASSET__assets_images_runsheet_png extends lime.graphics.Image {}
@:keep @:file("assets/images/images-go-here.txt") @:noCompletion #if display private #end class __ASSET__assets_images_images_go_here_txt extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/sounds-go-here.txt") @:noCompletion #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends haxe.io.Bytes {}
@:keep @:file("assets/data/data-goes-here.txt") @:noCompletion #if display private #end class __ASSET__assets_data_data_goes_here_txt extends haxe.io.Bytes {}
@:keep @:file("/usr/local/lib/haxe/lib/flixel/5,8,0/assets/sounds/flixel.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends haxe.io.Bytes {}
@:keep @:file("/usr/local/lib/haxe/lib/flixel/5,8,0/assets/sounds/beep.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends haxe.io.Bytes {}
@:keep @:file("/usr/local/lib/haxe/lib/flixel/5,8,0/assets/sounds/beep.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends haxe.io.Bytes {}
@:keep @:file("/usr/local/lib/haxe/lib/flixel/5,8,0/assets/sounds/flixel.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends haxe.io.Bytes {}
@:keep @:font("export/html5/obj/webfont/nokiafc22.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:keep @:font("export/html5/obj/webfont/monsterrat.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:keep @:image("/usr/local/lib/haxe/lib/flixel/5,8,0/assets/images/ui/button.png") @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:keep @:image("/usr/local/lib/haxe/lib/flixel/5,8,0/assets/images/logo/default.png") @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends lime.graphics.Image {}
@:keep @:image("/usr/local/lib/haxe/lib/flixel-addons/3,2,3/assets/images/transitions/circle.png") @:noCompletion #if display private #end class __ASSET__flixel_images_transitions_circle_png extends lime.graphics.Image {}
@:keep @:image("/usr/local/lib/haxe/lib/flixel-addons/3,2,3/assets/images/transitions/diagonal_gradient.png") @:noCompletion #if display private #end class __ASSET__flixel_images_transitions_diagonal_gradient_png extends lime.graphics.Image {}
@:keep @:image("/usr/local/lib/haxe/lib/flixel-addons/3,2,3/assets/images/transitions/diamond.png") @:noCompletion #if display private #end class __ASSET__flixel_images_transitions_diamond_png extends lime.graphics.Image {}
@:keep @:image("/usr/local/lib/haxe/lib/flixel-addons/3,2,3/assets/images/transitions/square.png") @:noCompletion #if display private #end class __ASSET__flixel_images_transitions_square_png extends lime.graphics.Image {}
@:keep @:file("") @:noCompletion #if display private #end class __ASSET__manifest_default_json extends haxe.io.Bytes {}



#else

@:keep @:expose('__ASSET__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/nokiafc22"; #else ascender = 2048; descender = -512; height = 2816; numGlyphs = 172; underlinePosition = -640; underlineThickness = 256; unitsPerEM = 2048; #end name = "Nokia Cellphone FC Small"; super (); }}
@:keep @:expose('__ASSET__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/monsterrat"; #else ascender = 968; descender = -251; height = 1219; numGlyphs = 263; underlinePosition = -150; underlineThickness = 50; unitsPerEM = 1000; #end name = "Monsterrat"; super (); }}


#end

#if (openfl && !flash)

#if html5
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#else
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#end

#end
#end

#end