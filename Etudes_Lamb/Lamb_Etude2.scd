s.boot;

(// bubbles from bubbles_acloserlook
{
	var k, f, a, mod1, mod2;
	mod1 = LFSaw.kr(8);
	mod1 = mod1.range( 78, 84);

	mod2 = LFSaw.kr(7.23);					// define the second modulator
	mod2 = mod2.range( 78, 84);

	k = LFSaw.kr(0.4) * 24 + [mod1, mod2];	// use the second modulator
	f = k.midicps;                          // convert from MIDI key numbers (where 60 = Middle C )
	                                        // to frequencies (where 261.6255653006 Cycles per Second = middle C)
	a = SinOsc.ar(f) * 0.04;                // apply that to the frequency of a sine tone and make it 24dB softer
	CombN.ar(a, 0.2, 0.2, 4)
}.play
)


~np= NodeProxy.new.play;

( ~np[0] =
    {
	|m1lo=78, m1hi=84, m2lo=78, m2hi=84, maxdt=0.2, dt=0.2, decay=4|
	var k, f, a, mod1, mod2;
	mod1 = LFSaw.kr(8);
	mod1 = mod1.range( m1lo, m1hi);

	mod2 = LFSaw.kr(7.23);
	mod2 = mod2.range( m2lo, m2hi);

	k = LFSaw.kr(0.4) * 24 + [mod1, mod2];
	f = k.midicps;
	a = SinOsc.ar(f) * 0.04;
	CombN.ar(a, maxdt, dt, decay)
    };
)

~np.gui


~np.removeLast;



// original from SC2-examples
(
// sweepy noise - mouse controls LFO
{
	var lfoDepth, lfoRate, freq, filtered;
	lfoDepth = MouseY.kr(200, 8000, 'exponential');
	lfoRate = MouseX.kr(4, 60, 'exponential');
	freq = LFSaw.kr(lfoRate, 0, lfoDepth, lfoDepth * 1.2);
	filtered = RLPF.ar(WhiteNoise.ar([0.03,0.03]), freq, 0.1);
	CombN.ar(filtered, 0.3, 0.3, 2, 1, filtered);
}.play
)


~np= NodeProxy.new.play

( ~np[0] =
{
	|minv1=200, maxv1=8000, minv2=4, maxv2=60|
	var lfoDepth, lfoRate, freq, filtered;
	lfoDepth = MouseY.kr(minv1, maxv1, 'exponential');
	lfoRate = MouseX.kr(minv2, maxv2, 'exponential');
	freq = LFSaw.kr(lfoRate, 0, lfoDepth, lfoDepth * 1.2);
	filtered = RLPF.ar(WhiteNoise.ar([0.03,0.03]), freq, 0.1);
	CombN.ar(filtered, 0.3, 0.3, 2, 1, filtered);
};
)


~np.gui



~np.removeLast;


//a rebuild of an example from nodeproxybasics. Very similar ot original but with varried waveshapes and values. built from memory as best as i could.

~np= NodeProxy.new.play

( ~np [0..2] =
    {
	|lo=0.5, frek=35|
	var rhythm = exprand(0.5, 4);
	var pitch = SinOsc.ar(lo*rhythm).exprange(1,frek);
	var pulse = LFSaw.ar(rhythm).range(0,0.1);
	LFSaw.ar(50*pitch, 0, pulse);
};
)

~np.gui




