extends Node2D

export var limit = 2

var hit = 0

func _ready():
	hit = 0


func _on_Area2D_body_shape_entered(body_id, body, body_shape, area_shape):
	print("Golpeo piso: ", hit, ', limit: ', limit)
	if hit >= limit:
		$Area2D/CollisionShape2D.disabled = true
	hit += 1