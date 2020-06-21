package jurana.scenes;

import h2d.Scene;
import ui.UiHelper;
import hxd.Event;
import hxd.Key;

class Menu extends BaseScene {
	override function init() {
		super.init();
		UiHelper.addBackground(this);
		UiHelper.addHeader('Jurana', this);
		UiHelper.addInfo("[Space] to Start\n[ESC] to Quit", this);
	}

	public function registerOnStart(onStart:Void->Void) {
		this.addEventListener(function(event:Event) {
			if (event.kind == EventKind.EKeyDown && event.keyCode == Key.SPACE) {
				onStart();
			}
		});
	}
}
