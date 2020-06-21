import jurana.scenes.BaseScene;
import jurana.scenes.Menu;
import jurana.scenes.Level;
import hxd.Key;
import hxd.App;

class Game extends App {
	var currentScene:Null<BaseScene>;

	function setCurrentScene(scene:BaseScene) {
		this.setScene2D(scene);
		currentScene = scene;
	}

	static function main() {
		new Game();
	}

	override function init() {
		mainMenu();
	}

	function mainMenu() {
		var onStart = function() {
			startGame();
		};
		var menuScene = new Menu();
		menuScene.registerOnStart(onStart);
		setCurrentScene(menuScene);
	}

	function startGame() {
		var levelScene = new Level();

		levelScene.registerHandlers(function() {
			mainMenu();
		}, function() {
			startGame();
		});
		setCurrentScene(levelScene);
	}

	override function update(dt:Float) {
		#if !js
		if (Key.isPressed(Key.ESCAPE)) {
			trace('ESCAPE pressed');
			Sys.exit(0);
		}
		#end

		if (currentScene != null) {
			currentScene.update(dt);
		}
	}
}
