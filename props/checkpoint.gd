extends Area2D

export var checkpointID = ""

func _on_Node2D_body_entered(body):
	global.checkpoint = global.posicionplayer
	global.checkpointID = checkpointID
	queue_free()
