package entities;

import hxd.Key;
import h2d.Tile;
import h2d.Bitmap;
import h2d.Scene;

class Player extends Bitmap {
	var speed:Int;
	var scene:Scene;

	public function new(scene:Scene) {
		this.scene = scene;
		var tile = Tile.fromColor(0x00ff00, 60, 60);
        tile = tile.center();
		super(tile, scene);
		this.speed = 10;
    }

	public function update() {
		this.rotation += .01;
		
		if(Key.isDown(Key.RIGHT)){
			this.x += this.speed;
		}
		
		if(Key.isDown(Key.LEFT)){
			this.x -= this.speed;
		}
	}
}
