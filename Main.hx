import hxd.App;
import h2d.Bitmap;
import h2d.Tile;
import h2d.Interactive;

class Main extends App {
	static function main() {
		new Main();
	}

	static final SPEED = 10;
	static final ENEMY_SPEED = 10;

	var player:Bitmap;
	var enemies = new Array<Bitmap>();
	var velocity = 0;

	override function init() {
		player = new Bitmap(Tile.fromColor(0x00ff00, 60, 60), s2d);
		player.x = 60;
		player.y = s2d.height * .5;
		player.tile = player.tile.center();

		for (i in 0...4) {
			var enemy = new Bitmap(Tile.fromColor(0xff0000, 60, 60), s2d);
			enemy.tile = enemy.tile.center();
			enemy.y = s2d.height * .5;
			enemy.x = 200 + (i * 200);

			enemies.push(enemy);
		}

		var i = new Interactive(s2d.width, s2d.height, s2d);
		i.onPush = function(e) {
			var direction = e.relX <= player.x ? -1 : 1;
			velocity = direction * SPEED;
		}

		i.onRelease = function(_) {
			velocity = 0;
		}
	}

	override function update(dt:Float) {
		player.rotation += .03;
		player.x += velocity;

		for (enemy in enemies) {
			enemy.rotation += .01;
		}
	}
}
