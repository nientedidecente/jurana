package jurana.scenes;

import ui.UiHelper;
import sdl.Event.EventType;
import hxd.Key;
import ui.UiHelper;
import hxd.Event;
import h2d.Scene;

class Menu extends Scene {
	public function new(onStart:Void->Void) {
		super();
		UiHelper.addBackground(this);
		UiHelper.addHeader('Jurana', this);
		UiHelper.addInfo("[Space] to Start\n[ESC] to Quit", this);
		this.addEventListener(function(event:Event) {
			if (event.kind == EventKind.EKeyDown && event.keyCode == Key.SPACE) {
				onStart();
			}
		});
	}
}
