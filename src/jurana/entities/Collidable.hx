package jurana.entities;

import h2d.Scene;
import h2d.Bitmap;
import h2d.Tile;
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
}
