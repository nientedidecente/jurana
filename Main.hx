import hxd.App;
import h2d.Bitmap;
import h2d.Tile;
import h2d.Interactive;

class Main extends App {
	static function main() {
		new Main();
	}

	var b:Bitmap;
	var enemy:Bitmap;
	var velocity = 0;

	static final SPEED = 10;
	static final ENEMY_SPEED = 10;

	override function init() {
		b = new Bitmap(Tile.fromColor(0x00ff00, 60, 60), s2d);
		b.x = 60;
		b.y = s2d.height * .5;
		b.tile = b.tile.center();

		enemy = new Bitmap(Tile.fromColor(0xff0000, 60, 60), s2d);
		enemy.tile = enemy.tile.center();
		enemy.x = 300;
		enemy.y = s2d.height * .5;

		var i = new Interactive(s2d.width, s2d.height, s2d);
		i.onPush = function(e) {
			var direction = e.relX <= b.x ? -1 : 1;
			velocity = direction * SPEED;
		}

		i.onRelease = function(_) {
			velocity = 0;
		}
	}

	override function update(dt:Float) {
		b.rotation += .05;
		b.x += velocity;

		enemy.rotation += .1;
	}
}
