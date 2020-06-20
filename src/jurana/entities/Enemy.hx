package jurana.entities;

import jurana.libs.Randomizer;
import h2d.Tile;
import h2d.Bitmap;
import h2d.Scene;

class Enemy extends Bitmap {
	var speed:Int;
	var rotationSpeed:Float;
	var scene:Scene;

	public function new(scene:Scene) {
		this.scene = scene;
		var tile = Tile.fromColor(0xFF9F1C, 60, 60);
		tile = tile.center();
		this.speed = (Randomizer.chance(50) ? -1 : 1) * Randomizer.int(3, 10);
		this.rotationSpeed = Randomizer.int(1, 10) / 100;
		super(tile, scene);
	}

	public function update() {
		this.rotation += this.rotationSpeed;
		this.y += this.speed;

		if (this.y <= 0 || this.y >= this.scene.height) {
			this.speed *= -1;
		}
	}
}
