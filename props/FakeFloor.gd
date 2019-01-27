extends Node2D

export var limit = 2

var hit = 0

func _ready():
	hit = 0

func _on_Area2D_body_entered(body):
	print("Golpeo piso: ", hit, ', limit: ', limit)
	if hit >= limit:
		$AnimationPlayer.play("fakefloordown")
	position.y += 1
	hit += 1
