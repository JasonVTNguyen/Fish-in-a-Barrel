extends Area2D

@onready var fishingnode : Node2D = get_parent().get_parent()
@onready var fish: CharacterBody2D = get_parent()
	
func _input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("Select"):
		send_fish()

func send_fish() -> void:
	fishingnode.makeFish(fish)

func set_attract_mode() -> void:
	fish.set_attract_mode()

func set_wander_mode() -> void:
	fish.set_wander_mode()
