package jurana.entities;

import jurana.config.Colours;
import h2d.Tile;
import h2d.Scene;
import differ.shapes.Polygon;

class Goal extends Collidable {
	static final SIZE = 20;

	public function new(scene:Scene) {
		var tile = Tile.fromColor(Colours.GOAL, SIZE, scene.height);
		tile = tile.center();
		super(scene, tile);
		this.x = scene.width - (SIZE / 2);
		this.y = scene.height * .5;
		collider = Polygon.rectangle(this.x, this.y, SIZE / 2, scene.height);
	}
}
