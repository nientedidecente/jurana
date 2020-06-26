package jurana.scenes;

import h2d.Camera;
import jurana.entities.Enemy;
import jurana.config.Colours;
import hxd.Key;
import hxd.Event;
import ui.UiHelper;
import jurana.entities.Player;

class Level extends BaseScene {
	static final THRESHOLD = 100;

	var camera:Camera;
	var player:Player;
	var gameOver = false;
	var level = 1;

	override function init() {
		super.init();
		gameOver = false;
		var bg = UiHelper.addBackground(this, Colours.BACKGROUND);
		camera = new Camera(this);
		for (i in 0...200) {
			var enemy = new Enemy(camera, level);
			enemy.x = 200 + 200 * (1 * i);
			enemy.y = -(100 + 200 * (1 * i));
		}

		player = new Player(camera);

		player.x = bg.width * .5;
		player.y = bg.height * .5;
	}

	override function update(dt:Float) {
		if (gameOver) {
			return;
		}

		player.update(dt);

		camera.viewX = player.x;
		camera.viewY = player.y;
	}

	public function registerHandlers(onQuit:Void->Void, onStart:Void->Void) {
		this.addEventListener(function(event:Event) {
			if (event.kind == EventKind.EKeyDown && event.keyCode == Key.Q) {
				onQuit();
			}

			if (event.kind == EventKind.EKeyDown && event.keyCode == Key.ENTER) {
				onStart();
			}
		});
	}
}
