import differ.Collision;
import hxd.Key;
import hxd.App;
import h2d.Bitmap;
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
	var enemies = new Array<Enemy>();
	var velocity = 0;

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

		var collision = Collision.shapeWithShape(player.collider, goal.collider);
		if (collision != null) {
			trace('${Date.now()}: collision happened');
			/*
				player.destroy();
				goal.destroy();

				player = null;
				goal = null;
			 */
		}
	}
}
