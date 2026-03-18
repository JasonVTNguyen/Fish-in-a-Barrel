extends Node

var items : Dictionary[int, Item] = {
	0 : Item.new("Test Item", "SHOOTING", "This is a test item.", 15.0, 8),
	1 : Item.new("Test Lamb", "SHOOTING", "This items tests lambda.", 25.0, 2, 1.0, "bait_multiplier"),
}

var weapons : Dictionary[int, Gun] = {
	0 : Gun.new("Pistol", 5, 5000, 20, 10),
	1 : Gun.new("Shotgun", 15, 5000, 20, 10),
	2 : Gun.new("Sniper", 50, 150, 5, 5),
}

var weapon_upgrades : Dictionary[int, Upgrade] = {
	0 : Bullet_Upgrade.new("FLAT_DMG", "Test Bullets", 3)
}

var hooks : Dictionary[int, Hook] = {
	0 : Hook.new("Starter Hook", 0),
	1 : Hook.new("Elite Hook", 5)
}
