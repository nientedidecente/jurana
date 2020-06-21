import ui.UiHelper;
import jurana.scenes.Menu;
import hxd.Key;
import hxd.App;
import jurana.entities.Collidable;
import jurana.entities.Goal;
import jurana.entities.Enemy;
import jurana.entities.Player;

class Game extends App {
	static function main() {
		new Game();
	}

	var goal:Goal;
	var player:Player;
	var enemies = new Array<Collidable>();
	var velocity = 0;
	var gameStarted = false;
	var gameOver = false;

	override function init() {
		var onStart = function() {
			startGame();
		};
		setScene2D(new Menu(onStart));
	}

	function startGame() {
		gameStarted = true;
		gameOver = false;
		enemies = new Array<Collidable>();
		UiHelper.addBackground(s2d);
		player = new Player(s2d);
		player.x = 60;
		player.y = s2d.height * .5;
		for (i in 0...4) {
			var enemy = new Enemy(s2d);

			enemy.y = s2d.height * .5;
			enemy.x = 200 + (i * 250);
			enemies.push(enemy);
		}
		goal = new Goal(s2d);
	}

	override function update(dt:Float) {
		if (Key.isPressed(Key.ESCAPE)) {
			trace('ESCAPE pressed');
			Sys.exit(0);
		}

		if (Key.isPressed(Key.R)) {
			this.startGame();
		}

		if (!gameStarted || gameOver) {
			return;
		}

		player.update();
		for (enemy in enemies) {
			enemy.update();
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
		UiHelper.addHeader(message, s2d);
	}

	function printInfo() {
		UiHelper.addInfo("R - to restart\n ESC - to quit", s2d);
	}
}
