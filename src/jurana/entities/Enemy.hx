package jurana.entities;

import jurana.config.Colours;
import jurana.libs.Randomizer;
import h2d.Tile;
import h2d.Scene;
import differ.shapes.Circle;

class Enemy extends Collidable {
	var size:Int;
	var speed:Int;
	var rotationSpeed:Float;

	public function new(scene:Scene, level:Int) {
		this.size = Randomizer.int(20, 60);
		var tile = Tile.fromColor(Colours.ENEMY, size, size);
		tile = tile.center();
		this.speed = (Randomizer.chance(50) ? -1 : 1) * Randomizer.int(3 + level, 10 + level);
		this.rotationSpeed = Randomizer.int(1, 5) / 100;
		super(scene, tile);
		collider = new Circle(this.x, this.y, size * .5);
	}

	override function update(dt:Float) {
		super.update(dt);
		this.rotation += this.rotationSpeed;
		this.y += this.speed;

		if (this.y <= 0 || this.y >= this.scene.height) {
			this.speed *= -1;
		}
	}
}
