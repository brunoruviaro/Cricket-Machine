////////////////////////
// Cricket Machine
////////////////////////

// Choose crickets
~myCrickets = (1..16);

// Load SynthDefs
"Cricket_SynthDef.scd".loadRelative;

// Load Crickets
"Cricket_Collection.scd".loadRelative;

// Start GUI
"Crickets_GUI.scd".loadRelative;


// Use this to close all windows:
Window.closeAll;
