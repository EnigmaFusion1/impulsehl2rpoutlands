impulse.Rocket = impulse.Rocket or {}
impulse.Rocket.Data = impulse.Rocket.Data or {}

sound.Add({
	name = "impulseRocketAlertLoop1",
	channel = CHAN_AUTO,
	volume = 0.8,
	level = 65,
	pitch = 100,
	sound = "ambient/levels/launch/WarningSFX01_Loop.wav"
})

sound.Add({
	name = "impulseRocketAlertLoopFinal",
	channel = CHAN_AUTO,
	volume = 1,
	level = 70,
	pitch = 50,
	sound = "ambient/levels/launch/WarningSFX02_Loop.wav"
})