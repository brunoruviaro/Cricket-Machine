////////////////////////
// Cricket Machine
////////////////////////

// Choose crickets
~myCrickets = (1..16);

// Load SynthDefs
"Cricket-Machine/Cricket_SynthDef.scd".loadRelative;

// Load Crickets
"Cricket-Machine/Cricket_Collection.scd".loadRelative;

// Start GUI
"Cricket-Machine/Crickets_GUI.scd".loadRelative;


// Use this to close all windows:
Window.closeAll;
