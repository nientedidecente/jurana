# jurana

simple frogger clone made in Haxe/Heaps
[master build js](https://jurana-haxe.surge.sh/)

[Video Example](https://www.loom.com/share/f986cb8ad9ed4ed4a0a5941549fe7ff5)

## How to Run
Prerequisites:
- [Haxe](https://haxe.org/download/) installed (used version 4.1.2 while developing).
- [Hashlink](https://hashlink.haxe.org/) installed (if you want to use the SDL version)

To install dependencies
```
haxelib install js.hxml // deps for js
haxelib install hl.hxml // deps for hashlink
```

**Build**

**Hashlink**

To build it as **hashlink-sdl** target: `haxe hl.hxml`
This will generate `build/game.hl` that will be runnable with `hl build/game.hl`

**Web/JS**

To build it as **web/js** target: `haxe js.hxml`
This will generate `web/game.js` that will be runnable by opening the `web/index.html` with a browser.


