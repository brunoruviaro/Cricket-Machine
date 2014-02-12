/////////////////////
// Cricket Machine
// SynthDefs
/////////////////////


SynthDef("cricket", { arg freq = 1430, chirpDur = 0.2, amp = 0.01;
	var env, snd;
	env = EnvGen.ar(Env.triangle(dur: chirpDur, level: amp), doneAction: 2);
	snd = LFPar.ar(freq, 0, env);
	Out.ar(0, Mix.ar(snd))
}).add;

SynthDef("cricket-gliss", { arg freq = 1430, glissHz = 500, chirpDur = 0.2, amp = 0.01;
	var freqGliss, env, snd;
	freqGliss = Line.ar(0, glissHz, chirpDur);
	env = EnvGen.ar(Env.triangle(dur: chirpDur, level: amp), doneAction: 2);
	snd = LFPar.ar(freq + freqGliss, 0, env);
	Out.ar(0, Mix.ar(snd))
}).add;

SynthDef("cricket-bird", { arg freq = 1430, glissFreq = 10, glissHz = 500, chirpDur = 0.2, amp = 0.01;
	var freqGliss, env, snd;
	freqGliss = LFSaw.ar(glissFreq).range(0, glissHz);
	env = EnvGen.ar(Env.triangle(dur: chirpDur, level: amp), doneAction: 2);
	snd = LFPar.ar(freq + freqGliss, 0, env);
	Out.ar(0, Mix.ar(snd))
}).add;

SynthDef("reverb", { arg out = 0, mix = 0.5, room = 0.5, damp = 0.5, gate = 1;
	var env, in, fx;
	env = Linen.kr(gate, 0.05, 1, 0.1, doneAction: 2);
	in = In.ar(out, 1);
	fx = FreeVerb.ar(in, mix: mix, room: room, damp: damp);
	XOut.ar(out, env, Mix(fx));
}).add;

"End of SynthDefs file".postln;











// Version below is less preferred: too homogeneous gliss (by ratio).
// The other one above has subtle irregular changes
// in beatings as it glisses because we add
// a fixed Hz value to each freq.

/* SynthDef("cricket-gliss-2", { arg freq = 1430, glissRatio = 1.5, chirpDur = 0.2, amp = 0.01;
	var freqGliss, env, snd;
	freqGliss = Line.ar(freq, freq*glissRatio, chirpDur);
	env = EnvGen.ar(Env.triangle(dur: chirpDur, level: amp), doneAction: 2);
	snd = LFPar.ar(freqGliss, 0, env);
	Out.ar(0, Mix.ar(snd))
}).add;
*/
