extends Node

var items : Dictionary[int, Item] = {
	0 : Item.new("Test Item", "SHOOTING", "This is a test item.", 8)
}

var weapons : Dictionary[int, Gun] = {
	0 : Gun.new("Pistol", 5, 5000, 20, 10),
	1 : Gun.new("Shotgun", 15, 5000, 20, 10),
	2 : Gun.new("Sniper", 50, 150, 5, 5),
	3 : Gun.new("Nuke", 999999999999, 1, 1, 1),
}

var weapon_upgrades : Dictionary[int, Upgrade] = {
	0: Bullet_Upgrade.new("FLAT_DMG", "Test Bullets", 3)
}
