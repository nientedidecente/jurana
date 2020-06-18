import hxd.App;
import entities.Enemy;
import entities.Player;

class Main extends App {
	static function main() {
		new Main();
	}

	var player:Player;
	var enemies = new Array<Enemy>();
	var velocity = 0;

	override function init() {
		player = new Player(s2d);
		player.x = 60;
		player.y = s2d.height * .5;

		for (i in 0...4) {
			var enemy = new Enemy(s2d);
			enemy.y = s2d.height * .5;
			enemy.x = 200 + (i * 250);

			enemies.push(enemy);
		}
	}

	override function update(dt:Float) {
		player.update();
		for (enemy in enemies) {
			enemy.update();
		}
	}
}
