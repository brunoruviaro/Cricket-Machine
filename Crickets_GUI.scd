///////////////////////
// Cricket Machine
// GUI
///////////////////////

//Window.closeAll; // use this to close all windows

var availableBounds = Window.availableBounds;
var width = 150;
var height = 50;
var xbound = availableBounds.width - width;
var ybound = availableBounds.height - height;

Window.closeAll;

~fade = {arg win;
	var rout, steps = 100;
	rout = Routine {
		    steps.do({ arg i;
			i = steps - i / steps;
			//i.postln;
			{win.view.background = Color.red(0.5,i)}.defer(0);
			0.01.wait;
		    });
		// "evaded...".postln;
}.play;
};

~makeWindow = { var w, b, c;
	// Choose this cricket
	c = ~myCrickets.choose;
    // Create new window somewhere
	w = Window.new(
		name: "Cricket",
		bounds: Rect.new(
			left: xbound.rand,
			top: ybound.rand,
			width: width,
			height: height),
		resizable: false,
		border: true
	).front;
	// Create button;
	b = Button.new(w, Rect(0,0,width,height));
	b.states = [["Click It!", Color.white, Color.red(0.7, 0.9)]];
	b.action = {
		~makeWindow.value;
		~fade.value(w);
		b.visible_(false);
		~cricketArray[c].play;
		["chirp", c].postln};
	//b.action = b.visible_(false), ~makeWindow;
};

~makeWindow.value;

"End of Cricket GUI file".postln;
"GO!".postln;