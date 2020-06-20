package jurana.entities;

import hxd.Key;
import h2d.Tile;
import h2d.Scene;
import differ.shapes.Circle;

class Player extends Collidable {
	static final ROTATION_SPEED = 0.5;
	static final SIZE = 30;

	var speed:Int;

	public function new(scene:Scene) {
		var tile = Tile.fromColor(0x2ec4b6, SIZE, SIZE);
		tile = tile.center();
		super(scene, tile);
		this.speed = 10;
		this.collider = new Circle(this.x, this.y, SIZE * .5);
	}

	override function update() {
		super.update();

		if (Key.isDown(Key.RIGHT)) {
			this.x += this.speed;
			this.rotation += ROTATION_SPEED;
		}

		if (Key.isDown(Key.UP)) {
			this.y -= this.speed;
			this.rotation += ROTATION_SPEED;
		}

		if (Key.isDown(Key.LEFT)) {
			this.x -= this.speed;
			this.rotation -= ROTATION_SPEED;
		}

		if (Key.isDown(Key.DOWN)) {
			this.y += this.speed;
			this.rotation -= ROTATION_SPEED;
		}
	}
}
