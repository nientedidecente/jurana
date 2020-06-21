package jurana.scenes;

import hxd.Key;
import hxd.Event;
import ui.UiHelper;
import jurana.entities.Collidable;
import jurana.entities.Goal;
import jurana.entities.Enemy;
import jurana.entities.Player;

class Level extends BaseScene {
	var goal:Goal;
	var player:Player;
	var enemies = new Array<Collidable>();
	var gameOver = false;

	override function init() {
		super.init();
		UiHelper.addBackground(this);
		gameOver = false;
		enemies = new Array<Collidable>();
		UiHelper.addBackground(this);
		player = new Player(this);
		player.x = 60;
		player.y = this.height * .5;
		for (i in 0...4) {
			var enemy = new Enemy(this);

			enemy.y = this.height * .5;
			enemy.x = 200 + (i * 250);
			enemies.push(enemy);
		}
		goal = new Goal(this);
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

	function removeEntities() {
		player.destroy();
		goal.destroy();
		for (enemy in enemies) {
			enemy.destroy();
		}
	}

	function printWinner() {
		printHeader("YOU WON!");
		printInfo();
	}

	function printLoser() {
		printHeader("GAME OVER!");
		printInfo();
	}

	function printHeader(message:String) {
		UiHelper.addHeader(message, this);
	}

	function printInfo() {
		UiHelper.addInfo("[R] - to restart\n[Q] - quit to Menu\n[ESC] - to Exit Game", this);
	}

	public function registerHandlers(onQuit:Void->Void, onRestart:Void->Void) {
		this.addEventListener(function(event:Event) {
			if (event.kind == EventKind.EKeyDown && event.keyCode == Key.Q) {
				onQuit();
			}

			if (event.kind == EventKind.EKeyDown && event.keyCode == Key.R) {
				onRestart();
			}
		});
	}
}
