package jurana.entities;

import h2d.Bitmap;
import h2d.Tile;
import h2d.Scene;

class Goal extends Bitmap {
	var scene:Scene;

	public function new(scene:Scene) {
		this.scene = scene;
		var tile = Tile.fromColor(0x17635e, 10, scene.height);
		tile = tile.center();
		super(tile, scene);
		this.x = scene.width - 5;
		this.y = scene.height * .5;
	}
}
