////////////////////////
// Cricket Machine
// Array of Crickets
////////////////////////

// Originally created on 2013-04-13, Caltrain
// Updated on 2013-05-01 for 2013 SCLOrk concert
// Redesigned on 2014-02-11 at 11:11 AM for SCLOrk


// Array to store all crickets
~cricketArray = Array.newClear(17);


// Start count from 1, not zero
~cricketArray[0] = ["nothing here"];

//
// Create crickets
//

~cricketArray[1] = Pbind(
	\instrument, "cricket",
	\freq, (1430, 1450 .. 1900),
	\chirpDur, Prand([0.3, 0.4, 0.5], 1),
	\amp, Pwhite(0.01, 0.02, 1)
);

~cricketArray[2] = Pbind(
	\instrument, "cricket",
	\freq, (1430, 1450 .. 1800) * 2,
	\chirpDur, Pwhite(0.3, 0.5),
	\amp, Pwhite(0.01, 0.02, 1)
);

~cricketArray[3] = Pbind(
	\instrument, "cricket",
	\freq, (1710, 1790 .. 2340),
	\chirpDur, Pwhite(0.2, 0.5),
	\amp, Pwhite(0.01, 0.02, 1)
);

~cricketArray[4] = Pbind(
	\instrument, "cricket",
	\freq, (1710, 1790 .. 2340),
	\chirpDur, Prand([0.3, 0.4, 0.5]),
	\amp, Pwhite(0.01, 0.02, 1)
);

~cricketArray[5] = Pbind(
	\instrument, "cricket-gliss",
	\freq, (2500, 2890 .. 3400),
	\glissHz, 400,
	\chirpDur, Prand([0.2, 0.3, 0.35]),
	\amp, Pwhite(0.01, 0.02, 1)
);

~cricketArray[6] = Pbind(
	\instrument, "cricket-gliss",
	\freq, (1500, 1590 .. 3400),
	\glissHz, 1000,
	\chirpDur, Pwhite(0.2, 0.3),
	\amp, Pwhite(0.005, 0.015, 1)
);

~cricketArray[7] = Pfx(
	Pbind(
		\instrument, "cricket-bird",
		\freq, (1400, 2900 .. 3100),
		\glissFreq, 10,
		\glissHz, 1000,
		\chirpDur, Pwhite(0.3, 0.5),
		\amp, Pwhite(0.01, 0.03, 1),
		\dur, 1
	),
	\reverb, \room, Pwhite(0.2, 0.5), \damp, 0.5);

~cricketArray[8] = Pbind(
	\instrument, "cricket-gliss",
	\freq, (1900, 1930 .. 2000),
	\glissHz, 500,
	\chirpDur, Pwhite(0.1, 0.2),
	\amp, Pwhite(0.01, 0.02, 1)
);

~cricketArray[9] = Pbind(
	\instrument, "cricket-gliss",
	\freq, (1800, 1820 .. 2000),
	\glissHz, -100,
	\chirpDur, Prand([0.3, 0.4, 0.6]),
	\amp, Pwhite(0.01, 0.02, 1)
);

~cricketArray[10] = Pfx(
	Pbind(
		\instrument, "cricket-gliss",
		\freq, (2700, 2720 .. 3000),
		\glissHz, 500,
		\chirpDur, Prand([0.15, 0.2, 0.3]),
		\amp, Pwhite(0.01, 0.02, 1),
		\dur, 1),
	\reverb, \room, Pwhite(0.13, 0.24), \damp, 0.9);

~cricketArray[11] = Pfx(
	Pbind(
		\instrument, "cricket-gliss",
		\freq, (2800, 2830 .. 3400),
		\glissHz, Pwhite(-500, 500),
		\chirpDur, Prand([0.2, 0.3]),
		\amp, Pwhite(0.005, 0.01, 1),
		\dur, 2),
	\reverb, \mix, 0.2, \room, [0.1, 0.7].choose, \damp, 0.5);

~cricketArray[12] = Pbind(
	\instrument, "cricket-gliss",
	\freq, (1500, 1590 .. 2400),
	\glissHz, Pwhite(100, 200) * Pwrand([1, -1], [0.85, 0.15], inf),
	\chirpDur, Pwhite(0.2, 0.3),
	\amp, Pwhite(0.01, 0.02, 1)
);

~cricketArray[13] = Pbind(
	\instrument, "cricket-gliss",
	\freq, (500, 540 .. 890) * Pwhite(7, 7.2),
	\glissHz, Pwhite(220, 310),
	\chirpDur, Pseq([0.3, Pwhite(0.2, 0.28, 1)], inf),
	\amp, Pseg(Pseq([0.0001, 0.01, 0.0001], inf), 3, \exp),
	\dur, Pn(0.4, 20)
);

~cricketArray[14] = Pbind(
	\instrument, "cricket-gliss",
	\freq, (1710, 1790 .. 2340) * Pwhite(1, 1.01),
	\glissHz, Pwhite(20, 64),
	\chirpDur, Pseq([0.4, Pwhite(0.5, 0.7, 1)], inf),
	\amp, Pseg(Pseq([0.01, 0.0001], inf), 10, \exp),
	\dur, Pwhite(0.9, 1.61, 10)
);

~cricketArray[15] = Pfx(
	Pbind(
		\instrument, "cricket",
		\freq, (1430, 1433 .. 2000) * Pwhite(0.1, 1),
		\chirpDur, Prand([0.25, 0.3, 0.35], 1),
		\amp, Pwhite(0.02, 0.05, 1),
		\dur, 3),
	\reverb, \mix, 0.5, \room, 0.5, \damp, 0.3
);

~cricketArray[16] = Pfx(
	Pbind(
		\instrument, "cricket",
		\freq, (1430, 1433 .. 2000) * Pwhite(1, 1.01),
		\chirpDur, Pwhite(0.2, 0.3),
		\amp,  Pseg(Pseq([0.01, 0.0001], inf), 20, \exp) * Pseq([1, 0.5], inf),
		\dur, Pwhite(0.6, 0.69, 15)),
	\reverb, \mix, 0.5, \room, 0.1, \damp, 0.3
);

"End of Cricket Collection file".postln;

// Most Pbinds play only ONE chirp then stop.
// Terminating condition is inside Pwhite controlling amp.
