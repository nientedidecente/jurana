package jurana.scenes;

import hxd.Key;
import hxd.Event;
import h2d.Scene;
import ui.UiHelper;

class Level extends Scene {
	public function new(onQuit:Void->Void) {
		super();
		UiHelper.addBackground(this);
		this.addEventListener(function(event:Event) {
			if (event.kind == EventKind.EKeyDown && event.keyCode == Key.Q) {
				onQuit();
			}
		});
	}
}
