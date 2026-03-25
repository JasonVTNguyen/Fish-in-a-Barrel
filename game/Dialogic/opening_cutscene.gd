extends Node

func _ready() -> void:
	Dialogic.start("res://game/Dialogic/timelines/abridged_intro.dtl")
	
func _on_skip_cutscene_button_pressed() -> void:
	Dialogic.end_timeline()
	GameController.start_game()
