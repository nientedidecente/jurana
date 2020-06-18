package entities;

import h2d.Tile;
import h2d.Bitmap;
import h2d.Scene;

class Enemy extends Bitmap {
	var speed:Int;
	var scene:Scene;

	public function new(scene:Scene) {
		this.scene = scene;
		var tile = Tile.fromColor(0xff0000, 60, 60);
        tile = tile.center();
		super(tile, scene);
		this.speed = 10;
    }

	public function update() {
        this.rotation += .03;
        this.y += this.speed;
    
		if (this.y <= 0 || this.y >= this.scene.height) {
			this.speed *= -1;
		}
	}
}
