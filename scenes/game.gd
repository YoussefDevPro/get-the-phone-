extends Node2D

var time_passed := 0.0
const CHANGE_TIME := 180.0

func _process(delta: float) -> void:
	time_passed += delta

	if time_passed >= CHANGE_TIME:
		get_tree().change_scene_to_file("res://scenes/win.tscn")
