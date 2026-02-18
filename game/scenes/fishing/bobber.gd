extends Sprite2D


var is_placed : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not is_placed:
		position = get_viewport().get_mouse_position()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Select"):
		is_placed = true
	if event.is_action_pressed("Cancel"):
		if is_placed:
			is_placed = false


func _on_attraction_range_area_entered(area: Area2D) -> void:
	if is_placed:
		print("Fish Detected at: " + str(area.name))
	pass


func _on_fish_collider_area_entered(area: Area2D) -> void:
	if is_placed:
		("Fish Touched")
	pass
