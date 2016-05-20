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
	).front.alwaysOnTop_(true);
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

// Function that creates GUI for next section of piece (scratch, transpose)
~nextSection = {
	var window, bufferNumFrames, scratch, slider, rate;
	window = Window.new("Cricket Control", 600@100, resizable: false).front.alwaysOnTop_(true);
	bufferNumFrames = 44100 * 40; // 40-sec buffer

	scratch = Button(window, Rect(5, 5, 90, 50))
	.states_([
		["scratch", Color.black, Color.white],
		["scratch", Color.black, Color.red]
	])
	.action_({ arg button;
		if(button.value==1,
			{~bufferRead.set(\which, 1); slider.knobColor = Color.red},
			{~bufferRead.set(\which, 0); slider.knobColor = Color.white});
	});

	slider = Slider(parent: window, bounds: Rect(100, 5, 495, 50))
	.action_({ ~bufferRead.set(\which, 1, \sliderScratch, slider.value.linlin(0, 1, 0, bufferNumFrames)) });

	rate = Button(window, Rect(345, 65, 250, 25))
	.states_([
		["click to transpose one octave below", Color.black, Color.white],
		["click to go back to original", Color.white, Color.gray]
	])
	.action_({ arg button;
		if(button.value==1,
			{ ~bufferRead.set(\rate, 1/2) },
			{ ~bufferRead.set(\rate, 1) });
	});
};

~nextSection.value;

// AppClock.sched(5, {~nextSection.value});

"End of Cricket GUI file".postln;
".";
"GO!".postln;
" ";