package jurana.scenes;

import jurana.config.Colours;
import h2d.Scene;
import ui.UiHelper;
import hxd.Event;
import hxd.Key;

class Menu extends BaseScene {
	override function init() {
		super.init();
		UiHelper.addBackground(this, Colours.BACKGROUND);
		UiHelper.addHeader('Jurana', this);
		#if js
		var escAction = 'to see the Code';
		#else
		var escAction = 'to Quit';
		#end
		UiHelper.addInfo('[ENTER] to Start\n[ESC] ${escAction}', this);
	}

	public function registerOnStart(onStart:Void->Void) {
		this.addEventListener(function(event:Event) {
			if (event.kind == EventKind.EKeyDown && event.keyCode == Key.ENTER) {
				onStart();
			}
		});
	}
}
