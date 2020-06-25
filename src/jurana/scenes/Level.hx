package jurana.scenes;

import h2d.Text;
import haxe.Timer;
import jurana.config.Colours;
import hxd.Key;
import hxd.Event;
import ui.UiHelper;
import jurana.entities.Collidable;
import jurana.entities.Goal;
import jurana.entities.Enemy;
import jurana.entities.Player;

class Level extends BaseScene {
	static final THRESHOLD = 100;

	var goal:Goal;
	var player:Player;
	var enemies = new Array<Collidable>();
	var gameOver = false;
	var level = 1;

	override function init() {
		super.init();
		gameOver = false;
		enemies = new Array<Collidable>();
		UiHelper.addBackground(this, Colours.BACKGROUND);

		player = new Player(this);
		player.x = 60;
		player.y = this.height * .5;

		for (i in 0...4) {
			var enemy = new Enemy(this, level);
			enemy.y = this.height * .5;
			enemy.x = 200 + (i * 250);
			enemies.push(enemy);
		}
		goal = new Goal(this);

		addLevelLabel();
	}

	function addLevelLabel() {
		var levelLabel = UiHelper.addHeader('Level ${level}', this);
		var infoLabel:Null<Text> = null;
		if (level == 1) {
			infoLabel = UiHelper.addInfo("[ARROWS] to Move\n[SPACE] to Stop", this);
		}
		Timer.delay(function() {
			levelLabel.remove();
			if (infoLabel != null)
				infoLabel.remove();
		}, 1000);
	}

	override function update(dt:Float) {
		if (gameOver) {
			return;
		}

		player.update(dt);
		for (enemy in enemies) {
			enemy.update(dt);
		}

		checkCollisions();

		checkOutOfBounds();
	}

	function checkCollisions() {
		// trace(Timer.fps());
		if (player == null) {
			return;
		}

		var collision = player.isColliding(goal);
		if (collision) {
			trace('${Date.now()}: collision happened');
			this.removeEntities();
			gameOver = true;
			this.printWinner();
			return;
		}

		collision = player.isCollidingWithShapes(enemies);
		if (collision) {
			trace('${Date.now()}: collision happened');
			this.removeEntities();
			gameOver = true;
			this.printLoser();
		}
	}

	function checkOutOfBounds() {
		if ((player.x > this.width + THRESHOLD || player.x < -THRESHOLD)
			|| (player.y > this.height + THRESHOLD || player.y < -THRESHOLD)) {
			this.removeEntities();
			gameOver = true;
			this.printLoser();
		}
	}

	function removeEntities() {
		player.destroy();
		goal.destroy();
		for (enemy in enemies) {
			enemy.destroy();
		}
	}

	function printWinner() {
		printHeader("YOU WON!");
		level += 1;
		printInfo('to level ${level}');
	}

	function printLoser() {
		UiHelper.addHeader("GAME OVER!", this, 0xff0000);
		printInfo("Retry");
	}

	function printHeader(message:String) {
		UiHelper.addHeader(message, this);
	}

	function printInfo(action) {
		UiHelper.addInfo('[ENTER] - ${action}\n[Q] - quit to Menu', this);
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
