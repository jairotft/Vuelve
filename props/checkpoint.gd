extends Area2D

export var checkpointID = ""
export var music_mode = false
export var musicpath = ""
export var save_checkpoint = true
signal touched

func _on_Node2D_body_entered(body):
	if save_checkpoint:
		global.checkpoint = global.posicionplayer
	if music_mode:
		global.setsong(musicpath)
	#global.checkpointID = checkpointID
	emit_signal("touched")
	queue_free()
