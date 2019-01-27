extends Node2D

export var FireVisible= true
var scaley = 0

signal character_die_with_fire

func _ready():
	scaley = $Sprite.scale.y
	$Sprite.visible = FireVisible
	$Light2D.visible = FireVisible
func _process(delta):
	$Sprite.scale.y = rand_range(scaley-0.2,scaley+0.2)
	if rand_range(-2,2) > 0:
		$Sprite.flip_h = true
	else:
		$Sprite.flip_h = false
	


func _on_StaticBody2D_body_entered(body):
	emit_signal("character_die_with_fire")
