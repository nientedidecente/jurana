import h2d.Text.Align;
import hxd.Key;
import hxd.App;
import h2d.Bitmap;
import jurana.entities.Collidable;
import h2d.Tile;
import jurana.entities.Goal;
import jurana.entities.Enemy;
import jurana.entities.Player;

class Main extends App {
	static function main() {
		new Main();
	}

	var goal:Goal;
	var player:Player;
	var enemies = new Array<Collidable>();
	var velocity = 0;
	var gameOver = false;

	override function init() {
		var backgound = new Bitmap(Tile.fromColor(0xCBF3F0, s2d.width, s2d.height), s2d);
		backgound.x = 0;
		backgound.y = 0;

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

		if (gameOver) {
			return;
		}

		player.update();
		for (enemy in enemies) {
			enemy.update();
		}

		checkCollisions();
	}

	function checkCollisions() {
		if (player == null) {
			return;
		}

		var collision = player.isColliding(goal);
		if (collision) {
			trace('${Date.now()}: collision happened');
			player.destroy();
			goal.destroy();
			gameOver = true;
			this.printWinner();
			return;
		}

		collision = player.isCollidingWithShapes(enemies);
		if(collision){
			trace('${Date.now()}: collision happened');
			player.destroy();
			gameOver = true;
			this.printLoser();
		}

	}

	function printWinner() {
		printText("YOU WON!");
	}

	function printLoser() {
		printText("GAME OVER!");
	}

	function printText(message:String) {
		var t = new h2d.Text(hxd.res.DefaultFont.get(), s2d);
		t.scale(10);
		t.text = message;
		t.textAlign = Align.Center;
		t.x = s2d.width * .5;
		t.y = s2d.height * .5;
	}
}
