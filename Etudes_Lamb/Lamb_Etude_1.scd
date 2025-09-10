s.boot;

( // Method for passing a LF noise signal thru a linear resonance envelope
{
var signal, envelope, filter;

	signal=RHPF.ar(BrownNoise.ar([0.5,0.5], -0.49).max(0) * 20, 5000, 1);
	envelope=MouseX.kr(500,2500);
	filter=Resonz.ar(signal,envelope,0.05);
	filter; // Return the filter to play the sound

}.scope;
)


(
// police state
var n;
n = 4;	// number of sirens
play({
	CombL.ar(
		Mix.arFill(n, {
			Pan2.ar(
				SinOsc.ar(
					SinOsc.kr(0.1.rand + 0.02, 2pi.rand, 600.rand, 1000 + 300.rand2),
					0,
					LFNoise2.ar(100 + 20.0.rand2, 0.1)
				),
				1.0.rand2
			)
		})
		+ LFNoise2.ar(LFNoise2.kr([0.4,0.4], 90, 620), LFNoise2.kr([0.3,0.3], 0.15, 0.18)),
		0.3, 0.3, 3)

}))

( // Method for passing a LF noise signal thru a linear resonance envelope
{
var signal, envelope, filter;

	signal=RHPF.ar(BrownNoise.ar([0.5,0.5], -0.49).max(0) * 20, 5000, 1);
	envelope=MouseX.kr(500,2500);
	filter=Resonz.ar(signal,envelope,0.1);
	filter; // Return the filter to play the sound

}.scope;
)