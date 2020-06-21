package jurana.entities;

import h2d.col.Point;
import hxd.Key;
import h2d.Tile;
import h2d.Scene;
import differ.shapes.Circle;

class Player extends Collidable {
	static final ROTATION_SPEED = 0.5;
	static final SIZE = 30;

	var speed:Int;
	var movement = new Point(0, 0);

	public function new(scene:Scene) {
		var tile = Tile.fromColor(0x2ec4b6, SIZE, SIZE);
		tile = tile.center();
		super(scene, tile);
		this.speed = 500;
		this.collider = new Circle(this.x, this.y, SIZE * .5);
	}

	override function update(dt: Float) {
		super.update(dt);

		this.movement.x = 0;
		this.movement.y = 0;

		if (Key.isDown(Key.RIGHT)) {
			this.movement.x = 1;
			this.rotation += ROTATION_SPEED;
		}

		if (Key.isDown(Key.UP)) {
			this.movement.y = -1;
			this.rotation += ROTATION_SPEED;
		}

		if (Key.isDown(Key.LEFT)) {
			this.movement.x = -1;
			this.rotation -= ROTATION_SPEED;
		}

		if (Key.isDown(Key.DOWN)) {
			this.movement.y = 1;
			this.rotation -= ROTATION_SPEED;
		}

		this.movement.normalize();
		this.x += this.movement.x * this.speed * dt;
		this.y += this.movement.y * this.speed * dt;
	}
}
