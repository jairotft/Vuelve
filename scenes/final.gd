extends Node2D
func _process(delta):
	if Input.is_action_just_released("ui_cancel"):
		_on_VideoPlayer_finished()
func _ready():
	global.pausemusic()

func _on_VideoPlayer_finished():
	global.transition("res://scenes/Inicio.tscn")
