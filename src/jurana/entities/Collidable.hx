package jurana.entities;

import h2d.Scene;
import h2d.Bitmap;
import h2d.Tile;
import differ.Collision;
import differ.shapes.Shape;

class Collidable extends Bitmap {
	var scene:Scene;

	public var collider:Null<Shape>;

	public function new(scene:Scene, tile:Tile, ?collider:Shape = null) {
		this.scene = scene;
		this.collider = collider;
		super(tile, scene);
	}

	public function destroy() {
		if (this.collider != null) {
			this.collider.destroy();
		}
		this.remove();
	}

	public function getCollider() {
		return this.collider;
	}

	public function isColliding(entity:Collidable) {
		var otherCollider = entity.getCollider();
		if (this.getCollider() == null || otherCollider == null) {
			return false;
		}

		var collision = Collision.shapeWithShape(this.getCollider(), otherCollider);

		return (collision != null);
	}

	public function isCollidingWithShapes(entities:Array<Collidable>) {
		for (entity in entities) {
			if (this.isColliding(entity)) {
				return true;
			}
		}
		return false;
	}

	public function update() {
		this.collider.x = this.x;
		this.collider.y = this.y;
	}
}
