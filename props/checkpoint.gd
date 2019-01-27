extends Area2D

export var checkpointID = ""
export var music_mode = false
export var musicpath = ""

func _on_Node2D_body_entered(body):
	global.checkpoint = global.posicionplayer
	if music_mode:
		global.setsong(musicpath)
	#global.checkpointID = checkpointID
	queue_free()
